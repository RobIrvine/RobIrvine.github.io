class myFace { // declares that a class is being created
  
  void paint(){
    paint(mouseX, mouseY); // calls the class to the position of the mouse
  }
  
  void paint(int xPos, int yPos){
    pushMatrix(); // moves the default x and y values
    translate(xPos, yPos);
    
    stroke(0); // sets the stroke color to black
    strokeWeight(5); // sets the thickness of the stroke
    if (mousePressed) {
      fill(0, 174, 239); // if the mouse is pressed, the face turns a cyan color
    }else{
      fill(255, 255, 0); // when the mouse isn't pressed, the face is left it's original yellow color
    }
    ellipse(0, 0, 100, 100);

    strokeWeight(3);
    fill(255);
    arc(-25, -10, 30, 30, radians(180), radians(360)); // creates a semi circle for an eye
    arc(25, -10, 30, 30, radians(180), radians(360)); // creates a semi circle for an eye
    
    fill(0);
    ellipse(-25, -14, 7, 7); // creates a circle for a pupil
    ellipse(25, -14, 7, 7); // creates a circle for a pupil
    
    line(0, -6, -3, 3); // these 2 lines join to form a nose
    line(-3, 3, 3, 5);
    
    fill(88, 11, 28);
    arc(0, 10, 60, 60, radians(0), radians(180)); // creates a semi circle for a mouth
    
    popMatrix(); // reverts the default x and y values back to the way they were
  }
}