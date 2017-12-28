  
PShape s;
PVector[] dots;
void setup() {
  size(600, 400);
  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("shapeTest_001.svg");
  dots = new PVector[s.getChild(0).getChild(0).getVertexCount()];
  for (int i = 0; i < s.getChild(0).getChild(0).getVertexCount(); i++) {
    PVector v = s.getChild(0).getChild(0).getVertex(i);
    v.x += random(-1, 1);
    v.y += random(-1, 1);
    //s.setVertex(i, v);
    dots[i] = new PVector(v.x,v.y);
  }
}

void draw() {
  background(255);
  //s.disableStyle();
  
  //s.getChild(0).getChild(0).setVisible(random(100)>50);
  //shape(s,0,0);
  //println(s.getVertexCount());
  //shape(s, 0,0);
  for(int i=0; i<dots.length; i++){
    int j = (i+1)%dots.length;//int(random(dots.length));
    strokeWeight(random(0.1,1.5));
    line(dots[i].x, dots[i].y, dots[j].x, dots[j].y);
  }
}
