import java.util.UUID;
import processing.svg.*;

// doc knobs
final float WIDTH = 1000;
final float HEIGHT = 1000;
final int MARGIN = 350;

// shape knobs
final int pointVariance = 250;
final int cpVariance = 500;
final int numCurves = 3;

// curve knobs
final float density = 150;
final int maxVersion = 200;
final float lineWidth = 80;
 
void setup() {
  size(1000,1000,SVG,"out.svg");
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(255);
  drawShape();
  exit();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    redraw();
  } 
  else if (mouseButton == RIGHT) {
    drawShape();
  }
}

void keyPressed () {
  if (key == RETURN || key == ENTER) {
    String uuid = UUID.randomUUID().toString();
    save(uuid + ".tif");
  }
}

void drawShape() {
  float x1 = random(MARGIN,WIDTH-MARGIN);
  float x2 = random(MARGIN,WIDTH-MARGIN);
  float y1 = random(MARGIN,HEIGHT-MARGIN);
  float y2 = random(MARGIN,HEIGHT-MARGIN);
  float cpx1 = random(MARGIN,WIDTH-MARGIN);
  float cpx2 = random(MARGIN,WIDTH-MARGIN);
  float cpy1 = random(MARGIN,HEIGHT-MARGIN);
  float cpy2 = random(MARGIN,HEIGHT-MARGIN);
  
  drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);
  for (int i = 0; i < numCurves; i++) {
    if (i % 2 == 0) {
       x1 = random(x1-pointVariance,x1+pointVariance);
       y1 = random(y1-pointVariance,y1+pointVariance);
       cpx1 = random(cpx1-cpVariance,cpx1+cpVariance);
       cpy1 = random(cpy1-cpVariance,cpy1+cpVariance);
       drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);
    }
    else {
       x2 = random(x2-pointVariance,x2+pointVariance);
       y2 = random(y2-pointVariance,y2+pointVariance);
       cpx2 = random(cpx2-cpVariance,cpx2+cpVariance);
       cpy2 = random(cpy2-cpVariance,cpy2+cpVariance);
       drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);      
    }
  }
  
}

void drawCurve(float x1, float x2, float y1, float y2, float cpx1, float cpx2, float cpy1, float cpy2) {
  for (int version = 0; version <= maxVersion; version++) {
    for (int i = 0; i < density; i++) {
      float t = i / density;
      float x = curvePoint(cpx1, x1, x2, cpx2, t);
      float y = curvePoint(cpy1, y1, y2, cpy2, t);
      stroke(0,0,0);
      float adjustment = map(version,0,maxVersion,-lineWidth,lineWidth);
      point(x+adjustment, y+adjustment);
    }  
  }
}
