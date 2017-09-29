class Particle {
  PVector pos = new PVector(random(WIDTH),random(HEIGHT));
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  float maxSpeed = 1;

  PVector prevPos = pos.copy();

  public void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  public void show() {
    stroke(0,50);
    strokeWeight(1);
    point(pos.x, pos.y);
  }

  public void updatePrev() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }

  public void edges() {
    if (pos.x > WIDTH) {
      pos.x = 0;
      updatePrev();
    }
    if (pos.x < 0) {
      pos.x = WIDTH;
      updatePrev();
    }

    if (pos.y > HEIGHT) {
      pos.y = 0;
      updatePrev();
    }
    if (pos.y < 0) {
      pos.y = HEIGHT;
      updatePrev();
    }
  }
  
  
  public void follow(PVector[] vectors) {
    int x = floor(pos.x / SCALE);
    int y = floor(pos.y / SCALE);
    int index = x + y * COLS;
        print("\n");
    print(index);
    if(index > vectors.length - 1 || index < 0) {
      index = index - COLS - 1;
    }
    print("\n");
    print(index);
        print("\n");
    print(x);
        print("\n");
    print(y);
        print("\n");
    print(pos.x);
           print("\n");
    print(pos.y);
    PVector force = vectors[index];
    applyForce(force);
  }
}