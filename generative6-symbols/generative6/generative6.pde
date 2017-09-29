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
  float lineHeight = WIDTH/50;
  float betweenLines = WIDTH/50;
  float currentX = MARGIN;
  float currentY = MARGIN;
  
  while (currentY < (HEIGHT - MARGIN)) {   
    
    float stringWidth = random(18,25);
    
    float x1 = random(currentX,currentX+stringWidth);
    float y1 = random(currentY,currentY+lineHeight);
    float cpx1 = random(currentX,currentX+stringWidth);
    float cpy1 = random(currentY,currentY+lineHeight);
    float x2 = random(currentX,currentX+stringWidth);
    float y2 = random(currentY,currentY+lineHeight);
    float cpx2 = random(currentX,currentX+stringWidth);
    float cpy2 = random(currentY,currentY+lineHeight);
    drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);
    
    for (int i = 0; i < stringWidth/10; i++) {
      if (i % 2 == 0) {
         x1 = random(currentX,currentX+stringWidth);
         y1 = random(currentY,currentY+lineHeight);
         cpx1 = random(currentX,currentX+stringWidth);
         cpy1 = random(currentY,currentY+lineHeight);
         drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);
      }
      else {
         x2 = random(currentX,currentX+stringWidth);
         y2 = random(currentY,currentY+lineHeight);
         cpx2 = random(currentX,currentX+stringWidth);
         cpy2 = random(currentY,currentY+lineHeight);
         drawCurve(x1,x2,y1,y2,cpx1,cpx2,cpy1,cpy2);      
      }
    }
    
    if (currentX > WIDTH - MARGIN) {
      // go to next line
      currentX = MARGIN;
      currentY = currentY + lineHeight + betweenLines;
    }
    else {
      // move to next position on the same line
      currentX += stringWidth;
    }
  }
}

void drawCurve(float x1, float x2, float y1, float y2, float cpx1, float cpx2, float cpy1, float cpy2) {
  float density = 35;
  int maxVersion = int(random(60,140));
  for (int version = 0; version <= maxVersion; version++) {
    for (int i = 0; i < density; i++) {
      float t = i / density;
      float x = curvePoint(cpx1, x1, x2, cpx2, t);
      float y = curvePoint(cpy1, y1, y2, cpy2, t);
      float transp = random(0,50);
      stroke(0,0,0,transp);
      float adjustment = map(version,0,maxVersion,-1,1);
      point(x+adjustment, y+adjustment);
    }  
  }
}