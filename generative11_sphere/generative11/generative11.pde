import java.util.UUID;

float WIDTH = 800;
float HEIGHT = 800;

void setup() {
  size(800,800);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  background(255);
}

float r = 200;
float rSquared = r*r;

float centerX = WIDTH / 2;
float centerY = HEIGHT / 2;
float noiseIncrement = 0.01;



void draw() {  
  float offset = 0;

  float x = random(-r,r);
  float y = random(-1,1)*sqrt(rSquared-x*x);
  x += WIDTH / 2;
  y += HEIGHT / 2;
  
  for (int i = 0; i < 10000000; i++) {
    int chooser = int(random(1,5));
    switch(chooser) {
      case 1:  
        x += noise(offset)*2;
        break;
      case 2:  
        x -= noise(offset)*2;
        break;
      case 3:  
        y += noise(offset)*2;
        break;
      case 4:  
        y -= noise(offset)*2;
        break;
    }
    
    while (sqrt(sq(abs(x-centerX))+sq(abs(y-centerY))) > r) {
      x = random(-r,r);
      y = random(-1,1)*sqrt(rSquared-x*x);
      x += WIDTH / 2;
      y += HEIGHT / 2;
    }    
    
    float alpha = random(0,5);
    stroke(0,alpha);    
    point(x,y);
    offset += noiseIncrement;
  }
  
  print("done");
  noLoop();
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