//player controlled paddle. 

public class paddle {
  //declares local coordinates (directions are useless)
  int score;
  int x;
  int y;   
  
  int Xsize = 225; 
  int Ysize = 50;
  
  int Rcolor;
  int Gcolor;
  int Bcolor;
  
  paddle(int tempS, int tempX, int tempY, int[] tempC) {
    score = tempS;
    x = tempX;
    y = tempY;
    Rcolor = tempC[0];
    Gcolor = tempC[1];
    Bcolor = tempC[2];
  }
  
  void display() {
    // Display the Rectangle
    
    fill(255);
    rect(x, y, Xsize, Ysize);
    fill(Rcolor, Gcolor, Bcolor);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Score: " + score, x+Xsize/2, y+Ysize/2);
    textAlign(TOP, LEFT);
    fill(255);
  }
}
