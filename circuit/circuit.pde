import processing.pdf.*;


FlowField flowfield;
ArrayList<Particle> particles;

boolean debug = false;
boolean savePDF = true;

String timestamp;

void setup() {
  size(1400, 800);
  background(#084921);  
  surface.setTitle("Circuit");
  
  randomSeed(0);
  noiseSeed(0);
  
  flowfield = new FlowField(max(width/50, height/50));
  flowfield.initialize();

  particles = new ArrayList<Particle>();
  for (int i = 0; i < 300; i++) {
    PVector start = new PVector(random(width), random(height));
    particles.add(new Particle(start));
  }
  
  if (savePDF) {
    timestamp = year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2);
    beginRecord(PDF, "svg/circuit_" + timestamp + "_####.pdf");
    println("Started creating a .pdf ...");
  }
}

void draw() {     
  if (debug) flowfield.display();
  
  for (Particle p : particles) {
    p.follow(flowfield);
    p.run();
  }
}

void mousePressed() {
  endRecord();
  println("Screenshot saved as .pdf!"); 
}
