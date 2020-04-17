class OrthoSphere extends Abyss {

  //voolean
  int cols, rows;
  float radiors, radius, dlong, dlat;

  OrthoSphere() {  
    cols = 72/2; 
    rows = 2*cols;
    dlong = TWO_PI/float(cols);
    dlat  = TWO_PI/float(rows);
  }
  void draw(PGraphics pg) {
    radiors = doRadiox?pg.width/2:0.99*(2+0.05*sin(radians(frameCount)))*2*pg.width; 




    pg.background(0);
    if (doOrtho)pg.ortho();
    else pg.perspective();
    pg.translate(pg.width/2, pg.height/2);

    if (doLights)doLights(pg);

    pg.noStroke();
    pg.fill(255, (doAlpha?64:255));
    if (doSpinX)pg.rotateX(radians(frameCount));
    if (doSpinY)pg.rotateY(radians(frameCount));



    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        pg.pushMatrix();
        pg.rotateY(i*dlong);
        pg.rotateZ(-PI+j*dlat);
        pg.translate(radius, 0, 0);
        //box(8,dlat*radius,dlong*radius);
        radius = radiors;
        if (doPolar)radius*= (1+cos(2*i*dlong+radians(frameCount*2)));
        pg.scale(2.0, dlat*radius, dlong*radius);
        pg.rotateX(PI/4);
        pg.box(1.0*sqrt(0.5));
        pg.scale((0.5));
        //
        pg.box(100, 0.2, 0.2);
        pg.popMatrix();
      }
    }
    if (doBlink)doLights=!doLights;
    if (doRandomPolar && random(100)>90)doPolar=!doPolar;
    if (doInvert)pg.filter(INVERT);
    if (doBlinkInvert && frameCount%3==0)doInvert=!doInvert;
  }
  void doLights(PGraphics pg) {
    pg.directionalLight( 255, 0, 0, 1, 0, 0);
    pg.directionalLight(   0, 255, 0, 0, 1, 0);
    pg.directionalLight(   0, 0, 255, 0, 0, -1);
  }
}

