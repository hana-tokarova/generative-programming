ArrayList<Symbol> symbols;
PImage img;
int size = 20;

void setup() {
  size(1920, 1200);
  background(13);

  img = loadImage("essentials/cat.jpg");
  img.loadPixels();
  PFont matrix = createFont("essentials/matrix.ttf", size);
  textFont(matrix);

  symbols = new ArrayList<Symbol>();
  frameRate(25);
}

void draw() {
  background(13);

  for (int i = 0; i < (int) random(2, 5); i++) {
    int x = (int) random(0, width);
    symbols.add(new Symbol(x - x % size, 0, size, (int) random(13, 18)));
  }

  for (Symbol p : symbols) {
    p.run();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("results/matrix_##.png");
    println("Screenshot saved as .png!");
  }
}
