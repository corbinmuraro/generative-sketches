import themidibus.*;

MidiBus myBus; // The MidiBus

void setup() {
  size(1000,1000);
  background(0);
  stroke(255,255,255,200);
  fill(255,255,255,200);
  smooth(4);
  pixelDensity(displayDensity());
  
  myBus = new MidiBus(this, "Arturia BeatStepPro", -1);
}


/* CONSTANTS */
// layout
final int padding = 30;

// horizontal denseness
float numDots = 80;

// vertical denseness
float numLines = 20;
float rowHeight = 8;

final float dotSize = 4;

// perlin 
int verticalSpread = 800;
float perlinDotIncrement = 0.003;
float perlinRowIncrement = 0.018;
float perlinTimeStepIncrement = 0.006;

void controllerChange(int channel, int number, int value) {
  if(number == 93) {
    perlinTimeStepIncrement = map(value, 0, 127, 0, 0.05);
  }
  if(number == 10) {
    perlinDotIncrement = map(value, 0, 127, 0, 0.1);
  }
  if(number == 74) {
    perlinRowIncrement = map(value, 0, 127, 0, 0.1);
  }
  if(number == 76) {
    numLines = map(value, 0, 127, 1, 100);
  }
  if(number == 77) {
    rowHeight = map(value, 0, 127, 1, 100);
  }
  if(number == 75) {
    numDots = map(value, 0, 127, 10, 300);
  }
}


float startingX = 200;

float perlinTimeStep = 0;  
void draw() {
  background(0,0,0);
  //noLoop();    
 
  float lineVerticalOffset = 0;
  for (int i = 1; i <= numLines; i++) {
    float lineOffset = i * rowHeight;
    
    float dotVerticalOffset = 0;
    for (int j = 1; j <= numDots; j++) {
      float dotOffset = map(j, 0, numDots, 0, width-(padding*2));
      
      float perlinXVariation = map(noise(dotVerticalOffset,lineVerticalOffset,perlinTimeStep),0,1,-50,50);
      float perlinYVariation = map(noise(dotVerticalOffset,lineVerticalOffset,perlinTimeStep),0,1,-verticalSpread,verticalSpread);
            
      float x = padding + dotOffset + perlinXVariation;
      float y = startingX + lineOffset + perlinYVariation;
      
      ellipse(x, y, dotSize, dotSize);
      
      dotVerticalOffset += perlinDotIncrement;
    }
    
    lineVerticalOffset += perlinRowIncrement;
  }
  
  perlinTimeStep += perlinTimeStepIncrement;
}

void keyPressed() {
  if (key == ENTER) {
    saveFrame();
  }
}
