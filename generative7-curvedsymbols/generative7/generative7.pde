import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 100;

void setup() {
  size(1000,1000);
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
  float currentX = 500;
  float currentY = 500;
  
  for (int j = 0; j < 1; j++) {   
    

    float radius = 800;
    
    float z = random(-radius,radius);
    float phi = random(0, 2*PI);
    
    float x1 = sqrt(sq(radius) - sq(z))*cos(phi);
    float y1 = sqrt(sq(radius)-sq(z))*sin(phi);
    z = random(0,radius);
    phi = random(0, 2*PI);
    float cpx1 = sqrt(sq(radius) - sq(z))*cos(phi);
    float cpy1 = sqrt(sq(radius)-sq(z))*sin(phi);
    z = random(0,radius);
    phi = random(0, 2*PI);
    float x2 = sqrt(sq(radius) - sq(z))*cos(phi);
    float y2 = sqrt(sq(radius)-sq(z))*sin(phi);
    z = random(0,radius);
    phi = random(0, 2*PI);
    float cpx2 = sqrt(sq(radius) - sq(z))*cos(phi);
    float cpy2 = sqrt(sq(radius)-sq(z))*sin(phi);
    drawCurve(x1+currentX,x2+currentY,y1+currentY,y2+currentY,cpx1+currentX,cpx2+currentX,cpy1+currentY,cpy2+currentY);      
    
    for (int i = 0; i < 100; i++) {
     if (i % 2 == 0) {
        z = random(0,radius);
        phi = random(0, 2*PI);
        x1 = sqrt(sq(radius) - sq(z))*cos(phi);
        y1 = sqrt(sq(radius)-sq(z))*sin(phi);
        z = random(0,radius);
        phi = random(0, 2*PI);
        cpx1 = sqrt(sq(radius) - sq(z))*cos(phi);
        cpy1 = sqrt(sq(radius)-sq(z))*sin(phi);
        drawCurve(x1+currentX,x2+currentY,y1+currentY,y2+currentY,cpx1+currentX,cpx2+currentX,cpy1+currentY,cpy2+currentY);      
     }
     else {
        z = random(0,radius);
        phi = random(0, 2*PI);
        x2 = sqrt(sq(radius) - sq(z))*cos(phi);
        y2 = sqrt(sq(radius)-sq(z))*sin(phi);
        z = random(0,radius);
        phi = random(0, 2*PI);
        cpx2 = sqrt(sq(radius) - sq(z))*cos(phi);
        cpy2 = sqrt(sq(radius)-sq(z))*sin(phi);
        drawCurve(x1+currentX,x2+currentY,y1+currentY,y2+currentY,cpx1+currentX,cpx2+currentX,cpy1+currentY,cpy2+currentY);      
     }
    }
  }
}

void drawCurve(float x1, float x2, float y1, float y2, float cpx1, float cpx2, float cpy1, float cpy2) {
  float density = 500;
  int maxVersion = 100;
  for (int version = 0; version <= maxVersion; version++) {
    for (int i = 0; i < density; i++) {
      float t = i / density;
      float x = curvePoint(cpx1, x1, x2, cpx2, t);
      float y = curvePoint(cpy1, y1, y2, cpy2, t);
      float transp = random(0,50);
      stroke(0,0,0,transp);
      float adjustment = map(version,0,maxVersion,-40,40);
      point(x+adjustment, y+adjustment);
    }  
  }
}