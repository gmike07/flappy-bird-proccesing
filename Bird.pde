class Bird{
  private int x;
  private int y; 
  private int velocity = 0;
  private static final int JUMP_FORCE = 20;
  private static final int size = 40;
  private static final int gravity = 2;
  private int score = 0;
  private boolean dead = false;
  private boolean onGround = false;
  private Ground ground;
  
  
  public Bird(int x, int y, Ground g){
    this.x = x;
    this.y = y;
    this.ground = g;
  }
  
  public void draw(){
    fill(0);
    rect(x,y, size, size);
  }
  
  public void update(Pipe p1, Pipe p2){
    move();
    updateColissions(p1, p2);
  }
  
  public void move(){
    if(keyPressed && key == ' ')
        jump();
    if(!onGround)
        this.velocity = constrain(this.velocity + gravity, -JUMP_FORCE, 20);
    this.y = constrain(this.y + this.velocity, 0, ground.getGroundHeight() - size);
  }
  
  public int getSize(){
    return this.size;
  }
  public void jump(){
    if(!dead)  
        this.velocity = constrain(this.velocity - JUMP_FORCE, -JUMP_FORCE, 20);
  }
  
  public int getY(){
    return this.y;
  }
  
  public void updateColissions(Pipe p1, Pipe p2){
    if(g.colided(this)){
      this.onGround = true;
      this.dead = true;
    }
    if(p1.colided(this)){
      this.dead = true;
    }
    if(p2.colided(this)){
      this.dead = true;
    }
    if(!dead){
      score += countPipe(p1);
      score += countPipe(p2);
    }
  }
  
  
  public int countPipe(Pipe p){
    if(p.wasCounted)
        return 0;
    if(dead)
        return 0;
    if(x > p.WIDTH + p.up.x){    
        p.updateCounted();
        return 1;
    }
    return 0;
  }
  
  public int getX(){
    return this.x;
  }
}
