import processing.video.*;

int blockSize = 15;
int columns, rows;

Capture video;

void setup() {
  size(640, 480);
  frameRate(15);
  video = new Capture(this, width, height);
  video.start();
  
  columns = width/blockSize;
  rows = height/blockSize;
   
}

void draw(){
  if (video.available()){
    video.read();
    video.loadPixels();
    image(video,0,0);
    
    background(255);
    
    for(int i = 0; i < columns;i++){
      for(int j = 0; j < rows;j++){
        
        int x = i*blockSize;
        int y = j*blockSize;
        int loc = x + y*video.width;
        
        color c myColor = video.pixels[loc];
        float blockShader = (brightness(myColor)/255) * blockSize;
      }
    }
  }
}