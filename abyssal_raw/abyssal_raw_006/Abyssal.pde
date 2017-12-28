class Abyssal {
  Abyss[] abysses;
  ArrayList abyssHistory;
  int       cAbyss, pAbyss;

  boolean doZqnce;
  long   prevMillis, delayZqnce;
  
  
  Abyssal() {
    init();
  }
  void init() {
    abysses = new Abyss[7];
    
    abysses[0] = new BreakingWaves();
    abysses[1] = new RandomWalk();
    abysses[2] = new DrowningMen();
    abysses[3] = new OrthoPiano();
    abysses[4] = new OrthoPianoLandscape();
    abysses[5] = new OrthoBezier3D();
    abysses[6] = new OrthoSphere();

    abyssHistory = new ArrayList();
    cAbyss = 0;
  }
  void draw(PGraphics pg) {
    pg.camera();
    abysses[cAbyss].draw(pg);
    if(doZqnce)zqnceRoutine();
  }
  void zqnceRoutine(){
    if(millis()-prevMillis>delayZqnce){
      prevMillis = millis();
      cAbyss++;
      cAbyss%=abysses.length;
    }
  }
  
  void doZqnce(float v) {    doZqnce = v!=0; }
  void doTempo(float v) {    delayZqnce = (int)map(v,0,1,6000,10); }
  
  void goAbyss0(float v){    goAbyss(0);  }
  void goAbyss1(float v){    goAbyss(1);  }
  void goAbyss2(float v){    goAbyss(2);  }
  void goAbyss3(float v){    goAbyss(3);  }
  void goAbyss4(float v){    goAbyss(4);  }
  void goAbyss5(float v){    goAbyss(5);  }
  void goAbyss6(float v){    goAbyss(6);  }
  
  void goAbyss(int i) {
    i+=abysses.length;
    i%=abysses.length;
    pAbyss = cAbyss; 
    abyssHistory.add(pAbyss);
    cAbyss = i;
  }
  void nextAbyss() {
    pAbyss = cAbyss; 
    abyssHistory.add(pAbyss);
    cAbyss++;
    cAbyss%=abysses.length;
  }
  void prevAbyss() {
    pAbyss = cAbyss; 
    abyssHistory.add(pAbyss);
    cAbyss--;
    cAbyss+=abysses.length;
    cAbyss%=abysses.length;
  }
  void keyPressed(){
    abysses[cAbyss].keyPressed();
  }
  
  
  void doCycle(float v){  abysses[cAbyss].doCycle= v!=0;  }
  void yTrans(float v) {  abysses[cAbyss].ytrans= v!=0;    }
  void doOrtho(float v){  abysses[cAbyss].doOrtho= v!=0;  }
  void doAlpha(float v){  abysses[cAbyss].doAlpha= v!=0;  }
  void doBlink(float v){  abysses[cAbyss].doBlink= v!=0;  }
  void rBuffer(float v){  abysses[cAbyss].resetBuffer();     }
  void wlight(float v){  abysses[cAbyss].wlight = int (v) ;      abysses[cAbyss].wlight%=3;    }
  void wichView(float v){  abysses[cAbyss].wichView= int (v) ;    abysses[cAbyss].wichView%=5;  }
  void doLights(float v){ abysses[cAbyss].doLights= v!=0;  }
  void doSpinX(float v){  abysses[cAbyss].doSpinX= v!=0;  }
  void doSpinY(float v){  abysses[cAbyss].doSpinY= v!=0;  }
  void doSpinZ(float v){  abysses[cAbyss].doSpinZ= v!=0;  }
  void doPolar(float v){  abysses[cAbyss].doPolar= v!=0;  } 
  void doGrid(float v){  abysses[cAbyss].doGrid= v!=0;    }
  void doSpin(float v){     abysses[cAbyss]. doSpin= v!=0;    }
  void doScaleUnit(float v){      abysses[cAbyss].doScaleUnit= v!=0;    }
  void colorMood(float v){      abysses[cAbyss].colorMood =  int (map(v,0,1.0,0,5)) ;  abysses[cAbyss].colorMood%=3;        }
  void doRandomPolar(float v){  abysses[cAbyss].doRandomPolar= v!=0;} 
  void doRadiox(float v){    abysses[cAbyss].doRadiox= v!=0;}  
  void boxMode(float v){      abysses[cAbyss].boxMode= v!=0;    }
}
