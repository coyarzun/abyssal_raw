class Piano{
  float   unit = 8;
  int   ckeys, whites, blacks, octaves, mods;
  float   boxw, boxh, boxd;
  
  PianoKey[] keys;
  
  Piano(){
    ckeys = 88;
    octaves = ckeys/12;
    mods    = ckeys%12;
    setup();
  }
  Piano(int k){
    ckeys = k;
    octaves = ckeys/12;
    mods    = ckeys%12;
    setup();
  }
  Piano(int o, int xk){
    octaves = o;//ckeys/12;
    mods    = xk;
    ckeys = o*12+xk;
    setup();
  }
    
   
  void setup(){
    whites = 0;
    blacks = 0;
    
    keys = new PianoKey[ckeys];
    
    boxw= 2*unit;
    
    for(int i=0; i<ckeys; i++){
      int aux = i%12;
      if(aux==0 || aux==2 || aux==4 || aux==5 || aux==7 || aux==9 || aux==11 ){
        whites++;
        keys[i] = new PianoKey(i,false);
        boxw+=unit;
      }else{
        blacks++;
        keys[i] = new PianoKey(i,true);
      }
    }
    println(ckeys+" keys, "+octaves+" octaves+"+mods+". "+whites+" whites / "+blacks+" blacks");
    boxh = (random(1.5,2))*unit;
    boxd = (random(5,20))*unit;
  }
  void draw(PGraphics pg, boolean doLights){
    if(doLights)pg.noStroke();
    else {pg.strokeWeight(1);pg.stroke(0);pg.fill(255);}
    pg.pushMatrix();
    drawKeyboard(pg);
    drawBody(pg);
    pg.popMatrix();
  }
  void drawBody(PGraphics pg){
    pg.fill(255);
    pg.pushMatrix();
    pg.translate(0,unit,-boxd/2);
    pg.translate(0,0,4.5*unit);
    pg.box(boxw,unit,boxd);
    pg.popMatrix();
    pg.pushMatrix();
    pg.translate(0,-boxh/2+unit/2,-(+boxd-4.5*unit)/2);
    pg.box(boxw,boxh,boxd-4.5*unit);
    pg.translate(0,-unit/2,0);
    pg.rotateX(radians(-15));
    pg.box(boxw-unit,boxh,boxd-4.5*unit-unit);
    pg.popMatrix();
    
    pg.pushMatrix();
    pg.translate(-boxw/2+unit/2,unit/4,4.5*unit/2);
    pg.rotateX(radians(-15));
    pg.box(1.1*unit,2*unit,4.5*unit);
    pg.popMatrix();
    
    pg.pushMatrix();
    pg.translate(boxw/2-unit/2,unit/4,4.5*unit/2);
    pg.rotateX(radians(-15));
    pg.box(1.1*unit,2*unit,4.5*unit);
    pg.popMatrix();
  }
  void drawKeyboard(PGraphics pg){
    pg.pushMatrix();
    pg.translate(-whites*unit/2,0);
    pg.translate(unit/2,0);
    for(int i=0; i<keys.length; i++){
      keys[i].draw(pg);
      if(i<keys.length-1)pg.translate((keys[i].isBlack? unit/2:keys[i+1].isBlack?unit/2:unit),0);
    }
    pg.popMatrix();
  }
}





class PianoKey{
  float   unit = 8;
  int     index;
  boolean isBlack;
  
  PianoKey(int i, boolean b){
    index = i;
    isBlack = b;
  }
  void draw(PGraphics pg){
    pg.pushMatrix();
    if(!isBlack){
      pg.fill(255);
      pg.translate(0,0,unit*2);
      pg.box(unit*.9,unit*.8,unit*4);
    }else{
      pg.fill(0);
      pg.translate(0,-unit*.6/2,unit*.6*2);
      pg.box(unit*.6,unit*.6,unit*.6*4);
    }
    pg.popMatrix();
  }
}
