import processing.svg.*;

static int padding = 100;

static int rectCols = 20;
static int rectRows = 6;
static int rectH = 160;
static int rectW = 12;

void setup() {
  //size(800, 800, SVG, "filename.svg");
  size(800,800);
  background(255);
  //stroke(0);
  stroke(255,0,0);
  
  strokeWeight(1);
  noFill();

  noLoop();
}

void draw() {  
  int xIncrement = int(random(6,14));
  for (int x = padding; x < width - padding; x += xIncrement) {
    
    int yIncrement = int(random(120,140));
    for (int y = yIncrement; y < height - padding; y+= 200) {
      rect(x, y, rectW, rectH);
    }
    
    xIncrement = int(random(6,14));
  }
  
  //exit();
}
