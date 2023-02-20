// Hana Tokarova
// Perlin noise brush - its fun!

ArrayList<Particle> particles;
String timestamp;

boolean fading = false;
color background = color(0);


void mouseDragged() {
	particles.add(new Particle());
}

void mouseClicked() {
	particles.add(new Particle());
}

void setup() {
	//fullScreen(1);
  size(1200, 800);
	background(background);
	timestamp = year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2);
	particles = new ArrayList<Particle>();	
}

void draw() {
	// Drawing every particle
	for (Particle p : particles) {
		p.show();
		p.move();
	}

	// Fading effect
	if (fading) {
		fill(background, 10);
		rect(0, 0, width, height);
	}
}

void keyPressed() {
	colorMode(RGB, 255, 255, 255);
	switch(key) {
		case 's': // Save canvas
			saveFrame("hana_tokarova_perlin_noise_brush_" + timestamp + "_####.jpg");
			break;

		case 'c': // Clear canvas
			particles = new ArrayList<Particle>();
			background(background);
			break;

		case 'f': // Fading
			fading = !fading;
			break;

		case 'x': // Stop noise
			for (Particle p : particles) {
				p.stopNoise();
			}
			break;

		case ' ': // Pause noise
			for (Particle p : particles) {
				p.pauseNoise();
			}
			break;
	}
}
