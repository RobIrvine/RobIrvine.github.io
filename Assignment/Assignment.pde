import processing.video.*;

Capture video;

void setup() {
  size(640, 480);
  frameRate(15);
  video = new Capture(this, width, height);
  video.start();
  
}

void draw(){
  if (video.available()){
    video.read();
    video.loadPixels();
    
    image(video,0,0);
  }
}