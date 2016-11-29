import processing.video.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

int blockSize = 15;
int columns, rows;

Capture video;

void setup() {
  size(640, 480);
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);
  frameRate(15);
  
  minim = new Minim(this);
  jingle = minim.loadFile("song.mp3");
  jingle.loop();
  
  video = new Capture(this, width, height);
  video.start();
  
  background(0);
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  
  columns = width/blockSize;
  rows = height/blockSize;
   
}

void draw(){
  if (video.available()){
    video.read();
    video.loadPixels();
    image(video,0,0);
    }
    
    
    background(50, 200, 255);
    
    for(int i = 0; i < columns;i++){
      for(int j = 0; j < rows;j++){
        
        int x = i*blockSize;
        int y = j*blockSize;
        int loc = x + y*video.width;
        
        color myColor = video.pixels[loc];
        float blockShader = (brightness(myColor)/255) * blockSize;
        
        fill(255);
        noStroke();
        rect(x+blockSize/2, y+blockSize/2, blockShader, blockShader);
      }
   }
}