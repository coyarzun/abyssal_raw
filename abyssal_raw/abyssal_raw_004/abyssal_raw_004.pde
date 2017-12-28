/*
to do:
-reunir all booleans status
-agrupar abyss en themes
-maybe activar y desactivar y luego secuenciar como en cimatica
-
*/
import ddf.minim.*;
import oscP5.*;
import netP5.*;

Minim       minim;
AudioInput  in;
OscP5 oscP5;
NetAddress myRemoteLocation;

Environment environment;
Abyssal     abyssal;

PGraphics  buffer;
PImage     cover;
PShader    shader;

boolean    fs = !true;

void setup() {
  if (fs)size(1024,768,P3D);
  else  size(displayHeight, displayHeight, P3D);
  colorMode(HSB);
  textureWrap(REPEAT);

  minim = new Minim(this);
  in = minim.getLineIn();

  buffer      = createGraphics(800, 400, P3D);
  cover       = loadImage("../_data/abyssalCover.png");
  
  environment = new Environment();
  abyssal     = new Abyssal();

  oscSetup();
}

void draw() {
  
  background(0);
  noCursor();
  drawBuffer();
  if (environment.doProcess)shaderStuff();
  else resetShader();
  image(buffer, 0, (height-width/2)/2, width, width/2);
  
}

void keyPressed(){
  abyssal.keyPressed();
}






