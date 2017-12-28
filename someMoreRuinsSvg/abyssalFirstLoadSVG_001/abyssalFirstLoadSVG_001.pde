  
PShape s;

void setup() {
  size(600, 400);
  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("shapeTest_001.svg");
}

void draw() {
  s.disableStyle();
  shape(s, 0,0);
}
