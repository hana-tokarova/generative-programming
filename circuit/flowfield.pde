
public class FlowField {
  PVector[] vectors;
  int cols, rows;
  float inc = 0.1;
  int scl;

  FlowField(int res) {
    scl = res;
    cols = floor(width / res) + 1;
    rows = floor(height / res) + 1;
    vectors = new PVector[cols * rows];
  }

  void initialize() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        float angle = noise(x * inc, y * inc) * PI * 4;
        angle = round(angle / (PI / 4)) * (PI / 4);
        PVector v = PVector.fromAngle(angle);
        vectors[y][x] = v;
      }
    }
  }

  void display() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        int index = x + y * cols;
        PVector v = vectors[index];

        stroke(255, 255, 255, 100);
        strokeWeight(0.1);
        pushMatrix();
        translate(x * scl, y * scl);
        rotate(v.heading());
        line(0, 0, scl, 0);
        popMatrix();
      }
    }
  }
}
