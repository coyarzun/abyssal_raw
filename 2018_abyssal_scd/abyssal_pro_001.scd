////////////////////////////////////////////////////////////////////
//ブードゥー教の子:
//4bY554L_PR0:
//2018/03/14
////////////////////////////////////////////////////////////////////
(
SuperDirt.start;
b = NetAddr.new("169.254.95.118",12000);//192.168.1.6",12000);//192.168.1.3", 12000);192.168.10.56
MIDIClient.init;
m=MIDIOut(1);//1);
n=MIDIOut(2);//2);
)
////////////////////////////////////////////////////////////////////
// shore
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 1.0);
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,0);
n.program(1, 19);//roland a 20
)
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goAbyss0", 1.0);
b.sendMsg("/abyssal/doOrtho", 1.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/yTrans", 0.0);
b.sendMsg("/abyssal/rBuffer", 1.0);
)
(
b.sendMsg("/abyssal/doOrtho", 0.0);
b.sendMsg("/abyssal/doBlink", 1.0);
)
b.sendMsg("/abyssal/yTrans", 1.0);
b.sendMsg("/abyssal/doBlink", 1.0);
//

////////////////////////////////////////////////////////////////////
// drown
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 1.0);
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 5);//roland b 06

)
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goAbyss2", 1.0);
b.sendMsg("/abyssal/doLights", 0.0);
b.sendMsg("/abyssal/doSpinX", 0.0);
b.sendMsg("/abyssal/doSpinY", 0.0);
b.sendMsg("/abyssal/doSpinZ", 0.0);
)

b.sendMsg("/abyssal/doSpinX", 1.0);
b.sendMsg("/abyssal/doSpinY", 0.0);
b.sendMsg("/abyssal/doSpinZ", 1.0);


b.sendMsg("/abyssal/doLights", 1.0);
////////////////////////////////////////////////////////////////////
// eyes off
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 1.0);
m.program(2, 40);//korg a61

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 2);//roland b 03

)
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goAbyss1", 1.0);
b.sendMsg("/abyssal/boxMode", 1.0);
b.sendMsg("/abyssal/doLights", 0.0);//<!!
b.sendMsg("/abyssal/wichView", 0.0);//!!
b.sendMsg("/abyssal/doGrid", 0.0);
b.sendMsg("/abyssal/doSpin", 0.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/colorMood", 1.0);
)
b.sendMsg("/abyssal/wichView", 2.0);//!!
b.sendMsg("/abyssal/doLights", 1.0);//!!
b.sendMsg("/abyssal/doGrid", 1.0);//!!
b.sendMsg("/abyssal/doSpin", 1.0);
////////////////////////////////////////////////////////////////////
//lovers
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 1.0);
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 02);//roland b 03

)
////////////////////////////////////////////////////////////////////

(
b.sendMsg("/scene/goAbyss5", 1.0);
b.sendMsg("/abyssal/wichView", 4.0);//!!
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/abyssal/doOrtho", 0.0);
b.sendMsg("/abyssal/doAlpha", 0.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doRumble", 0.0);
)
////////////////////////////////////////////////////////////////////
//junk
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 1.0);
b.sendMsg("/scene/goAbyss3", 1.0);
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 13);//roland b 14

)
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goAbyss4", 1.0);
b.sendMsg("/abyssal/doLights", 0.0);
b.sendMsg("/abyssal/doSpinY", 0.0);
)
(
b.sendMsg("/scene/goAbyss3", 1.0);
)
(
b.sendMsg("/scene/goAbyss7", 1.0);
)

////////////////////////////////////////////////////////////////////
//reboot
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 1.0);
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,0);
n.program(1, 12);//roland a 13

)
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goAbyss6", 1.0);
b.sendMsg("/abyssal/doSpinY", 1.0);
b.sendMsg("/abyssal/doOrtho", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doPolar", 1.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/doRandomPolar", 0.0);
b.sendMsg("/abyssal/doRadiox", 0.0);
)
(
b.sendMsg("/abyssal/doBlink", 1.0);
b.sendMsg("/abyssal/doOrtho", 1.0);
)
////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
// fogata
////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/cop", 1.0);
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 01);//roland b 02

)
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/doZqnce", 1.0);//!!
b.sendMsg("/scene/doTempo", 1.0);//!!
)
////////////////////////////////////////////////////////////////////
//close
////////////////////////////////////////////////////////////////////
b.sendMsg("/process/cop", 1.0);
b.sendMsg("/scene/doZqnce",1.0)
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
b.sendMsg("/process/cop", 1.0);
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goAbyss0", 1.0);
b.sendMsg("/abyssal/doOrtho", 1.0);
b.sendMsg("/abyssal/doOrtho", 1.0);
b.sendMsg("/abyssal/doBlink", 1.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/yTrans", 0.0);
b.sendMsg("/abyssal/rBuffer", 1.0);
////////////////////////////////
b.sendMsg("/scene/goAbyss1", 1.0);
b.sendMsg("/abyssal/boxMode", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);//<!!
b.sendMsg("/abyssal/wichView", 2.0);//!!
b.sendMsg("/abyssal/doGrid", 1.0);
b.sendMsg("/abyssal/doSpin", 1.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/colorMood", 1.0);
////////////////////////////////
b.sendMsg("/scene/goAbyss2", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doSpinY", 1.0);
////////////////////////////////
b.sendMsg("/scene/goAbyss3", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doSpinY", 1.0);
////////////////////////////////
b.sendMsg("/scene/goAbyss4", 1.0);
b.sendMsg("/abyssal/doSpinY", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);
////////////////////////////////
b.sendMsg("/scene/goAbyss5", 1.0);
b.sendMsg("/abyssal/wichView", 2.0);//!!
////////////////////////////////
b.sendMsg("/scene/doZqnce", 0.0);//!!

b.sendMsg("/scene/doTempo", 1.1);//!!
////////////////////////////////
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doSpin", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);//<!!
b.sendMsg("/abyssal/wichView", 0.0);//!!
b.sendMsg("/abyssal/wichView", 1.0);//!!
b.sendMsg("/abyssal/wichView", 2.0);//!!
b.sendMsg("/abyssal/wichView", 3.0);//!!
b.sendMsg("/abyssal/wichView", 4.0);//!!
b.sendMsg("/abyssal/doGrid", 0.0);
b.sendMsg("/abyssal/doSpin", 1.0);
b.sendMsg("/abyssal/doBlink", 1.0);
b.sendMsg("/abyssal/colorMood", 1.0);
////////////////////////////////
b.sendMsg("/scene/goAbyss6", 1.0);
b.sendMsg("/abyssal/doSpinY", 1.0);
b.sendMsg("/abyssal/doOrtho", 1.0);
b.sendMsg("/abyssal/doOrtho", 0.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doPolar", 1.0);
b.sendMsg("/abyssal/doBlink", 1.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/doRandomPolar", 0.0);
b.sendMsg("/abyssal/doRadiox", 0.0);
////////////////////////////////


b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/doZqnce", 0.0);//!!
b.sendMsg("/process/cop", 1.0);
////////////////////////////////
b.sendMsg("/scene/goAbyss1", 1.0);
b.sendMsg("/scene/goAbyss2", 1.0);
b.sendMsg("/scene/goAbyss3", 1.0);
b.sendMsg("/scene/goAbyss4", 1.0);
b.sendMsg("/scene/goAbyss5", 1.0);
b.sendMsg("/scene/goAbyss6", 1.0);
b.sendMsg("/scene/goAbyss7", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);

b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/doh",0.0);
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/process/lg", 0.10);
b.sendMsg("/process/rg", 0.75);
b.sendMsg("/process/hc", 0.0);
b.sendMsg("/process/sc", 0.0);
b.sendMsg("/process/hsa", 0.0);
b.sendMsg("/process/vsa", 0.0);

b.sendMsg("/process/bgm", 1.0);
b.sendMsg("/model/asf", 0.0);
////////////////////////////////
b.sendMsg("/abyssal/doCycle", 0.0);
b.sendMsg("/abyssal/yTrans", 0.0);
b.sendMsg("/abyssal/doOrtho", 0.0);
b.sendMsg("/abyssal/doAlpha", 0.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/rBuffer", 0.0);
b.sendMsg("/abyssal/wlight", 0.0);
b.sendMsg("/abyssal/wichView", 0.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doSpinX", 0.0);
b.sendMsg("/abyssal/doSpinY", 0.0);
b.sendMsg("/abyssal/doSpinZ", 0.0);
b.sendMsg("/abyssal/doPolar", 0.0);
b.sendMsg("/abyssal/doGrid", 0.0);
b.sendMsg("/abyssal/doSpin", 0.0);
b.sendMsg("/abyssal/doScaleUnit", 0.0);
b.sendMsg("/abyssal/colorMood", 0.0);
b.sendMsg("/abyssal/doRandomPolar", 0.0);
b.sendMsg("/abyssal/doRadiox", 0.0);
b.sendMsg("/abyssal/boxMode", 0.0);
b.sendMsg("/abyssal/doFirst", 1.0);
b.sendMsg("/abyssal/doFirst", 1.0);
b.sendMsg("/abyssal/doRumble", 1.0);
////////////////////////////////
