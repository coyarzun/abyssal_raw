class DrowningMen extends Abyss {
  Puppet[] puppet;
  PVector[] pos;

  DrowningMen() {

    puppet = new Puppet[200];
    pos    = new PVector[puppet.length];
    for (int i=0; i<puppet.length; i++) {
      puppet[i] = new Puppet();
      pos[i] = new PVector(random(-buffer.width/2, buffer.width/2), 
      random(-buffer.width/2, buffer.width/2), 
      random(-buffer.width/2, buffer.width/2)
        );
    }
  }
  void draw(PGraphics pg) {
    for (int i=0; i<puppet.length; i++) {
      puppet[i].update();
    }
    pg.background(0);
    if (doOrtho)pg.ortho();
    else pg.perspective();
    //lights();
    pg.translate(pg.width/2, pg.height/2);
    if (doLights)doLights(pg);
    pg.rotateX(-radians(15));
    pg.rotateY(radians(45));//
    if (doSpinY)pg.rotateY(radians(1*frameCount*0.5));
    if (doInvert)pg.rotateZ(PI);
    if (doSpinZ)pg.rotateZ(radians(frameCount*0.1));
    //doLights();
    pg.noStroke();
    for (int i=0; i<puppet.length; i++) {
      pg.pushMatrix();
      pg.translate(pos[i].x, pos[i].y, pos[i].z);
      puppet[i].draw(pg);
      pg.popMatrix();
    }
  }
  void doLights(PGraphics pg) {
    pg.directionalLight( 255, 0, 0, 1, 0, 0);
    pg.directionalLight(   0, 255, 0, 0, 1, 0);
    pg.directionalLight(   0, 0, 255, 0, 0, -1);
  }
  void keyPressed() {

    if (key=='l') {
      doLights=!doLights;
    }
    if (key=='q') {
      doXart=!doXart;
    }
    if (key=='w') {
      doYart=!doYart;
    }
    if (key=='e') {
      doZart=!doZart;
    }
    if (key=='r') {
      for (int i=0; i<puppet.length; i++)puppet[i].reset();
    }
    if (key=='t') {
      for (int i=0; i<puppet.length; i++)puppet[i].randomize();
    }
    if (key=='a') {
      doSpinY=!doSpinY;
    }
    if (key=='s') {
      doSpinZ=!doSpinZ;
    }
    if (key=='d') {
      doInvert=!doInvert;
    }
    if (key=='f') {
      doOrtho=!doOrtho;
    }
  }


  class Articulation {
    PVector angles, minAngles, maxAngles;

    Articulation(float ax, float minx, float maxx, 
    float ay, float miny, float maxy, 
    float az, float minz, float maxz) {
      angles = new PVector(ax, ay, az);
      minAngles = new PVector(minx, miny, minz);
      maxAngles = new PVector(maxx, maxy, maxz);
    }
    void setAndNormalizeX(float v) {
      v = constrain(v, -1.0, 1.0);
      angles.x = map(v, -1.0, 1.0, minAngles.x, maxAngles.x);
    }
    void setAndNormalizeY(float v) {
      v = constrain(v, -1.0, 1.0);
      angles.y = map(v, -1.0, 1.0, minAngles.y, maxAngles.y);
    }
    void setAndNormalizeZ(float v) {
      v = constrain(v, -1.0, 1.0);
      angles.z = map(v, -1.0, 1.0, minAngles.z, maxAngles.z);
    }
    void normalizeAll(PVector v) {
      v.x = constrain(v.x, 0.0, 1.0);
      v.y = constrain(v.y, 0.0, 1.0);
      v.z = constrain(v.z, 0.0, 1.0);
      angles.x = map(v.x, 0.0, 1.0, minAngles.x, maxAngles.x);
      angles.y = map(v.y, 0.0, 1.0, minAngles.y, maxAngles.y);
      angles.z = map(v.z, 0.0, 1.0, minAngles.z, maxAngles.z);
    }
    void apply(PGraphics pg) {
      pg.rotateX(angles.x);
      pg.rotateY(angles.y);
      pg.rotateZ(angles.z);
    }
    void reset() {
      angles.x = 0;
      angles.y = 0;
      angles.z = 0;
    }
    void randomize() {
      normalizeAll(new PVector(random(1.0), random(1.0), random(1.0)));
    }
  }




  class Puppet {
    float unit;
    ////please convertir esto en PVectors
    float hipsW, hipsH, hipsD;
    float torsoW, torsoH, torsoD;
    float chestW, chestH, chestD;
    float leg1W, leg1H, leg1D;
    float leg2W, leg2H, leg2D;
    float heelW, heelH, heelD;
    float feetW, feetH, feetD;
    float handW, handH, handD;
    float hand2W, hand2H, hand2D;
    float armW, armH, armD;
    float forearmW, forearmH, forearmD;
    float neckW, neckH, neckD;
    float headW, headH, headD;

    ///////ángulos // 9 params por articulacion // mejor obhetos?
    /////////////y esto tb!!
    //float angX,angY,angZ,minAngX,maxAngX,minAngY,maxAngY,minAngZ,maxAngZ  
    //Articulation 
    Articulation hipsAngle, torsoAngle, chestAngle, neckAngle, headAngle;
    Articulation leftShoulderAngle, leftElbowAngle, leftWristAngle, leftHandAngle;
    Articulation rightShoulderAngle, rightElbowAngle, rightWristAngle, rightHandAngle;
    Articulation leftLegAngle, leftKneeAngle, leftAnkleAngle, leftFeetAngle;
    Articulation rightLegAngle, rightKneeAngle, rightAnkleAngle, rightFeetAngle;

    Puppet() {
      setupBody();
      setupArticulations();
      randomize();
    }
    void setupArticulations() {
      hipsAngle          = new Articulation(
      0, -PI/6, PI/6, 
      0, -PI/4, PI/4, //
      0, -PI/4, PI/4//PI/4, -PI, PI
      ); 
      torsoAngle         = new Articulation(
      0, -3*PI/4, PI/6, 
      0, -PI/4, PI/4, //0, 0, 0, 
      0, -PI/6, PI/6
        ); 
      chestAngle         = new Articulation(
      0, -PI/6, PI/12, 
      0, -PI/4, PI/4, //0, 0, 0, 
      0, -PI/6, PI/6
        ); 
      neckAngle          = new Articulation(
      0, -PI/6, PI/6, 
      0, -PI/4, PI/4, //0, 0, 0, 
      0, -PI/6, PI/6
        ); 
      headAngle          = new Articulation(
      0, -PI/6, PI/6, 
      0, -PI/4, PI/4, //0, 0, 0, 
      0, -PI/6, PI/6
        );
      leftShoulderAngle  = new Articulation(
      0, -PI, PI, 
      0, -PI/6, PI/6, 
      0, 0, PI
        ); 
      leftElbowAngle     = new Articulation(
      0, 0, 3*PI/4, 
      0, -PI/2, PI/2, 
      0, 0, 0
        ); 
      leftWristAngle     = new Articulation(
      0, -PI/6, PI/6, 
      0, 0, 0, 
      0, -PI/3, PI/2
        ); 
      leftHandAngle      = new Articulation(
      0, -PI/6, PI/6, 
      0, 0, 0, 
      0, -PI/2, PI/24
        );
      rightShoulderAngle = new Articulation(
      0, -PI, PI, 
      0, -PI/6, PI/6, 
      0, 0, -PI
        ); 
      rightElbowAngle    = new Articulation(
      0, 0, 3*PI/4, 
      0, -PI/2, PI/2, 
      0, 0, 0
        ); 
      rightWristAngle    = new Articulation(
      0, -PI/6, PI/6, 
      0, 0, 0, 
      0, -PI/2, PI/3
        ); 
      rightHandAngle     = new Articulation(
      0, -PI/6, PI/6, 
      0, 0, 0, 
      0, -PI/24, PI/2
        );
      leftLegAngle       = new Articulation(
      0, -PI/6, 3*PI/4, 
      0, -PI/2, PI/24, 
      0, 0, PI/2
        ); 
      leftKneeAngle      = new Articulation(
      0, -3*PI/4, 0, 
      0, 0, 0, 
      0, 0, 0
        ); 
      leftAnkleAngle     = new Articulation(
      0, -PI/6, PI/6, 
      0, -PI/6, PI/6, 
      0, -PI/12, PI/12
        ); 
      leftFeetAngle      = new Articulation(
      0, -PI/6, PI/6, 
      0, 0, 0, 
      0, 0, 0
        );
      rightLegAngle      = new Articulation(
      0, -PI/6, 3*PI/4, 
      0, -PI/24, PI/2, 
      0, -PI/2, 0
        ); 
      rightKneeAngle     = new Articulation(
      0, -3*PI/4, 0, 
      0, 0, 0, 
      0, 0, 0
        ); 
      rightAnkleAngle    = new Articulation(
      0, -PI/6, PI/6, 
      0, -PI/6, PI/6, 
      0, -PI/12, PI/12
        ); 
      rightFeetAngle     = new Articulation(
      0, -PI/6, PI/6, 
      0, 0, 0, 
      0, 0, 0
        );
    }
    void setupBody() {
      unit = 4;

      hipsW = 3*unit;
      hipsH = 2*unit;
      hipsD = 1*unit;

      torsoW = 2*unit;
      torsoH = 2*unit;
      torsoD = 1*unit;

      chestW = 3*unit;
      chestH = 3*unit;
      chestD = 1.5*unit;

      armW  = 1*unit;
      armH  = 2.5*unit;
      armD  = 1*unit;

      forearmW  = 1*unit;
      forearmH  = 2*unit;
      forearmD  = 1*unit;

      handW  = 0.6*unit;
      handH  = 1*unit;
      handD  = 0.8*unit;

      hand2W  = 0.2*unit;
      hand2H  = 1*unit;
      hand2D  = 0.8*unit;

      neckW   = 1*unit;
      neckH   = 1*unit;
      neckD   = 1*unit;

      headW   = 2*unit;
      headH   = 2.5*unit;
      headD   = 2*unit;

      leg1W  = 1*unit;
      leg1H  = 3*unit;
      leg1D  = 1*unit;
      leg2W  = 1*unit;
      leg2H  = 3*unit;
      leg2D  = 1*unit;
      heelW  = 1*unit;
      heelH  = 1*unit;
      heelD  = 1.5*unit;
      feetW  = 1*unit;
      feetH  = 0.5*unit;
      feetD  = 2*unit;
    }
    void update() {
      updateArticulations();
    }
    void draw(PGraphics pg) {
      drawTorso(pg);
    }
    void drawTorso(PGraphics pg) {


      //torso
      pg.pushMatrix();
      pg.translate(0, unit/2, 0);
      hipsAngle.apply(pg);
      drawCrotch(pg);
      //hips
      drawLegL(pg);
      drawLegR(pg);
      pg.translate(0, -hipsH/2, 0);

      pg.box(hipsW, hipsH, hipsD);
      pg.translate(0, -hipsH/2, 0);
      //torsomismo
      torsoAngle.apply(pg);
      pg.translate(0, -torsoH/2, 0);
      pg.box(torsoW, torsoH, torsoD);
      pg.translate(0, -torsoH/2, 0);
      //chest
      chestAngle.apply(pg);
      pg.translate(0, -chestH/2, 0);
      pg.box(chestW, chestH, chestD);
      pg.translate(0, -chestH/2, 0);

      //left Arm
      drawArmL(pg);
      drawArmR(pg);
      drawHead(pg);
      pg.popMatrix();
    }
    void drawHead(PGraphics pg) {
      pg.pushMatrix();
      //neck
      neckAngle.apply(pg);
      pg.translate(0, -neckH/2, 0);
      pg.box(neckW, neckH, neckD);
      pg.translate(0, -neckH/2, 0);
      //head mism
      headAngle.apply(pg);
      pg.translate(0, -headH/2, headD/3-neckD/2);
      pg.box(headW, headH, headD);
      pg.popMatrix();
    }
    void drawCrotch(PGraphics pg) {
      //crotch
      pg.pushMatrix();
      pg.translate(0, unit/2, unit/4);
      pg.box(unit);
      pg.popMatrix();
    }
    void drawArmL(PGraphics pg) {
      //shoulder L
      pg.pushMatrix();
      pg.translate(-chestW/2-unit/2, unit/2, 0);

      leftShoulderAngle.apply(pg);
      pg.box(unit*.6);
      pg.translate(0, unit/2, 0);
      //arm L
      pg.translate(0, armH/2, 0);
      pg.box(armW, armH, armD);
      pg.translate(0, armH/2, 0);
      //elbow L
      pg.translate(0, unit/2, 0);
      leftElbowAngle.apply(pg);
      pg.box(unit*.6);
      pg.translate(0, unit/2, 0);
      //forearm L
      pg.translate(0, forearmH/2, 0);
      pg.box(forearmW, forearmH, forearmD);
      pg.translate(0, forearmH/2, 0);
      //wrist L
      pg.translate(0, unit/2, 0);
      leftWristAngle.apply(pg);
      pg.box(unit*.6);
      pg.translate(0, unit/2, 0);
      //hand L
      pg.translate(0, handH/2, 0);
      pg.box(handW, handH, handD);
      pg.translate(0, handH/2, 0);
      leftHandAngle.apply(pg);
      pg.translate(-handW/2+hand2W/2, hand2H/2, 0);
      pg.box(hand2W, hand2H, hand2D);
      pg.popMatrix();
    }
    void drawArmR(PGraphics pg) {
      //shoulder R
      pg.pushMatrix();
      pg.translate(chestW/2+unit/2, unit/2, 0);
      rightShoulderAngle.apply(pg);
      pg.box(unit*.6);

      pg.translate(0, unit/2, 0);
      //arm R
      pg.translate(0, armH/2, 0);
      pg.box(armW, armH, armD);
      pg.translate(0, armH/2, 0);
      //elbow R
      pg.translate(0, unit/2, 0);
      rightElbowAngle.apply(pg);
      pg.box(unit*.6);
      pg.translate(0, unit/2, 0);
      //forearm R
      pg.translate(0, forearmH/2, 0);
      pg.box(forearmW, forearmH, forearmD);
      pg.translate(0, forearmH/2, 0);
      //wrist R
      pg.translate(0, unit/2, 0);
      rightWristAngle.apply(pg);
      pg.box(unit*.6);
      pg.translate(0, unit/2, 0);
      //hand R
      pg.translate(0, handH/2, 0);
      pg.box(handW, handH, handD);

      rightHandAngle.apply(pg);
      pg.translate(0, handH/2, 0);
      pg.translate(handW/2-hand2W/2, hand2H/2, 0);
      pg.box(hand2W, hand2H, hand2D);
      pg.popMatrix();
    }
    void drawLegL(PGraphics pg) {
      //pierna L
      pg.pushMatrix();

      pg.translate(0, unit/2, 0);
      pg.translate(-hipsW/2+unit/2, 0, 0);
      pg.box(unit*.6);
      leftLegAngle.apply(pg);
      pg.translate(0, unit/2, 0);
      pg.translate(0, leg1H/2, 0);
      pg.box(leg1W, leg1H, leg1D);
      //knee L

      pg.translate(0, leg1H/2, 0);
      pg.translate(0, unit/2, 0);
      pg.box(unit*.6);
      //rotateX(radians(frameCount));

      leftKneeAngle.apply(pg);

      pg.translate(0, unit/2, 0);
      pg.translate(0, leg2H/2, 0);
      pg.box(leg2W, leg2H, leg2D);
      //ankle
      pg.translate(0, leg2H/2, 0);
      pg.translate(0, unit/2, 0);
      pg.box(unit*.6);
      leftAnkleAngle.apply(pg);
      //heel
      pg.translate(0, heelH/2, 0);
      pg.box(heelW, heelH, heelD);

      leftFeetAngle.apply(pg);
      //foot
      pg.translate(0, heelH/2-feetH/2, feetD/2);
      pg.box(feetW, feetH, feetD);
      pg.popMatrix();
    }
    void drawLegR(PGraphics pg) {
      //pierna R
      pg.pushMatrix();

      pg.translate(0, unit/2, 0);
      pg.translate(hipsW/2-unit/2, 0, 0);
      pg.box(unit*.6);
      rightLegAngle.apply(pg);
      pg.translate(0, unit/2, 0);

      pg.translate(0, leg1H/2, 0);
      pg.box(leg1W, leg1H, leg1D);
      //knee L
      pg.translate(0, leg1H/2, 0);
      pg.translate(0, unit/2, 0);
      pg.box(unit*.6);
      rightKneeAngle.apply(pg);
      //rotateX(radians(frameCount));
      pg.translate(0, unit/2, 0);
      pg.translate(0, leg2H/2, 0);
      pg.box(leg2W, leg2H, leg2D);
      //ankle
      pg.translate(0, leg2H/2, 0);
      pg.translate(0, unit/2, 0);
      pg.box(unit*.6);
      rightAnkleAngle.apply(pg);
      //heel
      pg.translate(0, heelH/2, 0);
      pg.box(heelW, heelH, heelD);
      rightFeetAngle.apply(pg);
      //foot
      pg.translate(0, heelH/2-feetH/2, feetD/2);
      pg.box(feetW, feetH, feetD);
      pg.popMatrix();
    }
    void updateArticulations() {
      if (doXart)setAndNormalizeX();
      if (doYart)setAndNormalizeY();
      if (doZart)setAndNormalizeZ();
    }
    void setAndNormalizeX() {

      hipsAngle.setAndNormalizeX(  sin( radians(frameCount) ) );
      torsoAngle.setAndNormalizeX( sin( radians(frameCount) ) );
      chestAngle.setAndNormalizeX( sin( radians(frameCount) ) );
      neckAngle.setAndNormalizeX(  sin( radians(frameCount) ) );
      headAngle.setAndNormalizeX(  sin( radians(frameCount) ) );

      leftLegAngle.setAndNormalizeX(   sin( radians(frameCount) ) );
      leftKneeAngle.setAndNormalizeX(  sin( radians(frameCount) ) );
      leftAnkleAngle.setAndNormalizeX( sin( radians(frameCount) ) );
      leftFeetAngle.setAndNormalizeX(  sin( radians(frameCount) ) );

      rightLegAngle.setAndNormalizeX(   sin( radians(frameCount) ) );
      rightKneeAngle.setAndNormalizeX(  sin( radians(frameCount) ) );
      rightAnkleAngle.setAndNormalizeX( sin( radians(frameCount) ) );
      rightFeetAngle.setAndNormalizeX(  sin( radians(frameCount) ) );

      leftShoulderAngle.setAndNormalizeX(   sin( radians(frameCount) ) );
      leftElbowAngle.setAndNormalizeX(  sin( radians(frameCount) ) );
      leftWristAngle.setAndNormalizeX( sin( radians(frameCount) ) );
      leftHandAngle.setAndNormalizeX(  sin( radians(frameCount) ) );

      rightShoulderAngle.setAndNormalizeX( sin( radians(frameCount) ) );
      rightElbowAngle.setAndNormalizeX(  sin( radians(frameCount) ) );
      rightWristAngle.setAndNormalizeX( sin( radians(frameCount) ) );
      rightHandAngle.setAndNormalizeX(  sin( radians(frameCount) ) );
    }

    void setAndNormalizeY() {

      hipsAngle.setAndNormalizeY(  sin( radians(frameCount) ) );
      torsoAngle.setAndNormalizeY( sin( radians(frameCount) ) );
      chestAngle.setAndNormalizeY( sin( radians(frameCount) ) );
      neckAngle.setAndNormalizeY(  sin( radians(frameCount) ) );
      headAngle.setAndNormalizeY(  sin( radians(frameCount) ) );

      leftLegAngle.setAndNormalizeY(   sin( radians(frameCount) ) );
      leftKneeAngle.setAndNormalizeY(  sin( radians(frameCount) ) );
      leftAnkleAngle.setAndNormalizeY( sin( radians(frameCount) ) );
      leftFeetAngle.setAndNormalizeY(  sin( radians(frameCount) ) );

      rightLegAngle.setAndNormalizeY(   -sin( radians(frameCount) ) );
      rightKneeAngle.setAndNormalizeY(  -sin( radians(frameCount) ) );
      rightAnkleAngle.setAndNormalizeY( -sin( radians(frameCount) ) );
      rightFeetAngle.setAndNormalizeY(  -sin( radians(frameCount) ) );

      leftShoulderAngle.setAndNormalizeY(   sin( radians(frameCount) ) );
      leftElbowAngle.setAndNormalizeY(  sin( radians(frameCount) ) );
      leftWristAngle.setAndNormalizeY( sin( radians(frameCount) ) );
      leftHandAngle.setAndNormalizeY(  sin( radians(frameCount) ) );

      rightShoulderAngle.setAndNormalizeY( sin( radians(frameCount) ) );
      rightElbowAngle.setAndNormalizeY(  sin( radians(frameCount) ) );
      rightWristAngle.setAndNormalizeY( sin( radians(frameCount) ) );
      rightHandAngle.setAndNormalizeY(  sin( radians(frameCount) ) );
    }  

    void setAndNormalizeZ() {

      hipsAngle.setAndNormalizeZ(  sin( 2*radians(frameCount) ) );
      torsoAngle.setAndNormalizeZ( sin( radians(frameCount) ) );
      chestAngle.setAndNormalizeZ( sin( radians(frameCount) ) );
      neckAngle.setAndNormalizeZ(  sin( 2*radians(frameCount) ) );
      headAngle.setAndNormalizeZ(  sin( radians(frameCount) ) );

      leftLegAngle.setAndNormalizeZ(   sin( radians(frameCount) ) );
      leftKneeAngle.setAndNormalizeZ(  sin( radians(frameCount) ) );
      leftAnkleAngle.setAndNormalizeZ( sin( radians(frameCount) ) );
      leftFeetAngle.setAndNormalizeZ(  sin( radians(frameCount) ) );

      rightLegAngle.setAndNormalizeZ(   -sin( radians(frameCount) ) );
      rightKneeAngle.setAndNormalizeZ(  -sin( radians(frameCount) ) );
      rightAnkleAngle.setAndNormalizeZ( -sin( radians(frameCount) ) );
      rightFeetAngle.setAndNormalizeZ(  -sin( radians(frameCount) ) );

      leftShoulderAngle.setAndNormalizeZ(   sin( 0.5*radians(frameCount) ) );
      leftElbowAngle.setAndNormalizeZ(  sin( radians(frameCount) ) );
      leftWristAngle.setAndNormalizeZ( sin( radians(frameCount) ) );
      leftHandAngle.setAndNormalizeZ(  sin( radians(frameCount) ) );

      rightShoulderAngle.setAndNormalizeZ( sin( 0.6*radians(frameCount) ) );
      rightElbowAngle.setAndNormalizeZ(  sin( radians(frameCount) ) );
      rightWristAngle.setAndNormalizeZ( sin( radians(frameCount) ) );
      rightHandAngle.setAndNormalizeZ(  sin( radians(frameCount) ) );
    }

    void reset() {

      hipsAngle.reset();
      torsoAngle.reset();
      chestAngle.reset();
      neckAngle.reset();
      headAngle.reset();

      leftLegAngle.reset();
      leftKneeAngle.reset();
      leftAnkleAngle.reset();
      leftFeetAngle.reset();

      rightLegAngle.reset();
      rightKneeAngle.reset();
      rightAnkleAngle.reset();
      rightFeetAngle.reset();

      leftShoulderAngle.reset();
      leftElbowAngle.reset();
      leftWristAngle.reset();
      leftHandAngle.reset();

      rightShoulderAngle.reset();
      rightElbowAngle.reset();
      rightWristAngle.reset();
      rightHandAngle.reset();
    }
    void randomize() {

      hipsAngle.randomize();
      torsoAngle.randomize();
      chestAngle.randomize();
      neckAngle.randomize();
      headAngle.randomize();

      leftLegAngle.randomize();
      leftKneeAngle.randomize();
      leftAnkleAngle.randomize();
      leftFeetAngle.randomize();

      rightLegAngle.randomize();
      rightKneeAngle.randomize();
      rightAnkleAngle.randomize();
      rightFeetAngle.randomize();

      leftShoulderAngle.randomize();
      leftElbowAngle.randomize();
      leftWristAngle.randomize();
      leftHandAngle.randomize();

      rightShoulderAngle.randomize();
      rightElbowAngle.randomize();
      rightWristAngle.randomize();
      rightHandAngle.randomize();
    }
  }
}

