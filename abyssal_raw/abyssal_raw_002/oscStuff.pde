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

  oscP5.plug(environment, "setCols", "/model/cols");
  oscP5.plug(environment, "setRoWs", "/model/rows");
  oscP5.plug(environment, "setR1", "/model/r1");
  oscP5.plug(environment, "setR2", "/model/r2");

  oscP5.plug(environment, "setSCL", "/model/scale");
  oscP5.plug(environment, "setRXS", "/model/rxs");
  oscP5.plug(environment, "setRXSM", "/model/rxsm");
  oscP5.plug(environment, "setRYSM", "/model/rysm");
  oscP5.plug(environment, "setASF", "/model/asf");
  
  
  oscP5.plug(abyssal, "goAbyss0", "/scene/goAbyss0");
  oscP5.plug(abyssal, "goAbyss1", "/scene/goAbyss1");
  oscP5.plug(abyssal, "goAbyss2", "/scene/goAbyss2");
  oscP5.plug(abyssal, "goAbyss3", "/scene/goAbyss3");
  oscP5.plug(abyssal, "goAbyss4", "/scene/goAbyss4");
  oscP5.plug(abyssal, "goAbyss5", "/scene/goAbyss5");
  oscP5.plug(abyssal, "goAbyss6", "/scene/goAbyss6");
  
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
