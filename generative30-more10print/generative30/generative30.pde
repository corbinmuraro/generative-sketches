void setup() {
  size(800,800);
  noFill();
  strokeWeight(1.5);
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
  
  step = 6;
}

int step;
int padding = 40;
float leftDiagonal = 0.4;
float rightDiagonal = 0.4;
float squareSide = 0.05;

void draw() {
  background(255);
  translate(padding,padding);
  for (int y = 0; y < height-(2*padding); y += step) {
    for (int x = 0; x < width-(2*padding); x += step) {
      
      float rand = random(0,1);
      if (rand < 0.3) {
        line(x, y, x+step, y+step); // left diag
      }
      else if (rand > 0.7) {
        line(x+step, y, x, y+step); // right diag
      }
      else {
       if (random(0,1) < 0.3) {
         line(x, y, x+step, y); // top square
       }
       if (random(0,1) < 0.3) {
         line(x, y, x, y+step); // left square
       }
      }
    }
  }
}

void keyPressed() {
  if (key == ENTER) {
    saveFrame();
  }
}
