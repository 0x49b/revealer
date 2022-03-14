
ArrayList<Character> chars = new ArrayList<Character>();

Character rC = new Character();

void setup(){
  background(255); 
  fill(0);
  size(400,400);
  noStroke(); 
  
  chars.add(new C());
  chars.add(new E());
  chars.add(new F());
  chars.add(new G());
  chars.add(new H());
  chars.add(new I());
  chars.add(new J());
  chars.add(new K());
  chars.add(new L());
  chars.add(new M());
  chars.add(new N());
  chars.add(new S());
  chars.add(new T());
  chars.add(new U());
  chars.add(new V());
  chars.add(new W());
  chars.add(new X());
  chars.add(new Y());
  chars.add(new Z());

  rC = randomCharacter();
 
}

Character randomCharacter(){

  int l = chars.size();
  int r = int(random(0, l));
  return chars.get(r);
  
}

void draw(){
  fill(0);
  // Testen ob sich die Maus im Buchstaben befindet 
  if (inPattern(mouseX, mouseY, rC)){
  fill(255,0,0); } else {
  fill(0,0,0); }
  circle(mouseX, mouseY, 7);
}

boolean inPattern(float mx, float my, Character c){
  
  ArrayList<Point> points = c.getPoints();
  PVector[] verts=new PVector[points.size()];
  int i = 0;

  for(Point p : points){
        verts[i]= new PVector(p.getX(), p.getY());
        i+=1;
  }
  
  if(containsPoint(verts,mx,my)) {
    return true;
  } else {
    return false;
  }
}

boolean containsPoint(PVector[] verts, float px, float py) {
  int num = verts.length;
  int i, j = num - 1;
  boolean oddNodes = false;
  for (i = 0; i < num; i++) {
    PVector vi = verts[i];
    PVector vj = verts[j];
    if (vi.y < py && vj.y >= py || vj.y < py && vi.y >= py) {
      if (vi.x + (py - vi.y) / (vj.y - vi.y) * (vj.x - vi.x) < px) {
        oddNodes = !oddNodes;
      }
    }
    j = i;
  }
  return oddNodes;
}
