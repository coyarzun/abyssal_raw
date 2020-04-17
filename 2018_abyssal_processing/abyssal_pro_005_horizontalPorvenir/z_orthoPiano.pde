class OrthoPiano extends Abyss {
  float   unit = 8;
  Piano piano;


  OrthoPiano() {

    //piano = new Piano();
    piano = new Piano(int(random(88)), unit);
  }
  void draw(PGraphics pg) {
    if (frameCount%10==0)piano = new Piano(int(random(88)), unit);
    pg.background(0);
    if (doOrtho)
      pg.ortho();
    else pg.perspective();
    pg.translate(pg.width/2, pg.height/2);

    pg.rotateX(-radians(45));
    pg.rotateY(radians(45));

    if (doLights)doLights(pg);
    if (doSpinY)pg.rotateY(radians(1*frameCount*0.5));
    if (doSpinZ)pg.rotateZ(radians(frameCount*0.1));


    piano.draw(pg, doLights);
  }
  void doLights(PGraphics pg) {
    pg.directionalLight( 255, 0, 0, 1, 0, 0);
    pg.directionalLight(   0, 255, 0, 0, 1, 0);
    pg.directionalLight(   0, 0, 255, 0, 0, -1);
  }
}

