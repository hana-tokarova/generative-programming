import processing.pdf.*;


FlowField flowfield;
ArrayList<Particle> particles;

boolean debug = false;
boolean savePDF = true;

int res = 20;
int multiplier = 3;

String timestamp;

void setup() {
  size(800, 800);
  background(#FFFFFF);

  flowfield = new FlowField(res);
  flowfield.initialize();

  particles = new ArrayList<Particle>();
  for (int i = 0; i < 100; i++) {
    int relativeX = floor(random(width / res));
    int relativeY = floor(random(height / res));
    PVector start = new PVector(relativeX * res, relativeY * res);
    flowfield.capacity[relativeY][relativeX] = true;

    particles.add(new Particle(start));
  }

  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  beginRecord(PDF, "pdf/circuit_" + timestamp + ".pdf");
  println("Started creating a .pdf ...");
}

void draw() {
  for (Particle p : particles) {
    p.run();
  }

  if (debug) flowfield.display();
}

void keyPressed() {
  switch(key) {
  case 's':
    endRecord();
    timestamp = year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
    beginRecord(PDF, "pdf/circuit_" + timestamp + ".pdf");
    
    background(#FFFFFF);
    
    multiplier = round(random(1, 10));

    flowfield = new FlowField(res);
    flowfield.initialize();

    particles = new ArrayList<Particle>();
    for (int i = 0; i < 100; i++) {
      int relativeX = floor(random(width / res));
      int relativeY = floor(random(height / res));
      PVector start = new PVector(relativeX * res, relativeY * res);
      flowfield.capacity[relativeY][relativeX] = true;
      particles.add(new Particle(start));
    }
    break;
  }
}
