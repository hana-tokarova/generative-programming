
public class Particle {
  PVector pos;
  PVector vel;
  PVector acc;

  boolean start = true;

  Particle(PVector start) {
    pos = start;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void run() {
    edges();
    follow();
  }

  void follow() {
    strokeWeight(3);
    stroke(#4a8b63);

    if (start) {
      fill(#4a8b63);
      circle(pos.x, pos.y, 7);
      start = !start;
    } else {
      point(pos.x, pos.y);
    }
    
    int x = floor(pos.x / flowfield.scl);
    int y = floor(pos.y / flowfield.scl);
    PVector direction = flowfield.vectors[y][x];
    
    line(pos.x, pos.y, pos.x + direction.x * res, pos.y + direction.y * res); // todo ked to bude uhlopriecka bude to trochu dlhsie
    
    pos.x += direction.x * res;
    pos.y += direction.y * res;

    //updatePreviousPos();
  }

  void edges() {
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.y > height) {
      pos.y = 0;
    }
    if (pos.y < 0) {
      pos.y = height;
    }
  }
}
