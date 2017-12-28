class Abyssal {
  Abyss[] abysses;
  ArrayList abyssHistory;
  int       cAbyss, pAbyss;

  Abyssal() {
    init();
  }
  void init() {
    abysses = new Abyss[6];
    
    abysses[0] = new BreakingWaves();
    abysses[1] = new RandomWalk();
    abysses[2] = new OrthoSphere();
    abysses[3] = new OrthoPiano();
    abysses[4] = new OrthoPianoLandscape();
    abysses[5] = new OrthoBezier3D();

    abyssHistory = new ArrayList();
    cAbyss = 0;
  }
  void draw(PGraphics pg) {
    pg.camera();
    abysses[cAbyss].draw(pg);
  }
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
}
