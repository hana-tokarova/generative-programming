
public class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector previousPos;

  int len;
  int lenCopy;

  Particle(PVector start) {
    pos = start;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    previousPos = pos.copy();
    len = round(random(100, 500));
    lenCopy = len;
  }

  void run() {
    edges();
    
    if (len > 0) {
      show();
    }
  }

  void show() {
    strokeWeight(3);
    stroke(#4a8b63, 100);

    if ((len == lenCopy) || len < 2) {
      fill(#4a8b63);
      circle(pos.x, pos.y, 10);
    } else {
      point(pos.x, pos.y);
    }

    updatePreviousPos();
    len--;
  }

  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePreviousPos();
    }
    if (pos.x < 0) {
      pos.x = width;
      updatePreviousPos();
    }
    if (pos.y > height) {
      pos.y = 0;
      updatePreviousPos();
    }
    if (pos.y < 0) {
      pos.y = height;
      updatePreviousPos();
    }
  }

  void updatePreviousPos() {
    this.previousPos.x = pos.x;
    this.previousPos.y = pos.y;
  }

  void follow(FlowField flowfield) {
    int x = floor(pos.x / flowfield.scl);
    int y = floor(pos.y / flowfield.scl);
    int index = x + y * flowfield.cols;

    PVector direction = flowfield.vectors[index];

    pos.x += direction.x;
    pos.y += direction.y;
  }
}
