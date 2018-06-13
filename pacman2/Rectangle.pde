class Rectangle extends Shape{

  float slant;
  Point center;
  ArrayList<Side> sideList = new ArrayList();
  ArrayList<Point> pointList = new ArrayList();
  PShape shape;
  
  Rectangle(float centerX, float centerY, float slant, float _height, float _width, int sides){
    shape = createShape();
    center = new Point(centerX,centerY);
    this.slant = slant;
    
    for(int i = 0; i <= sides; i++){
      pointList.add(new Point(center.x + _width * cos(radians(360/sides * i+slant)),center.y + _height * sin(radians(360/sides * i+slant))));
    }
    
    shape.beginShape();
    shape.fill(255,255,255);
    shape.noStroke();
    for(int i = 0; i < pointList.size()-1; i++){
      shape.vertex(pointList.get(i).x,pointList.get(i).y);
        sideList.add(new Side(pointList.get(i),pointList.get(i+1), new Point(center.x,center.y)));
    }
    shape.endShape(CLOSE);
  }
  
  @Override
  void draw(){
     //PShape shape = createShape();
     //   shape.beginShape();
     //   shape.fill(#F50000);
     //   for(int i = 0; i < pointList.size()-1; i++){
     //       shape.vertex(pointList.get(i).x, pointList.get(i).y);
     //   }
     //   shape.endShape(CLOSE);
     for(Side side: sideList){
      side.draw();
    }
  }
  
  @Override
  String toString(){
    return "{" + sideList.toString() + "}";
  }
  
  @Override
  float collide(float direction, float radius, Point point){
    if((point.x <= center.x+radius) && (point.x >= center.x-radius) && (point.y <= center.y+radius) && (point.y >= center.y-radius)){
      println("yes");
    }
    else{
     println("no"); 
    }
   
    
    //for(Side side: sideList){
    //  return side.collide(direction, radius, point);
    //}
    return 0f;
  }
}

class Side extends Shape{
  Point start;
  Point end;
  Point center;
  
  Side(Point start, Point end, Point center){
    this.start = start;
    this.end = end;
    this.center = center;
    super.derivative = slope();
  }
  
  @Override
  void draw(){
    stroke(#FFFFFF);
    strokeWeight(2);
    line(start.x,start.y, end.x, end.y);
    ellipse(center.x,center.y,5,5);
  }
  
  @Override
  String toString(){
    return "(" + start.toString() + ", " + end.toString() + ")";
  }
  
  @Override
  float collide(float direction, float radius, Point point){
    Point sidePoint = sidePoint(point);
    if(!(Float.isNaN(sidePoint.x) || Float.isNaN(sidePoint.y))){
      println(super.distance(point,center));
      println(super.distance(center, sidePoint(point)));
      if(super.distance(point,center) < super.distance(center, sidePoint)){
       return derivative; 
      }
    }
      return 0;
  }
  
  float slope(){
    if((end.x - start.x)!=0){ 
      return ((end.y - start.y)/(end.x - start.x));
    }
    return 10000;
  }
  
  float position(float xPos){
      return xPos*super.derivative;
  }
  
  Point sidePoint(Point point){
      float x = (-start.x + start.y + 2*(point.y))/((point.y/point.x)-super.derivative);
      float y = super.derivative * x - start.x + start.y;
      
      return new Point(x,y);
  }
}

class Point{
  float x;
  float y;
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  @Override
  String toString(){
    return "(" + x + ", " + y + ")";
  }
}
