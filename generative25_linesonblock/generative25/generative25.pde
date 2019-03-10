import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
float lineSpace = 5;
float lineMargin = 10;
float lineHeight = 0.85;

void setup() {
  size(1000,1000);
  stroke(255);
  strokeWeight(lineHeight);
  noFill();
  pixelDensity(displayDensity());
  background(0);
  noLoop();
}


void draw() {  
  rotate(PI/4);
  translate(-300,-700);
  float x = 0;
  float y = 0;
  
  float lineSpaceOff = 0;
  while (y < height*2) {
    while (x < width*2) {
      float lineWidth = map(x,width*2,0,30,200) * random(0.8,1.5);
      float lineSpace = map(x,width*2,0,10,30)*random(0.3,5);
      print(y + "\n");
      x = x + lineSpace + lineWidth;
      line(x,y,x+lineWidth,y);
      lineSpaceOff += 0.1;
    }
    x = 0;
    y += lineMargin + lineHeight;
  }
  
  rotate(-PI/4);
  translate(300,700);
  stroke(0);
  fill(0);
  
  lineSpaceOff = 0;
  x = random(0,width);
  y = random(0,height);
  rect(x,y,280,280);

  //float initialX = x;
  //float initialY = y;

  //stroke(255);
  //while (y < initialY + 280) {
  //  while (x < initialX + 280) {
  //    float lineWidth = map(x,width*2,0,30,200) * random(0.8,1.5);
  //    float lineSpace = map(x,width*2,0,10,30)*random(0.3,5);
  //    print(y + "\n");
  //    x = x + lineSpace + lineWidth;
  //    line(x,y,x+lineWidth,y);
  //    lineSpaceOff += 0.1;
  //  }
  //  x = 0;
  //  y += lineMargin + lineHeight;
  //}
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