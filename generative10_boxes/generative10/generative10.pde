import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
float MARGIN = 100;

void setup() {
  size(1000,1000);
  stroke(2);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  background(255);
}


void draw() {  
  for (int x = 0; x < 5; x++) {
    for (int y = 0; y < 5; y++) {
      float slope = random(-4,4);
      float current = 1;
      float bottom = 25;
      float xadjust = MARGIN + x*180;
      float yadjust = MARGIN + y*150;
    
      while (current < bottom) {
        float x1 = (current/bottom)*slope;
        float y1 = current + random(40,60);
        float x2 = x1 + 50;
        float y2 = current + random(70,80);
        float x3 = x1 + 100;
        float y3 = current + random(20,30);
        float x4 = x1 + 25;
        float y4 = current + random(35,40);
        quad(x1+xadjust,y1+yadjust,x2+xadjust,y2+yadjust,x3+xadjust,y3+yadjust,x4+xadjust,y4+yadjust);
        current += random(1,8);
      }
    }
  }
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