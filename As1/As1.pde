float[] circleA = {random(0, 600), random(0, 600), random(10, 50)};
float[] circleB = {random(0, 600), random(0, 600), random(10, 50)};


float[][] twentyCircles = new float[2][20];

void setup() {
  
  twentyCircles[0] = circleA;
  twentyCircles[1] = circleB;
  
  size (600, 600);
  background(123);
  
}

void draw() {
  background(123);
  fill(random(0, 255), random(0, 255), random(0, 255));
  for (int r=0; r < 2; r++) {
    ellipse(twentyCircles[r][0], twentyCircles[r][1], twentyCircles[r][2], twentyCircles[r][2]);
  }
}