  
PShape s;

void setup() {
  size(600, 400);
  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("shapeTest_001.svg");
}

void draw() {
  s.disableStyle();
  println(s.getVertexCount());
   for (int i = 0; i < s.getChild(0).getChild(0).getVertexCount(); i++) {
    PVector v = s.getChild(0).getChild(0).getVertex(i);
    v.x += random(-1, 1);
    v.y += random(-1, 1);
    //s.setVertex(i, v);
    point(v.x,v.y);
  }
  //shape(s, 0,0);
}
