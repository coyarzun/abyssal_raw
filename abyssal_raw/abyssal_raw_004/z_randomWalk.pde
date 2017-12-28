class RandomWalk extends Abyss {
  float   unit;
  int cols, rows, zcols;

  ThreeDeeWalker walker;

  RandomWalk() {
    cols = 16; 
    rows = 32; 
    zcols = 16;
    walker = new ThreeDeeWalker();
  }
  void draw(PGraphics pg) {
    if (doScaleUnit)unit = 16*4;
    else unit = 32;
    pg.background(0);
    pg.camera();
    pg.translate(pg.width/2, pg.height/2);
    doView(pg);
    //if(frameCount%2==0)
    //if(random(100)>30)
    if (doGrid)doGrid(pg);
    //else{
    if (doLights)doLights(pg);
    walker.update();
    walker.draw(pg);
    if (doBlink)doLights=!doLights;
    //}
  }
  void doView(PGraphics pg) {
    if (wichView==0) {
      pg.ortho();
      pg.rotateY(radians(+(doSpin?frameCount:0)));
    } else if (wichView==1) {
      pg.perspective();
      pg.rotateY(radians(+(doSpin?frameCount:0)));
    } else if (wichView==2) {
      pg.ortho();
      pg.rotateX(-radians(45));//+(doSpin?frameCount:0)));//));//+frameCount));
      pg.rotateY(radians(45+(doSpin?frameCount:0)));
    } else if (wichView==3) {
      pg.perspective();
      pg.rotateX(-radians(45));//+(doSpin?frameCount:0)));//));//
      pg.rotateY(radians(45+(doSpin?frameCount:0)));//
    } else {
      pg.beginCamera();
      //ortho();
      pg.camera();
      pg.translate(pg.width/2, pg.height/2);
      pg.translate(-cols*unit/2, -rows*unit/2, -zcols*unit/2);
      pg.translate(
      walker.paths.get(walker.paths.size()-1).current.x*unit, 
      walker.paths.get(walker.paths.size()-1).current.y*unit, 
      walker.paths.get(walker.paths.size()-1).current.z*unit
        );
      pg.rotateX(walker.paths.get(walker.paths.size()-1).direction.x*PI/2);
      pg.rotateY(walker.paths.get(walker.paths.size()-1).direction.y*PI/2);
      pg.rotateZ(walker.paths.get(walker.paths.size()-1).direction.z*PI/2);
      /*
    walker.paths.get(walker.paths.size()-1).direction.x,
       walker.paths.get(walker.paths.size()-1).direction.y,
       walker.paths.get(walker.paths.size()-1).direction.z
       */

      pg.endCamera();
    }
  }
  void doGrid(PGraphics pg) {
    pg.pushMatrix();
    pg.translate(-cols*unit/2.0, -rows*unit/2.0, -zcols*unit/2.0);
    pg.strokeWeight(2);
    pg.beginShape(POINTS);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        for (int k=0; k<cols; k++) {
          if (colorMood==0)
            pg.stroke(255);
          else if (colorMood==1) {
            pg.stroke(0, 255, 0);
          } else {
            pg.stroke(map(i, 0, cols, 0, 255), map(j, 0, rows, 0, 255), map(k, 0, zcols, 0, 255));
          }
          pg.vertex(i*unit, j*unit, k*unit);
        }
      }
    }
    pg.endShape();
    pg.popMatrix();
  }
  
  void doLights(PGraphics pg) {
    pg.directionalLight( 255, 0, 0, 1, 0, 0);
    pg.directionalLight(   0, 255, 0, 0, 1, 0);
    pg.directionalLight(   0, 0, 255, 0, 0, -1);
  }



  class Path {
    PVector from, to, current, speed, direction;

    int life = 10*1*5;
    ThreeDeeWalker root;
    boolean done, reallydone;

    Path(ThreeDeeWalker r, PVector f, PVector t, PVector d) {
      root = r;
      from = f;  
      to   = t; 
      current = new PVector(from.x, from.y, from.z);
      direction = d;
      speed = new PVector(d.x, d.y, d.z);
    }
    void update() {
      life--;
      if (!done) {
        current.x+=speed.x;
        current.y+=speed.y;
        current.z+=speed.z;
      } else if (life<0) {
        from.x+=speed.x;
        from.y+=speed.y;
        from.z+=speed.z;
      }
      //println(from+" "+current+" "+to);

      if ((to.x-current.x)+(to.y-current.y)+(to.z-current.z)==0.0 && !done) {
        //println("next!");
        root.addPath();
        //speed.x=0;speed.y=0;speed.z=0;
        done = true;
        println("done");
      }

      if ((to.x-from.x)+(to.y-from.y)+(to.z-from.z)==0.0) {
        //println("next!");
        speed.x=0;
        speed.y=0;
        speed.z=0;
        reallydone = true;
        println("dead");
      }
    }
    void draw(PGraphics pg) {
      if (boxMode)
        boxDraw(pg);
      else
        lineDraw(pg);
    }
    void boxDraw(PGraphics pg) {
      pg.pushMatrix();
      pg.noStroke();
      float w = (1+(abs(current.x-from.x)))*unit;
      float h = (1+(abs(current.y-from.y)))*unit;
      float d = (1+(abs(current.z-from.z)))*unit;
      float cx = (current.x-from.x)/2;
      float cy = (current.y-from.y)/2;
      float cz = (current.z-from.z)/2;
      pg.translate((from.x+cx)*unit, (from.y+cy)*unit, (from.z+cz)*unit);
      pg.fill(255);//,64);
      pg.box(w, h, d);
      pg.popMatrix();
    }
    void lineDraw(PGraphics pg) {
      //println("drawing?");
      //pushMatrix();vvv
      pg.line(from.x*unit, from.y*unit, from.z*unit, current.x*unit, current.y*unit, current.z*unit);
      //popMatrix();
    }
  }
  class ThreeDeeWalker {
    ArrayList<Path> paths;
    int pathIndex;

    ThreeDeeWalker() {
      paths = new ArrayList<Path>();
      pathIndex = 0;
      addPath();
    }
    void addPath() {
      int c, r, z, tc, tr, tz, ll;

      if (pathIndex==0) {
        c = int(random(cols));
        r = int(random(rows));
        z = int(random(zcols));
      } else {
        c = int(paths.get(pathIndex-1).to.x);
        r = int(paths.get(pathIndex-1).to.y);
        z = int(paths.get(pathIndex-1).to.z);
        //debiera ser, evaluar en q eje se mueve y elejir solo los otros 2
      }
      /////////////
      float dice = random(100);
      if (dice<30) { 
        tc = int(random(cols));
        tr = r;
        tz = z;
      } else if (dice<60) {
        tc = c;
        tr = int(random(rows));
        tz = z;
      } else {
        tc = c;
        tr = r;
        tz = int(random(zcols));
      }
      /////////////
      int ddC = (tc-c);
      int ddR = (tr-r);
      int ddZ = (tz-z);
      int dC, dR, dZ;
      if (ddC==0) dC = 0;
      else dC = abs(ddC)/ddC;

      if (ddR==0) dR = 0;
      else dR = abs(ddR)/ddR;

      if (ddZ==0) dZ = 0;
      else dZ = abs(ddZ)/ddZ;
      ///////////////////
      paths.add(new Path(this, new PVector(c, r, z), new PVector(tc, tr, tz), new PVector(dC, dR, dZ)));
      pathIndex++;
    }
    void update() {
      for (int i=0; i<paths.size (); i++) {
        paths.get(i).update();
        if (paths.get(i).reallydone) {//<0){
          paths.remove(i);
          pathIndex--;
        }
      }
      //addPath();
    }
    void draw(PGraphics pg) {
      pg.noStroke();
      pg.pushMatrix();
      pg.translate(-cols*unit/2.0, -rows*unit/2.0, -zcols*unit/2.0);
      //box(unit*12);
      if (!boxMode)
      {
        pg.beginShape();
        pg.stroke(255);
        pg.strokeWeight(unit);
        pg.strokeCap(ROUND);
        pg.strokeJoin(ROUND);
      }
      for (int i=0; i<paths.size (); i++) {
        paths.get(i).draw(pg);
      }
      if (!boxMode)pg.endShape();
      pg.popMatrix();
    }
  }
}

