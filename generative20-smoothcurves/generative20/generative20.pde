import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 100;
float radius = 175;

void setup() {
  size(1000, 1000);
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
  fill(255, 0, 0);
}

void draw() {
  background(255);
  drawVector();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    redraw();
  } else if (mouseButton == RIGHT) {
    drawVector();
  }
}

void keyPressed () {
  if (key == RETURN || key == ENTER) {
    String uuid = UUID.randomUUID().toString();
    save(uuid + ".tif");
  }
}

void drawVector() {
  float x1 = random(MARGIN, WIDTH-MARGIN);
  float x2 = random(MARGIN, WIDTH-MARGIN);
  float y1 = random(MARGIN, HEIGHT-MARGIN);
  float y2 = random(MARGIN, HEIGHT-MARGIN);
  float cpx1 = random(MARGIN, WIDTH-MARGIN);
  float cpx2 = random(MARGIN, WIDTH-MARGIN);
  float cpy1 = random(MARGIN, HEIGHT-MARGIN);
  float cpy2 = random(MARGIN, HEIGHT-MARGIN);  
  drawCurve(x1, x2, y1, y2, cpx1, cpx2, cpy1, cpy2);
  for (int i = 0; i < 4; i++) {
    if (i % 2 == 0) {
      x1 = random(MARGIN, WIDTH-MARGIN);
      y1 = random(MARGIN, HEIGHT-MARGIN);
      cpx1 = random(MARGIN, WIDTH-MARGIN);
      cpy1 = random(MARGIN, HEIGHT-MARGIN);
      drawCurve(x1, x2, y1, y2, cpx1, cpx2, cpy1, cpy2);
    } else {
      x2 = random(MARGIN, WIDTH-MARGIN);
      y2 = random(MARGIN, HEIGHT-MARGIN);
      cpx2 = random(MARGIN, WIDTH-MARGIN);
      cpy2 = random(MARGIN, HEIGHT-MARGIN);
      drawCurve(x1, x2, y1, y2, cpx1, cpx2, cpy1, cpy2);
    }
  }
}

void drawCurve(float x1, float x2, float y1, float y2, float cpx1, float cpx2, float cpy1, float cpy2) {
  float numLines = 1000;
  int lineDensity = 350;
  float shapeWidth = 60;
  for (int line = 0; line <= lineDensity; line++) {
    for (int i = 0; i < numLines; i++) {
      float t = i / numLines;
      float x = bezierPoint(cpx1, x1, x2, cpx2, t);
      float y = bezierPoint(cpy1, y1, y2, cpy2, t);
      float transp = random(0, 100);
      stroke(0, 0, 0, transp);
      float adjustment = map(line, 0, lineDensity, -shapeWidth, shapeWidth);
      point(x+adjustment, y+adjustment);
    }
  }
}