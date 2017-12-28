PImage img, cloud;
PVector[] traces;

void setup(){
  size(1024,512);//,P3D);
  img = loadImage("rrbtch_sprite.png");
  cloud = loadImage("rrbtch_sprite.png");//spcloud.png");
  imageMode(CENTER);
  traces = new PVector[40];
  for(int i=0; i<traces.length; i++){
    traces[i] = new PVector(random(width), random(height) , random(-10,-1));
  }

  bubble_srt(traces);
  //traces.sort();
}
void bubble_srt(PVector array[]) {
        int n = array.length;
        int k;
        for (int m = n; m >= 0; m--) {
            for (int i = 0; i < n - 1; i++) {
                k = i + 1;
                if (array[i].z < array[k].z) {
                    swapNumbers(i, k, array);
                }
            }
            //printNumbers(array);
        }
    }
  
void swapNumbers(int i, int j, PVector[] array) {
  
        PVector temp;
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
}
    
void draw(){
  background(0);
  
  
  
  for(int i=0; i<traces.length; i++){
    traces[i].x +=  traces[i].z;
    traces[i].x += width;
    traces[i].x %= width+abs(traces[i].z); //new PVector(random(width), random(height) );
    //blendMode(ADD);
    pushMatrix();
    noStroke();fill(255);
    translate(0,0, map(traces[i].z,-100,-20, 100, -100));
    //rect(traces[i].x, traces[i].y, 100+abs(traces[i].z), 4);
    //tint(255,64);
    translate(traces[i].x, traces[i].y);
    scale(map(traces[i].z,-10,-1, 0.5, 0.1));
    image(cloud, 0,0);//,400,400);
    if(i == traces.length/4) doSprite();
    popMatrix();
  }
  
}

void doSprite(){
  pushMatrix();
  float f = 0.6;//0.3;
  translate(width/2,height/2);
  translate(0,  random(4) );//4*sin(radians(10*frameCount)) );
  image(img,0,0, img.width*f, img.height*f);
  popMatrix();
}
