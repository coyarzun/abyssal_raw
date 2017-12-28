//breaking waves
import processing.video.*;

PGraphics pg;
PShader shader;
PImage  curves, xcurves;
Boolean usexShader = true,  useShader = true, blinkShader = true, domandy = true;

PImage mandy;
Movie video;

void setup() {
  //size(320, 240, P3D);
  //size(1024,512,P3D);
  //size(displayWidth,displayHeight,P3D);
  size(400,200,P3D);
  shader   = loadShader("ccShader_003.glsl");doCurves();
  pg = createGraphics(width, height, P3D);
  mandy = loadImage("wiros_600x600.jpg");
  video = new Movie(this, "Breaking Waves - 1 Hour of Beautiful Pacific Ocean Waves in .mp4");
  video.loop();
  //video.speed(0.5);
}
void draw() {

  shader.set("resolution", float(width), float(height));
  shader.set("time", radians(millis()*0.005));//millis()));
  shader.set("textureMap", usexShader?xcurves:curves);

  if(useShader)
  shader(shader);
  
  else resetShader();
  
  background(0);
  image(domandy?mandy:video, 0, 0, width, height);
  if(blinkShader)usexShader=!usexShader;
}
void movieEvent(Movie m) {
  m.read();
}
void keyPressed(){
  if(key=='z')useShader=!useShader;
  if(key=='x')usexShader=!usexShader;
  if(key=='c')doCurves();
  if(key=='b')blinkShader=!blinkShader;
  if(key=='m')domandy=!domandy;
  if(key=='j')video.jump(random(video.duration()));
}
void doCurves(){
  curves       = createImage(256, 256, RGB);
  xcurves      = createImage(256, 256, RGB);
  for (int i=0; i<curves.width; i++) {
    for (int j=0; j<curves.height; j++) {
      xcurves.set(i, j, color(random(256), map(i, 0, curves.width, 0, 255*32)%256, random(256)));
      float v  = map(i*i, 0, curves.width*curves.width, 0, 256*1)%256;
      curves.set(i, j, color(v));
    }
  }
}
