
int r = 10;                   // minimum distance between points
int k = 30;                   // number of samples before rejection
float w = r / sqrt(2);        // cell size bounds

int cols, rows;

ArrayList<PVector> grid = new ArrayList<PVector>();
ArrayList<PVector> active = new ArrayList<PVector>();

void setup() {
  size(800, 800);
  background(0);

  smooth(2);
  pixelDensity(displayDensity());

  // step 0
  cols = floor(width / w);
  rows = floor (height / w);
  for (int i = 0; i < cols * rows; i++) {
    grid.add(null);
  }

  // step 1
  float x = width / 2;
  float y = height / 2;
  int i = floor(x / w);
  int j = floor(y / w);
  PVector pos = new PVector(x, y);
  int index = i + j * cols;
  grid.set(index, pos);
  active.add(pos);
}

void draw() {
  //background(0);

  // step 2
  if (active.size() > 0) {
    int activeIndex = floor(random(active.size()));
    PVector pos = active.get(activeIndex);
    
    float closestDistance = 100;
    PVector closestNeighbor = new PVector(0,0);

    boolean found = false;
    for (int n = 0; n < k; n++) {
      PVector sample = PVector.random2D();
      float magnitude = random(r, 2*r);
      sample.setMag(magnitude);
      sample.add(pos); 

      int col = floor(sample.x / w);
      int row = floor(sample.y / w);

      boolean ok = true;
      for (int i = -2; i <= 2; i++) {
        for (int j = -2; j <= 2; j++) {
          int currentGridIndex = (col + i) + (row + j) * cols;
          if ((currentGridIndex > 0) && (currentGridIndex < grid.size())) {
            PVector neighbor = grid.get(currentGridIndex);
            if (neighbor != null) {
              float distance = PVector.dist(sample, neighbor);
              
              if (distance
              if (distance < r) {
                ok = false;
              }
            }
          }
        }
      }

      if (ok) {
        found = true;
        grid.set(col + row * cols, sample);
        active.add(sample);
        line(sample.x, sample.y, width/2, height/2);
      }
    }

    if (!found) {
      active.remove(activeIndex);
    }
  }

  for (PVector cell : grid) {
    if (cell != null) {
      stroke(80, 80, 0);
      strokeWeight(1);
      point(cell.x, cell.y);
    }
  }

  for (PVector p : active) {
    if (p != null) {
      stroke(255);
      strokeWeight(1);
      point(p.x, p.y);
    }
  }
}

void keyPressed() {
  if (key == ENTER) {
    saveFrame();
  }
}
