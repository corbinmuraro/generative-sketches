import java.util.UUID;
import java.util.ArrayList;

float WIDTH = 800;
float HEIGHT = 800;
int SCALE = 20;
int ROWS = floor(HEIGHT / SCALE);
int COLS = floor(WIDTH / SCALE);

float proximity = 0.01;
float repulsionDistance = 50;

ArrayList<Point> points = new ArrayList<Point>();
    
    
void setup() {
  size(800, 800);
  stroke(0);
  pixelDensity(displayDensity());
  background(255);
  frameRate(200);
  
  float radius = 200;
  float numPoints = 800;
  points.add(new Point(100,100));
  points.add(new Point(100,200));
  //for (int i = 0; i < numPoints; i++) {
  //  float x = WIDTH/2 + radius*cos(map(i,0,numPoints,0,2*PI));
  //  float y = HEIGHT/2 + radius*sin(map(i,0,numPoints,0,2*PI));
  //  points.add(new Point(x,y));
  //}
  
  print(points.size());
}

void draw() {  
  background(255);
  for (Point p : points) {
      p.move();
      p.display();
  }
  
  int randomIndex = int(random(0,points.size()-2));
  //points.add(randomIndex,new Point(randomIndex));
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