import java.util.UUID;

float WIDTH = 800;
float HEIGHT = 800;
int MARGIN = 100;
int OBJ_WIDTH = 100;
int OBJ_HEIGHT = 100;
float s = (WIDTH - (MARGIN * 2)) / 60;
float odds = 0.3;

void setup() {
  size(800,800);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(255);
  translate(MARGIN,MARGIN);
  for (int y = 0; y < HEIGHT-MARGIN-MARGIN; y += s) {
    for (int x = 0; x < WIDTH-MARGIN-MARGIN; x += s) {
      // Random forward or backward slash
      if (random(0,1) < odds) {
        line(x, y, x + s, y + s);
      } else {
        line(x + s, y, x, y + s);
      }
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    redraw();
  } 
}

void keyPressed () {
  if (key == RETURN || key == ENTER) {
    String uuid = UUID.randomUUID().toString();
    save(uuid + ".tif");
  }
}