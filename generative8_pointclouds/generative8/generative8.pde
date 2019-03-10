import java.util.UUID;

float[] distribution = new float[300000];

void setup() {
  size(1000, 1000);
  smooth(2);
  pixelDensity(displayDensity());
  strokeWeight(0.25);

  for (int i = 0; i < distribution.length; i++) {
    distribution[i] = int(randomGaussian() * 100);
  }
}

void draw() {
  background(255);
  
  translate(width/2, width/2);
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < distribution.length; j++) {
      rotate(TWO_PI/random(1,1000));
      stroke(0,0,0,random(50,80));
      float dist = abs(distribution[j]);
      point(dist,dist);
    }
    translate(random(-width/10,width/10),random(-height/10,height/10));
   
    for (int j = 0; j < distribution.length; j++) {
      distribution[j] = int(randomGaussian() * random(100,150));
    }
  }
  
  noLoop();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    redraw();
  } 
}

void keyPressed () {
  if (key == RETURN || key == ENTER) {
    String uuid = UUID.randomUUID().toString();
    save(uuid + ".tif");
  }
}