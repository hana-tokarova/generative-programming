// Class for particle
// You can change up as many parameters as you like - experiment!

public class Particle {
	float x = mouseX;
	float y = mouseY;
	
	float easing = 0.01;	// Try also 0.01 0.001 0.0001!
	float weight = 1;		// Weight of the stroke
	float start = 300;		// Start for gradient
  float start0 = start;
	float alpha = 100;
	float incrementS = 1;
	float incrementA = 1;
	
	boolean pause = false;
	
	int length = 500; // round(random(300, 700));
	
	void show() {
		if (length > 0 && !pause) {
			colorMode(HSB, 360, 100, 100, 100);
			
			// Uncomment for gradient effect!
			start += incrementS;
			// alpha -= incrementA;
			
			if (start % 360 > start0 % 360 || start % 360 < start0 % 360 / 5) incrementS *= - 1;
			// if (alpha > 100 || alpha < 0) incrementA *= - 1;
			stroke(start, 75, alpha);
			
			// Uncomment for white stroke!
			// stroke(0, 0, 100);
			
			strokeWeight(weight);
			point(x, y);
		}
	}
	
	void move() {
		if (length > 0 && !pause) {
			// Noise function for vectors
			float theta = noise(this.x * 1 / 200, this.y * 1 / 200) * PI * 5;
			PVector vector = PVector.fromAngle(theta);
			
			// Computing acceleration
			float dx = mouseX - x; //pmouseX - pmouseX
			float dy = mouseY - y;
			x += dx * easing + vector.x;
			y += dy * easing + vector.y;
			length--;
		}
	}
	
	void pauseNoise() {
		pause = !pause;
	}
	
	void stopNoise() {
		length = 0;
	}
}
