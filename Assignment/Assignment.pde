import processing.video.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

int r = int(random(1000));
int g = int(random(1000));
int b = int(random(1000));

int minusR = int(100);
int minusG = int(100);
int minusB = int(100);

int blockSize = 12;
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
    
    background(255);
    
    fft.forward(jingle.mix);
    
    for(int i = 0; i < columns;i++){
      for(int j = 0; j < rows;j++){
        
        int x = i*blockSize;
        int y = j*blockSize;
        int loc = x + y*video.width;
        
        color myColor = video.pixels[loc];
        float blockShader = (brightness(myColor)/255) * blockSize;
        
        for(int k = 0; k < fft.specSize(); k++){
          fill(fft.getBand(k)*(r -= minusR), fft.getBand(k)*(g -= minusG), fft.getBand(k)*(b -= minusB));
          
          if(r < 1){
            r = int(random(1000));
          }
          if(g < 1){
            g = int(random(1000));
          }
          if(b < 1){
            b = int(random(1000));
          }
        }
        
        noStroke();
        rect(x+blockSize/2, y+blockSize/2, blockShader, blockShader);
      }
   }
}