import java.util.UUID;

float WIDTH = 800;
float HEIGHT = 800;
int SCALE = 20;
int ROWS = floor(HEIGHT / SCALE);
int COLS = floor(WIDTH / SCALE);

int numParticles = 5000;
Particle[] particles = new Particle[numParticles];
PVector[] flowfield;

void setup() {
  size(800,800);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  background(255);
  
  flowfield = new PVector[ROWS*COLS];
  
  for(int i = 0; i < numParticles; i++) {
    particles[i] = new Particle();
  }
}

float inc = 0.08;
float zoff = 0;

void draw() {  
  float yoff = 0;
  
  for (int y = 0; y < ROWS; y++) {
    float xoff = 0;
    for (int x = 0; x < COLS; x++) {
      int index = x + y * COLS;
      PVector v = PVector.fromAngle(map(noise(xoff,yoff,zoff),0,1,0,2*PI));
      v.setMag(0.5);
      flowfield[index] = v;
      //pushMatrix();
      //translate(x*SCALE, y*SCALE);
      //rotate(v.heading());
      //stroke(0,20);
      //line(0, 0, SCALE, 0);
      //popMatrix();
      xoff += inc;
    }
    yoff += inc;
  }
  
  for(int i = 0; i < numParticles; i++) {
    particles[i].follow(flowfield);
    particles[i].update();
    particles[i].show();
    particles[i].edges();
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