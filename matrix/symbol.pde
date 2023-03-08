
public class Symbol {
  PVector position;
  int symbolSize;
  int streamSize;
  int speed;

  Symbol(float x, float y, int symbol, int stream) {
    position = new PVector(x, y);
    symbolSize = symbol;
    streamSize = stream;
    speed = (int) random(symbolSize / 4, symbolSize / 2);
  }

  void draw(float x, float y, int b, int i) {
    if (y > 0 && y < height) {
      noStroke();
      if (img.pixels[(int) x + (int) y * width] == color(0, 0, 0)) {
        fill(#00ff41, 100);
        switch (i % 3) {
        case 0:
          text("c", x, y);
          break;
        case 1:
          text("a", x, y);
          break;
        case 2:
          text("t", x, y);
          break;
        }
      } else {
        fill(#008f11, b);
        text("" + char(int(random(97, 122))), x, y);
      }
    }
  }

  void run() {
    int intensity = 100 / streamSize;
    int brightness = 100;
    for (int i = 0; i < streamSize; i++) {
      draw(position.x, position.y - symbolSize * i, brightness, i);
      brightness -= intensity;
    }
    position.y += speed;
  }
}
