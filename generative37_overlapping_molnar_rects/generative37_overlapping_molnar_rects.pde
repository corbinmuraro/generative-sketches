import processing.svg.*;

static int padding = 100;

static int rectCols = 20;
static int rectRows = 6;
static int rectH = 250;
static int rectW = 18;

void setup() {
  //size(800, 800, SVG, "filename.svg");
  size(800,800);
  background(255);
  //stroke(0);
  stroke(255,0,0);
  
  strokeWeight(1.2);
  noFill();

  noLoop();
}

void draw() {  
  for (int y = 100; y < 500; y+= 240) {
    
    int xIncrement = int(random(24,30));
    int currentY = y;
    for (int x = padding; x < width - padding; x += xIncrement) {
      currentY += int(random(-5,5));
      rect(x, currentY, rectW, rectH);
      
      xIncrement = int(random(20,24));
    }
    
  }
  
  //exit();
}
