import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
float MARGIN = 100;
int SCALE = 10;
int ROWS = floor(HEIGHT / SCALE);
int COLS = floor(WIDTH / SCALE);
int adjustedMargin = floor(MARGIN / SCALE);

void setup() {
  size(1000,1000, P3D);
  noFill();
  stroke(0);
  strokeWeight(1);
  pixelDensity(displayDensity());
  background(255);
}

float inc = 0.008;
float zoff = 0;
void draw() {  
  background(255);
  float yoff = 0;
  for (float y = adjustedMargin; y < COLS - adjustedMargin; y++) {
    float xoff = 0;
    for (float x = adjustedMargin; x < ROWS - adjustedMargin; x++) {
      pushMatrix();
      translate(x*SCALE,y*SCALE,0);
      rotateY(map(noise(xoff,yoff,zoff),0,1,0,2*PI));
      rotateX(map(noise(xoff,yoff,zoff),0,1,0,2*PI));
      box(SCALE, SCALE, 2);
      popMatrix();
      xoff += inc;
    }
    yoff += inc;
  }
  zoff += 0.01;
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