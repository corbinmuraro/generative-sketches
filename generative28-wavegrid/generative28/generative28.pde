import java.util.UUID;

float[][] xValues;
float[][] yValues;
float colScale;
float rowScale;

final int margin = 225;
final int rows = 50;
final int cols = 50;
final float numFrames = 12;
final float lumpiness = 5;
final float stepSize = 0.03;

void setup() {
  size(1000,1000);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  stroke(255);
  strokeWeight(2.25);
  
  colScale = (width - 2 * margin) / cols;
  rowScale = (height - 2 * margin) / rows;
  
  xValues = new float[rows][cols];
  yValues = new float[rows][cols];
    
  for (int col = 0; col < cols; col++) {
    for (int row = 0; row < rows; row++) {
      xValues[row][col] = margin + col * colScale;
      yValues[row][col] = margin + row * rowScale;
    }
  }
}

int count = 0;
void draw() {
  if (count < numFrames) {  
    background(0);
    
    float yoff = 0;
    for (int row = 0; row < rows; row++) {
      float xoff = 0;
  
      beginShape();
      for (int col = 0; col < cols; col++) {
        xValues[row][col] += map(noise(xoff,yoff), 0, 1, -lumpiness, lumpiness);
        yValues[row][col] += map(noise(xoff,yoff), 0, 1, -lumpiness, lumpiness);
   
        curveVertex(xValues[row][col], yValues[row][col]);
        
        xoff += stepSize;
      }
      endShape();
      yoff += stepSize;
    }
  }
  
  count++;
}

void mousePressed() {
  if (mouseButton == LEFT) {
    redraw();
  } 
  else if (mouseButton == RIGHT) {
    draw();
  }
}

void keyPressed () {
  if (key == RETURN || key == ENTER) {
    String uuid = UUID.randomUUID().toString();
    save(uuid + ".tif");
  }
}
