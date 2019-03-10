import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 150;

void setup() {
  size(1000,1000);
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
  fill(255,0,0);
}

void draw() {
  background(255);
  for (int i = 0; i < 100; i++) {
    drawVector();
  }
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
  float y1 = random(MARGIN,HEIGHT-MARGIN);
  float x2 = random(MARGIN,WIDTH-MARGIN);
  float y2 = random(MARGIN,HEIGHT-MARGIN);
  drawLine(x1,y1,x2,y2);
  
  float yoff1 = random(0,50);
  float yoff2 = random(-50,0);
  while ((x1 < WIDTH-MARGIN) && (x1 > MARGIN) && (x1 < WIDTH-MARGIN) && (x1 > MARGIN) 
    && (y1 < HEIGHT-MARGIN) && (y1 > MARGIN) && (y2 < HEIGHT-MARGIN) && (y2 > MARGIN))
  {
    x1 += map(noise(yoff2),0,1,-1,1);
    y1 += map(noise(yoff1),0,1,-1,1);    
    //y2 += 5;
    drawLine(x1,x2,y1,y2);

    yoff1 += 0.01;
    yoff2 += 0.01;
  }
}

void drawLine(float x1, float x2, float y1, float y2) {
  int lineDensity = 150;
  for (int line = 0; line <= lineDensity; line++) {
    float transp = random(0,100);
    float x = lerp(x1,x2,line/lineDensity);
    float y = lerp(y1,y2,line/lineDensity);
    stroke(0,0,0,transp);
    point(x, y);
  }  
}