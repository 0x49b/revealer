class Character{
  ArrayList<Point> points = new ArrayList<Point>();
  
  ArrayList<Point> getPoints(){
    return this.points;
  }
  
  void addPoint(Point point){
    this.points.add(point);
  }
}
