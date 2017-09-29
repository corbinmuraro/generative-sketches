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
  rotate(-PI/6);
  background(20);
  drawPaper();
}

float xoff = 0;

void drawPaper() {
  for (int i = 0; i < 200; i++) {
    stroke(random(188,255),random(150,255),255);
    rotate(randomGaussian() * 0.02);
    ellipse(125 + (randomGaussian()*20), 50 + (randomGaussian()*20), WIDTH, HEIGHT*2);
    xoff += 0.003;
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