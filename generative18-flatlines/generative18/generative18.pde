import java.util.UUID;

float WIDTH = 2000;
float HEIGHT = 2000;
int MARGIN = 500;
int OBJ_WIDTH = 100;
int OBJ_HEIGHT = 100;

void setup() {
  size(2000,2000);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(255);
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
  for (int i = 0; i < random(4,8); i++) {
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
  float density = 500;
  int maxVersion = 1000;
  for (int version = 0; version <= maxVersion; version++) {
    for (int i = 0; i < density; i++) {
      float t = i / density;
      float x = curvePoint(cpx1, x1, x2, cpx2, t);
      float y = curvePoint(cpy1, y1, y2, cpy2, t);
      float transp = random(0,50);
      stroke(0,0,0,transp);
      float adjustment = map(version,0,maxVersion,-200,200);
      point(x+adjustment, y+adjustment);
    }  
  }
}