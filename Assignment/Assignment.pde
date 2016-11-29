import processing.video.*; //importing libraries
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;  // setting up minim to run
AudioPlayer jingle;  //setting the audio tyoe to 'jingle'
FFT fft;  // setting up FFT to run

int r = int(random(1000));  //randomizing color values, to be used in the blocks
int g = int(random(1000));
int b = int(random(1000));

int minusR = int(100);  //randomizing the amounts the color values will decrease by, meaning that the colors will change over time
int minusG = int(100);
int minusB = int(100);

int blockSize = 12;  //the size of the blocks that will appear
int columns, rows;  //setting up integers called columns and rows, but not yet giving them a value

Capture video;  //allow the sketch to capture video

void setup() {
  size(640, 480);
  colorMode(RGB, 255, 255, 255, 100);  //set the color mode to RGB
  rectMode(CENTER);  //set the rectmode to CENTER (the first 2 parameters for the blocks will be where the center of the block is
  frameRate(15);  //set the framerate to 15 fps
  
  minim = new Minim(this);  //creating a new minim
  jingle = minim.loadFile("Take On Me.mp3");  //loads an mp3 file from the data folder
  
  video = new Capture(this, width, height);  //sets the dimensions for the video recording
  video.start();  //starts the video recording
  
  background(0);
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());  //creating a new FFT(this will keep track of the beat in the music
  
  columns = width/blockSize;
  rows = height/blockSize;
   
}

void draw(){
  if (video.available()){
    video.read();  //displays the video onscreen
    video.loadPixels();  //load the pixels of the video to be used elsewhere
    image(video,0,0);
    }
    
    background(255);
    
    fft.forward(jingle.mix);
    
    for(int i = 0; i < columns;i++){  //creates the columns across the screen
      for(int j = 0; j < rows;j++){  //creates the rows down the screen
        
        int x = i*blockSize;  //gets the position that the block is going appear
        int y = j*blockSize;  //gets the position that the block is going appear
        int loc = (video.width - x - 1) + y*video.width;  //I don't know for sure why, but using the code provided for us on Github would cause a mirrored effect here, so I used this code to un-mirror it
        
        color myColor = video.pixels[loc];  //gets the colors of each pixel
        float blockShader = (brightness(myColor)/255) * blockSize;  //gets the brightness value of each pixel, divides it by 255 to bring the value down, and multiplies it by the blockSize. This varies the size of the blocks depending to the brightness of each pixel on the screen
        
        for(int k = 0; k < fft.specSize(); k++){  //this loop sets the color of each block to be randomized by the integers r, g, and b. The values are continuously being lowered by minusR, minusG, and minusB.
          fill(fft.getBand(k)*(r -= minusR), fft.getBand(k)*(g -= minusG), fft.getBand(k)*(b -= minusB));  //the r,g, and b values do not correnspond to RGB values. Instead they are linked to the FFT. The values will be multiplied by the frequency band of the song, so that as the frquency changes, the colors do as well slightly
          
          if(r < 1){                //if r, g, or b reach 0, they will be reset to a value between 0 and 1000.
            r = int(random(1000));
          }
          if(g < 1){
            g = int(random(1000));
          }
          if(b < 1){
            b = int(random(1000));
          }
        }
        
        if ( jingle.isPlaying() )  //if the music is playing
  {
    text("Press any key to pause the music.", 238, 30 );  //text saying "Press any key to pause the music." will appear if the music is playing
  }
  else
  {
    text("Press any key to start the music.", 238, 30 );  //text saying "Press any key to start the music." will appear if the music is not playing
  }
        
        noStroke();
        rect(x+blockSize/2, y+blockSize/2, blockShader, blockShader);  //the blocks will appear at x and y values, minus half the size of the block (this is to accomadate for RectMode(CENTER). The size of the blocks are depending on the brightness.
      }
   }
}

void keyPressed()  //as seen above, when any key is pressed
{
  if ( jingle.isPlaying() )  //while the song is playing
  {
    jingle.pause();  //the music will pause
  }
  else  //but if there is no music playing
  {
    jingle.play();  //it will play the music instead
  }
}