import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 100;
int NUMVERTICES = 81;
float ROWHEIGHT = 6;
ArrayList<PVector> vectors = new ArrayList<PVector>();
float currentX = MARGIN;
float currentY = MARGIN;
float horizontalStep = 10;
float verticalVariation = 2;
float x1, y1, x2, y2;

void setup() {
  size(1000,1500);
  noFill();
  smooth(2);
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(255);
  stroke(0,0,0);
  strokeWeight(2.25);

  x1 = currentX;
  y1 = currentY;
  vectors.add(new PVector(x1,y1));
  x2 = currentX + horizontalStep;
  y2 = random(currentY-verticalVariation,currentY+verticalVariation);
  vectors.add(new PVector(x2,y2));
  currentX = x2;
  currentY = y2;
  
  drawFirstRow();
  populatePage();
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



void drawFirstRow() {
  for (int i = 0; i < NUMVERTICES - 2; i++) {
   if (i % 2 == 0) {
     x1 = currentX + horizontalStep;
     y1 = random(currentY-verticalVariation,currentY+verticalVariation);
     vectors.add(new PVector(x1,y1));
     currentX = x1;
     currentY = y1;
   }
   else {
     x2 = currentX + horizontalStep;
     y2 = random(currentY-verticalVariation,currentY+verticalVariation);
     vectors.add(new PVector(x2,y2));
     currentX = x2;
     currentY = y2;
   }
  }
  
  drawRow();
}

void populatePage() {
  for (int row = int(currentY); row < (HEIGHT - MARGIN); row += ROWHEIGHT) {
    float yoff = 0;
    for (int i = 0; i < vectors.size(); i++) {
      vectors.get(i).x += 0;
      vectors.get(i).y = vectors.get(i).y + ROWHEIGHT + map(noise(yoff),0,1,-2,2); 
      yoff+= 0.1;
    }
    drawRow();
  }
}

void drawRow() {
  beginShape();

  for (int i = 0; i < vectors.size(); i++) {
    curveVertex(vectors.get(i).x, vectors.get(i).y);
  }
  
  endShape();
}