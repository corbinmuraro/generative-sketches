import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 50;

ArrayList<PVector> drawnPoints = new ArrayList<PVector>();

void setup() {
  size(1000,1000);
  noFill();
  smooth(4);
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(255);
  for (int i = 0; i < 12; i++) {
    drawPaper();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    redraw();
  } 
  else if (mouseButton == RIGHT) {
    drawPaper();
  }
}

void keyPressed () {
  if (key == RETURN || key == ENTER) {
    String uuid = UUID.randomUUID().toString();
    save(uuid + ".tif");
  }
}

void drawPaper() {
  float x1 = random(MARGIN,WIDTH-MARGIN);
  float x2 = random(MARGIN,WIDTH-MARGIN);
  float y1 = random(MARGIN,HEIGHT-MARGIN);
  float y2 = random(MARGIN,HEIGHT-MARGIN);
  float cpx1 = random(MARGIN,WIDTH-MARGIN);
  float cpx2 = random(MARGIN,WIDTH-MARGIN);
  float cpy1 = random(MARGIN,HEIGHT-MARGIN);
  float cpy2 = random(MARGIN,HEIGHT-MARGIN);

  float density = 50;
  for (int i = 0; i < density; i++) {
    float t = i / density;
    float x = curvePoint(cpx1, x1, x2, cpx2, t);
    float y = curvePoint(cpy1, y1, y2, cpy2, t);
    float transp = random(0,50);
    stroke(0,0,0,transp);
    point(x, y);
    drawnPoints.add(new PVector(x,y));
  }
  
  for (PVector p: drawnPoints) {
    for (PVector q: drawnPoints) {
      if (p != q) {
        for (int i = 0; i < density; i++) {
          float transp = random(0,50);
          float x = lerp(p.x, q.x, i/density);
          float y = lerp(p.y, q.y, i/density);
          stroke(0,0,0,transp);
          point(x, y);
        }
      }
    }
  }
}