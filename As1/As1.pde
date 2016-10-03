float[][] myCircles = new float[20][3]; 

void setup() {
  
  size(600, 600);
  background(123);
  
  for(int i=0; i < 20; i++) {
  
  int xPos = int(random(600));
  int yPos = int(random(600));
  int cSize = int(random(10, 50));
  
  myCircles[i][0] = xPos;
  myCircles[i][1] = yPos;
  myCircles[i][2] = cSize;

}
}

void draw() {
  background(123);
    for (int r=0; r < 20; r++) {
    ellipse(myCircles[r][0], myCircles[r][1], myCircles[r][2], myCircles[r][2]);
  }
}