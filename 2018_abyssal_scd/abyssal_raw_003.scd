//ブードゥー教の子:
//4bY554L_R4W:
//2018/02/03
(
SuperDirt.start;
b = NetAddr.new("192.168.1.5", 12000);
MIDIClient.init;
m=MIDIOut(1);//1);
n=MIDIOut(2);//2);
)
//setup shore
(
b.sendMsg("/process/cop", 1.0);
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,0);
n.program(1, 19);//roland a 20
)
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
b.sendMsg("/abyssal/doBlink", 0.0);
)
b.sendMsg("/abyssal/yTrans", 1.0);
b.sendMsg("/abyssal/doBlink", 1.0);
//setup drown
(
b.sendMsg("/process/cop", 1.0);

m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 5);//roland b 06

)
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goAbyss2", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doSpinY", 1.0);
)

//setup eyes off
(
b.sendMsg("/process/cop", 1.0);
m.program(2, 40);//korg a61

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 2);//roland b 03

)
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

//lovers
(
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 02);//roland b 03

)
(
b.sendMsg("/scene/goAbyss7", 1.0);
)
(
b.sendMsg("/abyssal/doOrtho", 0.0);
b.sendMsg("/abyssal/doAlpha", 0.0);
b.sendMsg("/abyssal/doBlink", 0.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doRumble", 1.0);

)
//junk
(
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 13);//roland b 14

)
(
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goAbyss3", 1.0);
b.sendMsg("/abyssal/doLights", 1.0);
b.sendMsg("/abyssal/doSpinY", 1.0);
)
)
//reboot
(
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,0);
n.program(1, 12);//roland a 13

)

// fogata
(
m.program(2, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 01);//roland b 02

)
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

b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/doh", 1.0);
b.sendMsg("/process/cop", 0.8);
b.sendMsg("/process/lg", 0.10);
b.sendMsg("/process/rg", 0.75);
b.sendMsg("/process/hc", 0.0);
b.sendMsg("/process/sc", 0.0);
b.sendMsg("/process/hsa", 1.0);
b.sendMsg("/process/vsa", 1.0);

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
