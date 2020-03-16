final int MARGIN = 100;

class Particle {
  PVector vel, pos;
  color c = color(#69436C);
  float alpha;
    
  Particle (float x, float y ) {
    this.vel = new PVector(0, 0);
    this.pos = new PVector(x, y);
  }

  void render (float rad) {
    if ((this.pos.x < width - MARGIN) && (this.pos.x > MARGIN) && (this.pos.y < height - MARGIN) && (this.pos.y > MARGIN)) {
      ellipse(this.pos.x, this.pos.y, rad, rad);
    }
  }
 
  final float noiseScale = 200; 
  void update(){
    float direction = noise((this.pos.x)/noiseScale, this.pos.y/noiseScale)*TWO_PI;
    
    this.vel.x= sin(direction)*0.5;
    this.vel.y = cos(direction)*0.5;
    this.pos.add(this.vel);   
  }
}

int num = 5000;
Particle particles[]= new Particle[num];
 
void setup(){
  size(800, 800);
  background(color(#fefefe));
 
  for(int i = 0; i < num; i++) {
    particles[i] = new Particle(i,height);
    particles[i].alpha = map(abs(i-num/2),0,num/2,150,0);
  }
}

void draw(){
  noStroke();
  smooth();
    
  for(int i = 0; i < num; i++) {
    fill(particles[i].c,particles[i].alpha);
    particles[i].update();
    particles[i].render(1);
  }

//this.position = p.createVector(Math.random() * p.nonScaledWidth, Math.random() * p.nonScaledHeight);
}
