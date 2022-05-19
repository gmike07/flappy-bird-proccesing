class UpperPipe{
  private int x;
  private int y;
  private int size;
  public UpperPipe(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  public void draw(){
    fill(150);
    rect(x, 0, size, y);
  }
  
  public boolean colided(Bird b){
    if(b.getX() + b.getSize() < x){
      return false;
    }
    if(x + size < b.getX()){
      return false;
    }
    return b.getY() < y;
  }
  
  public boolean offScreen(){
    return x + size < 0;
  }
  
  public void update(int x){
    this.x -= x;
  }
 
}
