void setup() {
  size(1000,1000);
  background(0);
  stroke(255,255,255,200);
  fill(255,255,255,200);
  smooth(4);
}


/* CONSTANTS */
// layout
final int padding = 100;

// horizontal denseness
final int numDots = 60;

// vertical denseness
final int numLines = 25;
final int rowHeight = 10;

final float dotSize = 4;

// perlin 
final int verticalSpread = 500;
final float perlinDotIncrement = 0.01;
final float perlinRowIncrement = 0.015;



float startingX = random(200,500);

float perlinTimeStep = 0;  
void draw() {
  background(0,0,0);
  //noLoop();    
    
  float lineVerticalOffset = 0;
  for (int i = 1; i <= numLines; i++) {
    float lineOffset = i * rowHeight;
    
    float dotVerticalOffset = 0;
    for (int j = 1; j <= numDots; j++) {
      float perlinVariation = map(noise(dotVerticalOffset,lineVerticalOffset,perlinTimeStep),0,1,-verticalSpread,verticalSpread);
      
      float x = padding + map(noise(dotVerticalOffset,lineVerticalOffset,perlinTimeStep),0,1,-50,50) + map(j, 0, numDots, 0, width-(padding*2));
      float y = startingX + lineOffset + perlinVariation;
      
      ellipse(x, y, dotSize, dotSize);
      
      dotVerticalOffset += perlinDotIncrement;
    }
    
    lineVerticalOffset += perlinRowIncrement;
  }
  
  perlinTimeStep += 0.003;
}

void keyPressed() {
  if (key == ENTER) {
    saveFrame();
  }
}
