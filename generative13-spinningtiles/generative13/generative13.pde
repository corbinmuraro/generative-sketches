import java.util.UUID;

float WIDTH = 800;
float HEIGHT = 800;
int SCALE = 20;
int ROWS = floor(HEIGHT / SCALE);
int COLS = floor(WIDTH / SCALE);

void setup() {
  size(800,800, P3D);
  fill(0);
  noStroke();
  pixelDensity(displayDensity());
  background(255);
}

float inc = 0.01;
float zoff = 0;
void draw() {  
  background(255);
  float yoff = 0;
  for (int y = 0; y < ROWS; y++) {
    float xoff = 0;
    for (int x = 0; x < COLS; x++) {
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