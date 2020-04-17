class LoverSeries extends Abyss {
  TrailParticle[] trail;
  //

  LoverSeries(){
    trail= new TrailParticle[20];
    for (int i=0; i<trail.length; i++) {
      trail[i]= new TrailParticle(new PVector(0, 0, 0));
    }
  }
  void draw(PGraphics pg) {
    for (int i=0; i<trail.length; i++) {
      trail[i].update(pg);
    }


    pg.background(0);
    if (doOrtho)pg.ortho();
    else pg.perspective();
    pg.translate(pg.width/2, pg.height/2);

    pg.rotateX(radians(45+30+15));
    pg.translate((doFirst?-trail[0].pos.x:0), -trail[0].pos.y-pg.height/4, 0);

    pg.pushMatrix();

    pg.rotateZ(radians(frameCount));
    if (doLights)doLights(pg);
    pg.popMatrix();

    for (int i=0; i<trail.length; i++) {
      trail[i].draw(pg);
    }
  }
  void doLights(PGraphics pg) {
    pg.directionalLight( 255, 0, 0, 1, 0, 0);
    pg.directionalLight(   0, 255, 0, 0, 1, 0);
    pg.directionalLight(   0, 0, 255, 0, 0, -1);
  }


  class TrailParticle {
    int     tailLength = 50;
    ArrayList<PVector> trail;
    ArrayList<PVector> trailAng;
    float   unit;
    PVector pos, ang;

    TrailParticle(PVector p) {
      pos = new PVector(p.x, p.y, p.z);
      ang = new PVector(random(TWO_PI), random(TWO_PI), random(TWO_PI));
      unit = 8;
      trail = new ArrayList<PVector>();
      trailAng = new ArrayList<PVector>();
    }
    void update(PGraphics pg) {
      trail.add( new PVector(pos.x, pos.y, pos.z) );
      trailAng.add( new PVector(ang.x, ang.y, ang.z) );
      pos.x+= random(-unit, unit);
      pos.y-= unit;
      pos.z+= random(-unit, unit);
      pos.x = constrain(pos.x, -pg.width/4, pg.width/4);
      pos.z = constrain(pos.z, -pg.width/4, pg.width/4);

      if (trail.size()>tailLength)trail.remove(0);
    }
    void draw(PGraphics pg) {
      pg.fill(255);
      pg.pushMatrix();
      pg.translate(pos.x, pos.y, pos.z);
      //if(doLights)
      pg.noStroke();
      if (doRumble) {
        pg.rotateX(ang.x);
        pg.rotateY(ang.y);
        pg.rotateZ(ang.z);
      }
      pg.box(unit);
      pg.popMatrix();
      for (int i=0; i<trail.size (); i++) {
        pg.fill(255, doAlpha?map(i, 0, tailLength, 0, 255):255);
        pg.pushMatrix();
        pg.translate(trail.get(i).x, trail.get(i).y, trail.get(i).z);
        if (doRumble) {
          pg.rotateX(trailAng.get(i).x);
          pg.rotateY(trailAng.get(i).y);
          pg.rotateZ(trailAng.get(i).z);
        }
        pg.box(unit*.8);
        pg.popMatrix();
      }
    }
  }
}

