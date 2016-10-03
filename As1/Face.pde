class myFace {
  
  void paint(){
    paint(mouseX, mouseY);
  }
  
  void paint(int xPos, int yPos){
    pushMatrix();
    translate(xPos, yPos);
    
    stroke(0);
    strokeWeight(5);
    fill(255, 255, 0);
    ellipse(0, 0, 100, 100);

    strokeWeight(3);
    fill(255);
    arc(-25, -10, 30, 30, radians(180), radians(360));
    arc(25, -10, 30, 30, radians(180), radians(360));
    
    fill(0);
    ellipse(-25, -14, 7, 7);
    ellipse(25, -14, 7, 7);
    
    fill(88, 11, 28);
    arc(0, 10, 60, 60, radians(0), radians(180));
    
    popMatrix();
  }
}