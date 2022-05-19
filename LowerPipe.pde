class LowerPipe{
  private int x;
  private int y;
  private int size;
  public LowerPipe(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  public void draw(){
    fill(150);
    rect(x, y, size, height);
  }
  
  public boolean colided(Bird b){
    if(b.getX() + b.getSize() < x){
      return false;
    }
    if(x + size < b.getX()){
      return false;
    }
    return b.getY() + b.getSize() > y;
  }
  
  
  public void update(int x){
    this.x -= x;
  }
}
