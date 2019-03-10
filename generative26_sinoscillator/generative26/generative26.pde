//import java.util.UUID;
//import processing.sound.*;
//SinOsc sine;

//float WIDTH = 1000;
//float HEIGHT = 1000;
//float lineSpace = 5;
//float lineMargin = 10;
//float lineHeight = 0.85;

//void setup() {
//  size(1000,1000);
//  stroke(0);
//  strokeWeight(lineHeight);
//  noFill();
//  pixelDensity(displayDensity());
//}

//float angle = 0.0;

//void draw() {  
//  background(255);
//  translate(width/2,height/2);
  
//  float amplitude = 360;
  
//  float x = amplitude * sin(angle);
//  fill(127);
//  ellipse(x,0,36,36);
  
//  angle += 0.05;
//}
    
//void mousePressed() {
//  if (mouseButton == LEFT) {
//    redraw();
//  } 
//}

//void keyPressed () {
//  if (key == RETURN || key == ENTER) {
//    String uuid = UUID.randomUUID().toString();
//    save(uuid + ".tif");
//  }
//}