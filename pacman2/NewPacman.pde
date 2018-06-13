class NewPacman{
  float posX = 0, posY = 0;
  int[] keys = new int[4];
  boolean[] velocities = new boolean[4];
  float[] xEquation = new float[2];
  float[] yEquation = new float[2];
  float direction = 0;
  float orientation = 0;
  float speed = 1;
  int xMovement = 0;
  int yMovement = 0;
  float radius = 50;
  boolean open = false;
  NewPacman(int up, int down, int right, int left, float direction, float posX, float posY){
    this.keys[0] = up;
    this.keys[1] = down;
    this.keys[2] = right;
    this.keys[3] = left;
    this.velocities[0] = false;
    this.velocities[1] = false;
    this.velocities[2] = false;
    this.velocities[3] = false;
    this.direction = direction;
    this.posX = posX;
    this.posY = posY;
    xEquation[0] = 0;
    xEquation[1] = 0;
    yEquation[0] = 0;
    yEquation[1] = 0;
}

  void draw(){
      if(this.posX >= width/2 || this.posX <= -width/2){
          xEquation[1] = -this.posX;
      }
      if(this.posY >= height/2 || this.posY <= -height/2){
          yEquation[1] = -this.posY;
      }
      drawPacman();
      getPosition();
      move();
      
  }
  
  void collide(ArrayList<Shape> shapes){
    
    Point point = new Point(posX,posY);

       for(Shape shape: shapes){
         float collision = shape.collide(direction, radius, point);
         if(collision != 0f){
           direction = pow( (pow((cos(direction)*cos(collision)),2) * pow((sin(direction)*sin(collision)),2)), .5 );
         }
       }
  }
  
  private void drawPacman(){
      noStroke();
      fill(#FEFF08);
      if(open){
        arc(this.posX,this.posY,radius,radius,0.6 - this.direction,5.6 - this.direction);
      }
      else{
        ellipse(this.posX,this.posY,radius,radius);
      }
      fill(0);
      noStroke();
      if(abs(direction) > PI/2){
        orientation = direction+PI+.75;
      }
      else{
        orientation = direction;
      }
      ellipse((this.posX+(radius/4)*cos(1+orientation)),(this.posY+ (radius/4)*sin(5-orientation)),radius/10,radius/10);
      
  }
  
  void move(){
    posX = xEquation[0]*xEquation[1];
    posY = yEquation[0]*yEquation[1];
    //if(equation[0] != 0 && equation[1] != 0){
    //  if(equation[0] == 0){
    //    posX += speed;
    //  }
    //  else if(equation[1] == 1){
    //    posY += speed;
    //  }
    //  else{
    //    posX += equation[0]*speed;
    //    posY += equation[1]*posX - equation[0]*speed;
    //  }
    //}
  }
  
  void getPosition(){
    if(velocities[0] == true){
      setDirection(this.posX, this.posY + radius);
      //direction = PI/2;
      //println("up");

      yEquation[0] = 1;
      yEquation[1] -= speed;
  }
    if(velocities[1] == true){
      setDirection(this.posX, this.posY - radius);
      //direction = 1.5 * PI;
      //println("down");

      yEquation[0] = 1;
      yEquation[1] += speed;
    }
    if(velocities[2] == true){
      //direction = 0;
      setDirection(this.posX + radius, this.posY);
      //println("right");
      xEquation[0] = 1;
      xEquation[1] += 1;

    }
    if(velocities[3] == true){
      setDirection(this.posX - radius, this.posY);
      //direction = PI;
      //println("left");
      xEquation[0] = 1;
      xEquation[1] -= 1;
    }
    if(velocities[0] == true && velocities[2] == true){
     setDirection(this.posX + radius, this.posY+radius);
    }
    if(velocities[0] == true && velocities[3] == true){
     setDirection(this.posX - radius, this.posY+radius);
    }
    if(velocities[1] == true && velocities[3] == true){
     setDirection(this.posX - radius, this.posY-radius);
    }
    if(velocities[1] == true && velocities[2] == true){
     setDirection(this.posX + radius, this.posY-radius);
    }
  }
 
   void setDirection(float x, float y){
       direction = atan2(y-this.posY, x-this.posX);
   }
    
}
  
