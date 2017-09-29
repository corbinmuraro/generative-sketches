import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 50;

void setup() {
  size(1000,1000);
  noFill();
  smooth(4);
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(255);
  drawPaper();
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
  float x1,y1,x2,y2;
  float xoff = 0;
  float yoff = 500;
   
  x1 = random(MARGIN,WIDTH/4);
  y1 = random(MARGIN,HEIGHT/4);
  x2 = random(x1+MARGIN,WIDTH-MARGIN);
  y2 = y1;
    
  while ((y1 < HEIGHT-50) && (y2 < HEIGHT-50)) {
    float xShift = map(noise(xoff),0,1,-0.2,0.5);
    float yShift = map(noise(yoff),0,1,-1,2);

    x1 += xShift;
    y1 += yShift;
    x2 += xShift;
    y2 += yShift;
    
    float density = 1000;
    for (int i = 0; i < density; i++) {
      float transp = random(0,50);
      float x = lerp(x1, x2, i/density);
      float y = lerp(y1, y2, i/density);
      stroke(0,0,0,transp);
      point(x, y);
    }
    
    xoff += 0.007;
    yoff += 0.003;
  }
}