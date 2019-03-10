import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 200;

float hue = random(0,1);
float saturation = 0.96;
float brightness = 0.70;

void setup() {
  size(1000,1000);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(10);
  colorMode(HSB, 1);
  hue = 0.0;
  drawVector();
  hue = 0.6;
  drawVector();
  hue = 0.0;
  drawVector();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    redraw();
  } 
  else if (mouseButton == RIGHT) {
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
  float x1 = random(MARGIN,WIDTH-MARGIN);
  float x2 = random(MARGIN,WIDTH-MARGIN);
  float y1 = random(MARGIN,HEIGHT-MARGIN);
  float y2 = random(MARGIN,HEIGHT-MARGIN);
  float cpx1 = random(MARGIN,WIDTH-MARGIN);
  float cpx2 = random(MARGIN,WIDTH-MARGIN);
  float cpy1 = random(MARGIN,HEIGHT-MARGIN);
  float cpy2 = random(MARGIN,HEIGHT-MARGIN);
  drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);
  for (int i = 0; i < random(1,6); i++) {
    if (i % 2 == 0) {
       x1 = random(MARGIN,WIDTH-MARGIN);
       y1 = random(MARGIN,HEIGHT-MARGIN);
       cpx1 = random(MARGIN,WIDTH-MARGIN);
       cpy1 = random(MARGIN,HEIGHT-MARGIN);
       drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);
    }
    else {
       x2 = random(MARGIN,WIDTH-MARGIN);
       y2 = random(MARGIN,HEIGHT-MARGIN);
       cpx2 = random(MARGIN,WIDTH-MARGIN);
       cpy2 = random(MARGIN,HEIGHT-MARGIN);
       drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);      
    }
  }
  
}

void drawCurve(float x1, float x2, float y1, float y2, float cpx1, float cpx2, float cpy1, float cpy2) {
  float density = 400;
  int maxVersion = 100;
  float lineWidth = random(50,75);
  for (int version = 0; version <= maxVersion; version++) {
    for (int i = 0; i < density; i++) {
      float t = i / density;
      float x = curvePoint(cpx1, x1, x2, cpx2, t);
      float y = curvePoint(cpy1, y1, y2, cpy2, t);
      float transp = random(0,100);
      stroke(hue,saturation,brightness,transp);
      float adjustment = map(version,0,maxVersion,-lineWidth,lineWidth);
      point(x+adjustment, y+adjustment);
    }  
  }
}