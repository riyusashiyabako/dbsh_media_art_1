import fullscreen.*; 
import processing.video.*;

FullScreen fs;
Capture video;

//描画色を切り換えるための変数
int r = 255;
int g = 0;
int b = 0;

void setup() {
  size(640, 480);
  background(0);
  
  video = new Capture(this, width, height, 60);
  fs = new FullScreen(this); 
  fs.enter();
}

void draw() {
  loadPixels();
  for(int i=0; i < width * height; i++) {
    if(brightness(video.pixels[i]) >= 200) {
      pixels[i]=color(r, g, b);
    }
  }
  updatePixels();
}

void captureEvent(Capture video) {
  video.read();
}

void keyPressed(){
  //int num=0;
  
  switch (key) {
    /*
    case 's' :
      String s="image_" + num + ".jpg";
      save(s);
      num++;
      break;
    */
    
    case ' ' :
      background(0);
      break;
    
    //描画色を赤に  
    case 'r' :
      r = 255;
      g = 0;
      b = 0;
      break;
    
    //描画色を緑に   
    case 'g' :
      r = 0;
      g = 255;
      b = 0;
      break;
    
    //描画色を青に   
    case 'b' :
      r = 0;
      g = 0;
      b = 255;
      break;
    
    //描画色を黄に   
    case 'y' :
      r = 255;
      g = 255;
      b = 0;
      break;
    
    //描画色を紫に   
    case 'p' :
      r = 255;
      g = 0;
      b = 255;
      break;
  }
}
