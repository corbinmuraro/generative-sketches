import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
float MARGIN = 75;
float AXIS = 5;
float SCALE = 5;


void setup() {
  size(1000,1000);
  stroke(0);
  strokeWeight(1.4);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  background(255);
}


void draw() {  
  for (int x = 0; x < AXIS; x++) {
    for (int y = 0; y < AXIS; y++) {
      float slope = random(-1.25*SCALE,1.25*SCALE);
      float current = SCALE/5;
      float bottom = SCALE*8;
      float xadjust = MARGIN + x*SCALE*36;
      float yadjust = MARGIN + y*SCALE*30;
    
      while (current < bottom) {
        float x1 = 0;
        float y1 = current + random(SCALE*8,SCALE*12);
        float x2 = x1 + SCALE*10;
        float y2 = current + random(SCALE*14,SCALE*16);
        float x3 = x1 + SCALE*16;
        float y3 = current + random(SCALE*4,SCALE*6);
        float x4 = x1 + SCALE*5;
        float y4 = current + random(SCALE*2,SCALE*6);
        quad(x1+xadjust,y1+yadjust,x2+xadjust,y2+yadjust,x3+xadjust,y3+yadjust,x4+xadjust,y4+yadjust);
        current += random(SCALE,SCALE*2);
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