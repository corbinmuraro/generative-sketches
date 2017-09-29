import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 100;

float density = 5;

void setup() {
  size(1000,1000);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(255);
  
  float xoff = 0;
  for (float x = 0; x < WIDTH; x += density) {
    float yoff = 0;
    for (float y = 0; y < HEIGHT; y += density) {
      float transp = map(noise(xoff,yoff),0,1,0,50);
      stroke(0,0,0,transp);
      point(x,y);
      yoff += 0.01;
    }
    xoff += 0.01;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    redraw();
  } 
  //else if (mouseButton == RIGHT) {
  //  drawCloud();
  //}
}

void keyPressed () {
  if (key == RETURN || key == ENTER) {
    String uuid = UUID.randomUUID().toString();
    save(uuid + ".tif");
  }
}