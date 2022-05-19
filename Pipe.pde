class Pipe{
  private static final int HoleSize = 300;
  private static final int WIDTH = 130;
  private static final int PipeSpeed = 7;
  private boolean wasCounted = false;
  UpperPipe up;
  LowerPipe lp;
  public Pipe(int x){
    int randomLocYHole = (int) random(30, height - 30 - HoleSize);
    up = new UpperPipe(x, randomLocYHole, WIDTH);
    lp = new LowerPipe(x, randomLocYHole + HoleSize, WIDTH);
  }
  
  public void draw(){
    up.draw();
    lp.draw();
  }
  
  public void update(){
    up.update(PipeSpeed);
    lp.update(PipeSpeed);
    if(up.offScreen()){
      int x = width;
      int randomLocYHole = (int) random(30, height - 30 - HoleSize);
      up = new UpperPipe(x, randomLocYHole, WIDTH);
      lp = new LowerPipe(x, randomLocYHole + HoleSize, WIDTH);
    }
  }
  
  public boolean colided(Bird b){
    return up.colided(b) || lp.colided(b);
  }
  
  public void updateCounted(){
    wasCounted = true;
  }
}
