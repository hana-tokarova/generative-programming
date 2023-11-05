import processing.pdf.*;


FlowField flowfield;
ArrayList<Particle> particles;

boolean debug = false;
boolean savePDF = true;

int res = 20;

String timestamp;

void setup() {
  size(800, 800);
  background(#084921);  
  //randomSeed(0);
  //noiseSeed(0);
  
  flowfield = new FlowField(res);
  flowfield.initialize();

  particles = new ArrayList<Particle>();
  for (int i = 0; i < 50; i++) {
    int relativeX = floor(random(width / res));
    int relativeY = floor(random(height / res));
    PVector start = new PVector(relativeX * res, relativeY * res);
    flowfield.capacity[relativeY][relativeX] = true;
    
    particles.add(new Particle(start));
  }
  
  if (savePDF) {
    timestamp = year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2);
    beginRecord(PDF, "pdf/circuit_" + timestamp + ".pdf");
    println("Started creating a .pdf ...");
  }
}

void draw() {     
  for (Particle p : particles) {
    p.run();
  }
  
  if (debug) flowfield.display();
}

void mousePressed() {
  if (savePDF) {
    endRecord();
    println("Screenshot saved as .pdf!"); 
  }
}
