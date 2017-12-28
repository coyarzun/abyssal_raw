void oscSetup(){
  oscP5 = new OscP5(this, 12000);
  String ip = "192.168.1.8";//"169.254.198.15";//169.254.61.66";//192.168.0.71";//"192.168.0.183";//"170.20.10.3";//
  myRemoteLocation = new NetAddress(ip, 12000);//
  oscP5.plug(environment, "setDo", "/process/do");
  oscP5.plug(environment, "setDoH", "/process/doh");
  oscP5.plug(environment, "setCop", "/process/cop");
  oscP5.plug(environment, "setLG", "/process/lg");
  oscP5.plug(environment, "setRG", "/process/rg");
  oscP5.plug(environment, "setHC", "/process/hc");
  oscP5.plug(environment, "setInter", "/process/sc");//<--corregir
  oscP5.plug(environment, "setHSA", "/process/hsa");
  oscP5.plug(environment, "setVSA", "/process/vsa");

  oscP5.plug(environment, "setBgm", "/process/bgm");
  oscP5.plug(environment, "setASF", "/model/asf");
  
  
  oscP5.plug(abyssal, "goAbyss0", "/scene/goAbyss0");
  oscP5.plug(abyssal, "goAbyss1", "/scene/goAbyss1");
  oscP5.plug(abyssal, "goAbyss2", "/scene/goAbyss2");
  oscP5.plug(abyssal, "goAbyss3", "/scene/goAbyss3");
  oscP5.plug(abyssal, "goAbyss4", "/scene/goAbyss4");
  oscP5.plug(abyssal, "goAbyss5", "/scene/goAbyss5");
  oscP5.plug(abyssal, "goAbyss6", "/scene/goAbyss6");
  
  
  oscP5.plug(abyssal, "doCycle", "/abyssal/doCycle");
  oscP5.plug(abyssal, "yTrans", "/abyssal/yTrans");
  oscP5.plug(abyssal, "doOrtho", "/abyssal/doOrtho");
  oscP5.plug(abyssal, "doAlpha", "/abyssal/doAlpha");
  oscP5.plug(abyssal, "doBlink", "/abyssal/doBlink");
  oscP5.plug(abyssal, "rBuffer", "/abyssal/rBuffer");
  oscP5.plug(abyssal, "wlight", "/abyssal/wlight");
  oscP5.plug(abyssal, "wichView", "/abyssal/wichView");
  oscP5.plug(abyssal, "doLights", "/abyssal/doLights");
  oscP5.plug(abyssal, "doSpinX", "/abyssal/doSpinX");
  oscP5.plug(abyssal, "doSpinY", "/abyssal/doSpinY");
  oscP5.plug(abyssal, "doSpinZ", "/abyssal/doSpinZ");
  oscP5.plug(abyssal, "doPolar", "/abyssal/doPolar");
  oscP5.plug(abyssal, "doGrid", "/abyssal/doGrid");
  oscP5.plug(abyssal, "doSpin", "/abyssal/doSpin");
  oscP5.plug(abyssal, "doScaleUnit", "/abyssal/doScaleUnit");
  oscP5.plug(abyssal, "colorMood", "/abyssal/colorMood");
  oscP5.plug(abyssal, "doRandomPolar", "/abyssal/doRandomPolar");
  oscP5.plug(abyssal, "doRadiox", "/abyssal/doRadiox");
  oscP5.plug(abyssal, "boxMode", "/abyssal/boxMode");
  
}
void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required.
   */
  if (theOscMessage.isPlugged()==false) {
    /* print the address pattern and the typetag of the received OscMessage */
    println("### received an osc message.");
    println("### addrpattern\t"+theOscMessage.addrPattern());
    println("### typetag\t"+theOscMessage.typetag());
  }
}
