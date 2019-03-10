class LineSpacing {
  private float xSpacing;
  private float ySpacing;
  
  public LineSpacing(PVector a, PVector b) {
    this.xSpacing = int(random(0,2))*2-1 * (a.x - b.x) / 100;
    this.ySpacing = int(random(0,2))*2-1 * (a.y - b.y) / 100;
  }  
  
  public float x() {
    return xSpacing;
  }
  
  public float y() {
    return ySpacing;
  }
}