class Ground{
  private final int groundHeight = 60;
  private final int MinHeight = height - groundHeight;
  
  public void draw(){
    fill(0);
    rect(0, MinHeight, width, height);
  }
  
  public boolean colided(Bird b){
    return b.getY() + b.getSize() >= MinHeight;
  }
  
  public int getGroundHeight(){
    return MinHeight;
  }
}
