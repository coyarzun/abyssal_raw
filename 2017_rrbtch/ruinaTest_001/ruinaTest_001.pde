PImage img;

void setup(){
  size(1024,512,P3D);
  img = loadImage("rrbtch_sprite.png");
  imageMode(CENTER);
}
void draw(){
  background(0);
  float f = 0.6;
  pushMatrix();
  translate(width/2,height/2);
  translate(0,  random(4) );//4*sin(radians(10*frameCount)) );
  image(img,0,0, img.width*f, img.height*f);
  popMatrix();
}
