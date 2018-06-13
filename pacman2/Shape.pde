class Shape{
  public float derivative;
  public ArrayList<Object> object = new ArrayList();
  
  void draw(){
    //blank to be overriden by subclass shapes
  }
  
  void collide(){
    //blank to be overriden by subclass shapes
  }
  
  String toString(){
   return "null"; 
  }
  
  float collide(float direction, float radius, Point point){
    return 0f;
  }
  
  float distance(Point first, Point second){
    return ( sqrt( pow(second.x - first.x,2) + pow(second.y - first.y,2)));
  }
  
}
