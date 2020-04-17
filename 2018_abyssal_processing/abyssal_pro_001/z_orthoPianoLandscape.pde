class OrthoPianoLandscape extends Abyss {
  float   unit = 2;
  Piano[] pianos;
  PVector[] pos, angles;


  OrthoPianoLandscape() {
    //piano = new Piano();
    pianos = new Piano[100];//
    pos    = new PVector[pianos.length];
    angles = new PVector[pianos.length];
    for (int i=0; i<pianos.length; i++) {
      pianos[i] = new Piano(int(random(88)), unit);
      pos[i]    = new PVector(random(-buffer.width/2, buffer.width/2), 
      0, //random(-width/2,width/2),
      random(-buffer.width/2, buffer.width/2));
      angles[i]  = new PVector(random(TWO_PI), 
      random(TWO_PI), 
      random(TWO_PI));
    }
  }
  void draw(PGraphics pg) {
    //if(frameCount%10==0)piano = new Piano(int(random(88)));
    pg.background(0);
    if (doOrtho)
      pg.ortho();
    else pg.perspective();
    pg.translate(pg.width/2, pg.height/2);

    pg.rotateX(-radians(15));
    //rotateY(radians(45));

    if (doLights)doLights(pg);
    if (doSpinY)pg.rotateY(radians(1*frameCount*0.5));
    //if(doSpinZ)rotateZ(radians(frameCount*0.1));

    for (int i=0; i<pianos.length; i++) {
      pg.pushMatrix();
      pg.translate(pos[i].x, pos[i].y, pos[i].z);
      pg.rotateX(angles[i].x);
      pg.rotateY(angles[i].y);
      pg.rotateZ(angles[i].z);
      pianos[i].draw(pg, doLights);
      pg.popMatrix();
    }

    pg.translate(0, 1000, 0);
    pg.fill(0);
    pg.box(2000+20*sin(radians((doLights?2:4)*frameCount)));
  }
  void doLights(PGraphics pg) {
    pg.directionalLight( 255, 0, 0, 1, 0, 0);
    pg.directionalLight(   0, 255, 0, 0, 1, 0);
    pg.directionalLight(   0, 0, 255, 0, 0, -1);
  }
}

