
public class Particle {
  PVector pos;
  boolean start = true;
  boolean alive = true;

  Particle(PVector start) {
    pos = start;
  }

  void run() {
    if (alive) {
      edges();
      follow();
    }
  }

  void follow() {
    strokeWeight(3);
    stroke(#000000);

    if (start) {
      fill(#000000);
      circle(pos.x, pos.y, 7);
      start = !start;
    } else {
      point(pos.x, pos.y);
    }
    
    int x = floor(pos.x / flowfield.scl);
    int y = floor(pos.y / flowfield.scl);
    PVector direction = flowfield.vectors[y][x];
    
    int newX = x;
    int newY = y;
 
    if (direction.x > 0.1) {
      newX += 1;
    } else if (direction.x < -0.1) {
      newX -= 1;
    }
    
    if (newX * res > width || newX < 0) {
       kill();
       return;
    }
    
    if (direction.y > 0.1) {
      newY += 1;
    } else if (direction.y < -0.1) {
      newY -= 1;
    }
    
    if (newY * res > height || newY < 0) {
      kill();
      return;
    }
    
    
    if (flowfield.capacity[newY][newX]) {
       kill();
       return;
    }
    
    flowfield.capacity[newY][newX] = true;
    
    line(pos.x, pos.y, newX * res, newY * res);
    
    pos.x = newX * res;
    pos.y = newY * res;
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
  
  void kill() {
    alive = false;
    fill(#000000);
    circle(pos.x, pos.y, 7);
  }
}
