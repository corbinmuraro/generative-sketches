import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;

void setup() {
  size(1000,1000);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  background(0);
}

float r = 700;
float rSquared = r*r;

float centerX = 15;
float centerY = 150;

void draw() {  
  float x1 = 0;
  float y1 = 0;
  float x2 = 0;
  float y2 = 0;
    
  for (int i = 0; i < 500; i++) {
    // draw some protrusions from the moon
    if (random(0,10000) > 9998) {
      //x1 = random(0, WIDTH);
      //y1 = random(0,HEIGHT);
      
      for (int j = 0; j < random(250,1000); j++) {
        float angle2 = random(0,1)*TWO_PI;
        x2 = cos(angle2)*r + centerX;
        y2 = sin(angle2)*r + centerY;
        drawLine(x1,x2,y1,y2);
      }
    }
    
    
    // generate random points along circle perimeter
    float angle1 = random(0,1)*TWO_PI;
    x1 = cos(angle1)*r + centerX;
    y1 = sin(angle1)*r + centerY;
    
    float angle2 = random(0,1)*TWO_PI;
    x2 = cos(angle2)*r + centerX;
    y2 = sin(angle2)*r + centerY;
    
    // // generate random points inside a circle
    //while (sqrt(sq(abs(x1-centerX))+sq(abs(y1-centerY))) > r) {
    //  x1 = random(-r,r);
    //  y1 = random(-1,1)*sqrt(rSquared-x1*x1);
    //  x1 += WIDTH / 2;
    //  y1 += HEIGHT / 2;
    //}
    
    //while (sqrt(sq(abs(x2-centerX))+sq(abs(y2-centerY))) > r) {
    //  x2 = random(-r,r);
    //  y2 = random(-1,1)*sqrt(rSquared-x2*x2);
    //  x2 += WIDTH / 2;
    //  y2 += HEIGHT / 2;
    //}    

    drawLine(x1,x2,y1,y2);
  }
}

void drawLine(float x1, float x2, float y1, float y2) {
  float density = random(100,1000);
  for (int i = 0; i < density; i++) {
    float t = i / density;
    float x = curvePoint(x1, x1, x2, x2, t);
    float y = curvePoint(y1, y1, y2, y2, t);
    float transp = random(10,60);
    stroke(200,200,255,transp);
    strokeWeight(random(0.25,1));
    point(x, y);
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