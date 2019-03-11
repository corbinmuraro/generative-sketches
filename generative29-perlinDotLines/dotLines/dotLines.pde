void setup() {
  size(1000,600);
  background(0);
  stroke(255,255,255,200);
  fill(255,255,255,200);
  smooth(4);
}


/* CONSTANTS */
// layout
final int padding = 30;

// horizontal denseness
final int numDots = 80;

// vertical denseness
final int numLines = 20;
final int rowHeight = 8;

final float dotSize = 4;

// perlin 
final int verticalSpread = 800;
final float perlinDotIncrement = 0.003;
final float perlinRowIncrement = 0.018;



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
      
      flo
      
      float x = padding + dotOffset + perlinXVariation;
      float y = startingX + lineOffset + perlinYVariation;
      
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
