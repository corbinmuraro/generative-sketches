import java.util.UUID;

float THRESHOLD = 0.6;
float WIDTH = 700;
float HEIGHT = 700;
float MARGIN = 50;
int SCALE = 12;
int ROWS = floor(HEIGHT / SCALE);
int COLS = floor(WIDTH / SCALE);

int rectWidth = 2;
    
void setup() {
  size(800, 800);
  stroke(0);
  pixelDensity(displayDensity());
  background(255);
  strokeWeight(2);
  frameRate(200);
  float xoff = 0;
  float yoff = 0;
  
  
  // draw horizontal line ->
  for (int x = 0; x < WIDTH-SCALE; x+=SCALE) {
    for (int y = 0; y < HEIGHT-SCALE; y+=SCALE) {
      if (noise(xoff,yoff) > THRESHOLD) {
         line(x+MARGIN,y+MARGIN,x+SCALE+MARGIN,y+MARGIN);
      }
      if (noise(xoff,yoff) > THRESHOLD-0.05) {
         line(x+MARGIN,y+MARGIN,x+MARGIN,y+SCALE+MARGIN);
      }
      yoff += 0.20;
    }
    xoff += 0.54;
  }
  
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

void draw() {  
 
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