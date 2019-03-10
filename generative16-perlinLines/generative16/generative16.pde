import java.util.UUID;

float THRESHOLD = 0.6;
float WIDTH = 700;
float HEIGHT = 700;
float MARGIN = 50;
int SCALE = 4;
int ROWS = floor(HEIGHT / SCALE);
int COLS = floor(WIDTH / SCALE);

int rectWidth = 2;
    
    
void setup() {
  size(800, 800);
  stroke(0);
  pixelDensity(displayDensity());
  background(255);
  strokeWeight(2);
  frameRate(60);
  
  //// draw vertical line /\
  //for (int x = 0; x < WIDTH; x+=SCALE) {
  //  for (int y = SCALE; y < HEIGHT; y+=SCALE) {
  //    if (random(0,1) > 0.70) {
  //      line(x+MARGIN,y+MARGIN,x+MARGIN,y-SCALE+MARGIN);
  //    }
  //    yoff += 0.1;
  //  }
  //}
  
  
  //// draw horizontal line <-
  //for (int x = SCALE; x < WIDTH; x+=SCALE) {
  //  for (int y = 0; y < HEIGHT; y+=SCALE) {
  //    if (random(0,1) > THRESHOLD) {
  //      line(x+MARGIN,y+MARGIN,x-SCALE+MARGIN,y+MARGIN);
  //    }
  //    xoff += 0.1;
  //  }
  //}
}

float zoff = 0;
void draw() {  
  background(255);
   float xoff = 0;
  // draw horizontal line ->
  for (int x = 0; x < WIDTH-SCALE; x+=SCALE) {
    float yoff = 0;
    for (int y = 0; y < HEIGHT-SCALE; y+=SCALE) {
      if (noise(xoff,yoff,zoff) > THRESHOLD) {
         line(x+MARGIN,y+MARGIN,x+SCALE+MARGIN,y+MARGIN);
      }
      if (noise(xoff,yoff,zoff) > THRESHOLD-0.05) {
         line(x+MARGIN,y+MARGIN,x+MARGIN,y+SCALE+MARGIN);
      }
      yoff += 0.05;
    }
    xoff += 0.05;
  }
  zoff += 0.05;
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