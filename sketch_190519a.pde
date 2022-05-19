Ground g;
Bird b;
Pipe p1;
Pipe p2;
//first thing to do
void setup(){
  size(1600,1600);
  g = new Ground();
  b = new Bird(width / 12, height / 5, g);
  p1 = new Pipe(width / 2);
  p2 = new Pipe(width);
}


//do every loop
void draw(){
  if(!b.dead){
      println(b.score);
      background(255);
      p1.update();
      p1.draw();
      p2.update();
      p2.draw();
      g.draw();
  
      b.update(p1, p2);
      b.draw();
  }
}
