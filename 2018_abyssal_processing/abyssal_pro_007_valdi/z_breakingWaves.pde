class BreakingWaves extends Abyss {

  float   unit;
  int     rows, cols, wlight;
  float[][] buffer;

  BreakingWaves() {
    unit = 8;   
    cols = 5*2*2*2*2; 
    rows = 1*(cols+2)/2;
    buffer = new float[cols][rows];
  }
  void draw(PGraphics pg) {

    doBuffer();
    pg.background(0);
    pg.noStroke();
    if (doOrtho)pg.ortho();
    else pg.perspective();
    pg.translate(0, pg.width/4, -pg.height/2);
    pg.rotateX(-radians(15));
    pg.rotateY(radians(45));

    doLights(pg);

    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        pg.pushMatrix();
        pg.translate(i*unit-j*unit, ytrans?-j*unit:0, i*unit+j*unit);
        pg.box(unit, someV(i, j), unit);
        pg.popMatrix();
      }
    }

    if (doBlink)ytrans=!ytrans;
  }
  void doBuffer() {
    for (int i=0; i<cols; i++) {
      buffer[i][0] = in.left.get(i);//random(1.0);
      for (int j=rows; j>1; j--) {
        buffer[i][j-1] = buffer[i][j-2];
      }
    }
  }
  void resetBuffer() {
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        buffer[i][j]=0;
      }
    }
  }
  float someV(int i, int j) {
    //return abs(20*sin(i*TWO_PI/cols+radians(2*frameCount))*cos(j*TWO_PI/rows+radians(frameCount)))*unit;
    return unit*16*buffer[i][j];
  }
  void doLights(PGraphics pg) {
    if (doCycle) {
      if (frameCount%3==0) {
        pg.directionalLight( 255, 0, 0, 1, 0, 0);
        pg.directionalLight(   0, 255, 0, 0, 1, 0);
        pg.directionalLight(   0, 0, 255, 0, 0, -1);
      } else if (frameCount%3==1) {
        pg.directionalLight(   0, 0, 255, 1, 0, 0);
        pg.directionalLight( 255, 0, 0, 0, 1, 0);
        pg.directionalLight(   0, 255, 0, 0, 0, -1);
      } else {
        pg.directionalLight(   0, 255, 0, 1, 0, 0);
        pg.directionalLight(   0, 0, 255, 0, 1, 0);
        pg.directionalLight( 255, 0, 0, 0, 0, -1);
      }
    } else {
      if (wlight==0) {
        pg.directionalLight( 255, 0, 0, 1, 0, 0);
        pg.directionalLight(   0, 255, 0, 0, 1, 0);
        pg.directionalLight(   0, 0, 255, 0, 0, -1);
      } else if (wlight==1) {
        pg.directionalLight(   0, 0, 255, 1, 0, 0);
        pg.directionalLight( 255, 0, 0, 0, 1, 0);
        pg.directionalLight(   0, 255, 0, 0, 0, -1);
      } else {
        pg.directionalLight(   0, 255, 0, 1, 0, 0);
        pg.directionalLight(   0, 0, 255, 0, 1, 0);
        pg.directionalLight( 255, 0, 0, 0, 0, -1);
      }
    }
  }
}

