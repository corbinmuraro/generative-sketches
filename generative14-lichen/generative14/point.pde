class Point {
  PVector pos, vel, localSum, repelSum;
  color c;
  
  Point() {
    vel = new PVector(0,0);
    localSum = new PVector(0,0);
    repelSum = new PVector(0,0);
    c = color(0,0,0);
  }
  
  Point(float x, float y) {
    this();
    pos = new PVector(x,y);
    
  }
  
  // creates a point at the given index between the prior and following points
  Point(int index) {
    this();
    
    int prevIndex = index - 1;
    int nextIndex = index + 1;
    if (index == 0) {
      prevIndex = points.size() - 1;
    }
    if (index == points.size() - 1) {
      nextIndex = 0;
    }
    
    float prevX = points.get(prevIndex).pos.x;
    float prevY = points.get(prevIndex).pos.y;
    float nextX = points.get(nextIndex).pos.x;
    float nextY = points.get(nextIndex).pos.y;
    
    float x = (prevX + nextX) / 2;
    float y = (prevY + nextY) / 2;
    
    pos = new PVector(x,y);
  }
    
  void move() {
    vel.add(positionLocal());
    //vel.add(repelDistant());
    vel.limit(0.1);
    pos.add(vel);
  }

  void display(){
    ellipse(pos.x,pos.y,4,4);
  }

  PVector positionLocal() {
    int index = points.indexOf(this);
    int prevIndex = index - 1;
    int nextIndex = index + 1;
    if (index == 0) {
      prevIndex = points.size() - 1;
    }
    if (index == points.size() - 1) {
      nextIndex = 0;
    }
    
    // move previous point
    float prevD = pos.dist(points.get(prevIndex).pos);
    PVector prevDir = PVector.sub(points.get(prevIndex).pos,pos);
    prevDir.normalize();
    prevDir.mult(1 / prevD);
        
    if ((prevD < proximity) && (prevD != 0)) {
        print("get further \n");
        localSum.add(prevDir);
    }  
    else if (prevD > proximity) {
        print("get closer \n");
        localSum.sub(prevDir);
    }
       
    return localSum;
  }

  PVector repelDistant() { 
    repelSum.mult(0);
    int count = 0;
    for(int i = 0; i < points.size(); i++) {
      PVector otherVector = points.get(i).pos;
      float d = pos.dist(otherVector);
      if ((d > repulsionDistance) && (d != 0)) {
        count++;
        
        PVector dir = PVector.sub(otherVector,pos);
        dir.normalize();
        dir.div(d);
        dir.div(10);
        repelSum.sub(dir);
        }
    }
    if (count > 0) {
      repelSum.div(count);
    }
    return repelSum;
  }
}