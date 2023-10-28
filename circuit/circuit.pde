
FlowField flowfield;
ArrayList<Particle> particles;

boolean debug = false;

void setup() {
  size(1400, 800);
  background(#084921);
  
  flowfield = new FlowField(max(width/50, height/50));
  flowfield.initialize();

  particles = new ArrayList<Particle>();
  for (int i = 0; i < 200; i++) {
    PVector start = new PVector(random(width), random(height));
    particles.add(new Particle(start));
  }
}

void draw() {
  if (debug) flowfield.display();
  
  for (Particle p : particles) {
    p.follow(flowfield);
    p.run();
  }
}
