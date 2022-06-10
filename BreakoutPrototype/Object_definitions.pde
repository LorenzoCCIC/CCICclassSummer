//player controlled paddle. 

class paddle {
  //declares local coordinates (directions are useless)
  int score;
  int x;
  int y;  
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
    rect(x,y,225,50);
    fill(Rcolor, Gcolor, Bcolor);
    text("PLAYER X: " + x + " Y: " + y + " Score: " + score, x+15, y+15);
    fill(255);
  }
}
