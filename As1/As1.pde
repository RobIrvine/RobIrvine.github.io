myFace myFace1; // loads the myFace class into the As1 file
float[][] myCircles = new float[20][6]; // creates a 2D array called myCircles that has 20 rows and 6 columns
float speed = 10;

void setup() {
  
  size(600, 600);
  background(255);
  smooth(); // smooths any shapes loaded on in the sketch (anti-aliasing)
  
  myFace1 = new myFace(); // creates a new variant of the myFace class called myFace1
  
  for(int i=0; i < 20; i++) { // the for loop that repeats the information contained in the 2D array onto the stage
  
  int xPos = int(random(600)); // generates a random number between 0 and 600
  int yPos = int(random(600));
  int cSize = int(random(10, 50)); // generates a random between 10 and 50
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  
  myCircles[i][0] = xPos; // sets the information to be placed into the columns of the 2D array myCircles
  myCircles[i][1] = yPos;
  myCircles[i][2] = cSize;
  myCircles[i][3] = r;
  myCircles[i][4] = g;
  myCircles[i][5] = b;

}
}

void draw() {
  background(255);
  myFace1.paint(); // places the myFace variant (myFace1) onto the stage
    for (int r=0; r < 20; r++) { // the for loop that runs the data in the array and places it onto the stage
    fill(myCircles[r][3], myCircles[r][4], myCircles[r][5]); // calls the data from the array to color the 20 circles
    ellipse(myCircles[r][0], myCircles[r][1], myCircles[r][2], myCircles[r][2]); // calls the data from the array to give the circles their positioning and sizes
    if(myCircles[r][0] > width + myCircles[r][2]) {
      myCircles[r][0] = -myCircles[r][2];
    }else if (myCircles[r][0] < -myCircles[r][2]) {
      myCircles[r][0] = width + myCircles[r][2];
    }
     if(myCircles[r][1] > height + myCircles[r][2]) {
      myCircles[r][1] = -myCircles[r][2];
    }else if (myCircles[r][1] < -myCircles[r][2]) {
      myCircles[r][1] = height + myCircles[r][2];
    }
    
  }
}

void keyPressed() {  // the code that moves the circles, if UP is pressed, the circles move up
  if (key == CODED) {
    if (keyCode == UP) {
      for (int r=0; r < 20; r++) {
        myCircles[r][1] -= speed;
      }
    } else if (keyCode == DOWN) {  // if DOWN is pressed, the circles move down
      for (int r=0; r < 20; r++) {
        myCircles[r][1] += speed;
      }
    } else if (keyCode == RIGHT) {  // if RIGHT is pressed, the circles move to the right
      for (int r=0; r < 20; r++) {
        myCircles[r][0] += speed;
    }
      } else if (keyCode == LEFT) {  // if LEFT is pressed, the circles move to the left
        for (int r=0; r < 20; r++) {
          myCircles[r][0] -= speed;
      }
    }
  }
}