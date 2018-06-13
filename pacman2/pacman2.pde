ArrayList<NewPacman> pacmanList = new ArrayList();
boolean open = true;
float timing = 0;
ArrayList<Shape> shapes = new ArrayList();

void setup(){
  size(800,600);
  pacmanList.add(new NewPacman(UP,DOWN,RIGHT,LEFT,0f,0f,0f));
  //Rectangle rectangle = new Rectangle(-200,0,45,100,100,40);
  Rectangle rectangle = new Rectangle(-200,0,45,100,100,3);
  //Side side = new Side(new Point(-50,-10), new Point(-50,30), new Point(-100,10));
  shapes.add(rectangle);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(NewPacman pacman: pacmanList){
    pacman.draw();
    pacman.move();
    pacman.open = pacmanOpen();
  }
  for(Shape shape: shapes){
    shape.draw();
  }
  for(NewPacman pacman: pacmanList){
    //shapes.get(0).collide(0f,50,new Point(pacman.posX,pacman.posY));
    pacman.collide(shapes);
  }
 
 
    //ArrayList<Point> pointList = new ArrayList();
    //pointList.add(new Point(0,100));
    //pointList.add(new Point(0,0));
    //pointList.add(new Point(100,0));
    //pointList.add(new Point(100,100));
    
       //PShape shape = createShape();
       // shape.beginShape();
       // shape.fill(102);
       // shape.vertex(pointList.get(0).x, pointList.get(0).y);
       // shape.vertex(pointList.get(1).x, pointList.get(1).y);
       // shape.vertex(pointList.get(2).x, pointList.get(2).y);
       // shape.vertex(pointList.get(3).x, pointList.get(3).y);
       // //for(int i = 0; i < pointList.size()-1; i++){
       // //    shape.vertex(pointList.get(i).x, pointList.get(i).y);
       // //}
       // shape.endShape(CLOSE);
}

boolean pacmanOpen(){
  if(timing < 16){
     timing += 1;
  }
  else{
    timing = 0;
  }
  open = timing<=8;
  return open;
}

  void keyPressed(){
    for(NewPacman pacman: pacmanList){
      if(keyCode == pacman.keys[0]){
        pacman.velocities[0] = true;
      }
        if(keyCode == pacman.keys[1]){
        pacman.velocities[1] = true;
      }
        if(keyCode == pacman.keys[2]){
        pacman.velocities[2] = true;
      }
        if(keyCode == pacman.keys[3]){
        pacman.velocities[3] = true;
      }
    }
  }
  
  void keyReleased(){
    for(NewPacman pacman: pacmanList){
      if(keyCode == pacman.keys[0]){
        pacman.velocities[0] = false;
      }
        if(keyCode == pacman.keys[1]){
        pacman.velocities[1] = false;
      }
        if(keyCode == pacman.keys[2]){
        pacman.velocities[2] = false;
      }
        if(keyCode == pacman.keys[3]){
        pacman.velocities[3] = false;
      }
    }
  }
