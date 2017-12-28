PImage img, cloud;
PVector[] traces;

void setup(){
  size(1024,512);//,P3D);
  img = loadImage("rrbtch_sprite.png");
  cloud = loadImage("spcloud.png");
  imageMode(CENTER);
  traces = new PVector[20];
  for(int i=0; i<traces.length; i++){
    traces[i] = new PVector(random(width), random(height) , random(-100,-2));
  }
}
void draw(){
  background(0);
  
  
  
  for(int i=0; i<traces.length; i++){
    traces[i].x +=  traces[i].z;
    traces[i].x += width;
    traces[i].x %= width+abs(traces[i].z); //new PVector(random(width), random(height) );
    //blendMode(ADD);
    pushMatrix();
    noStroke();fill(255);
    translate(0,0, map(traces[i].z,-100,-20, 100, -100));
    //rect(traces[i].x, traces[i].y, 100+abs(traces[i].z), 4);
    //tint(255,64);
    image(cloud, traces[i].x, traces[i].y,400,400);
    if(i == traces.length/4) doSprite();
    popMatrix();
  }
  
}

void doSprite(){
  pushMatrix();
  float f = 0.6;//0.3;
  translate(width/2,height/2);
  translate(0,  random(4) );//4*sin(radians(10*frameCount)) );
  image(img,0,0, img.width*f, img.height*f);
  popMatrix();
}
