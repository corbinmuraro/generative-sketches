import java.util.UUID;

float WIDTH = 1000;
float HEIGHT = 1000;
int MARGIN = 200;
ArrayList<PVector> aVectors = new ArrayList<PVector>();
ArrayList<PVector> bVectors = new ArrayList<PVector>();
int numVectors = 20;

void setup() {
  size(1000,1000);
  noFill();
  pixelDensity(displayDensity());
  noLoop();
}

void draw() {
  background(255);
  stroke(0,0,0);
  strokeWeight(1.5);
  
  // generate initial aVectors ArrayList:
  
  // generate starting A location
  float x = random(MARGIN, WIDTH-MARGIN);
  float y = random(MARGIN, HEIGHT-MARGIN);
  aVectors.add(new PVector(x,y));
  
  // generate row of vectors based upon the starting point
  for (int i = 0; i < numVectors; i += 1) {
    x += 8;
    aVectors.add(new PVector(x,y));
  }
  
  
  // generate initial bVectors ArrayList:
  
  // generate starting B location
  x = random(MARGIN, WIDTH-MARGIN);
  y = random(MARGIN, HEIGHT-MARGIN);
  bVectors.add(new PVector(x,y));

  // generate row of vectors based upon the starting point
  for (int i = 0; i < numVectors; i += 1) {
    x += 8;
    bVectors.add(new PVector(x,y));
  }
  drawSegment();
  
  buildCircuit();
}

void buildCircuit() {
  float x = 0;
  float y = 0;
  
  // alternate between updating a vectors and b vectors
  //for (int path = 0; path < 10; path++) {
    //if (path % 2 == 0) {
      
      // set new aVector in a specific path relative to the existing bVector
      if (int(random(0,1)) == 0) {
        x = bVectors.get(0).x + random(-50,50);
      }
      else {
        y = bVectors.get(0).y + random(-50,50);
      }
      aVectors.get(0).x = x;
      aVectors.get(0).y = y;
      
      LineSpacing linespacing = new LineSpacing(aVectors.get(0), bVectors.get(0));
      for (int i = 0; i < numVectors; i += 1) {
        print(linespacing.x() + "\n");
        print(linespacing.y() + "\n");
        aVectors.get(i).x = x + (i * linespacing.x());
        aVectors.get(i).y = y + (i * linespacing.y());
      }
      
      drawSegment();
    //} 
    //else {
    //  x = random(MARGIN, WIDTH-MARGIN);
    //  y = random(MARGIN, HEIGHT-MARGIN);
    //  aVectors.get(0).x = x;
    //  aVectors.get(0).y = y;
      
    //  for (int i = 0; i < numVectors; i += 1) {
    //    x += lineSpacing;
    //    aVectors.get(i).x = x;
    //  }
      
    //  drawSegment();
    //}
  //}
}


void drawSegment() {
  print("drew line \n");
  beginShape();

  for (int i =1; i < 3; i++) {
    // draw a line from the nth vector of group a to the nth vector of group b
    line(aVectors.get(i).x, aVectors.get(i).y, bVectors.get(i).x, bVectors.get(i).y);
  }
  
  endShape(); 
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