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
    textSize(40);
    text("Score: " + score, x+15, (y+40));
    fill(255);
  }
}





//PLEASE WELCOME THE BALL  OoOoOOOOOOH!
class ball {
  float x;
  float y;
  float Ychange;
  float Xchange;
  int s;
  int Rcolor;
  int Gcolor;
  int Bcolor;
  boolean dead = false;
  
  ball(int tempX, int tempY, int size,  int[] tempC) {
    x = tempX;
    y = tempY;
    s = size;
    Rcolor = tempC[0];
    Gcolor = tempC[1];
    Bcolor = tempC[2];
  }
  //Start off when spawned
  void kickoff() {
    int temp = int(random(0, 1.9));
    if (temp == 0) {
      Ychange = random(0, 25);
    } else if (temp == 1) {
      Ychange = random(0, -25);
    }
    //Generate Y-axis motion
    temp = int(random(0, 1.9));
    if (temp == 0) {
      Xchange = random(0, 25);
    } else if (temp == 1) {
      Xchange = random(0, -25);
    }
  }
  
  //Colision with walls and paddles will be stored here. XY is changed by adding X/Ychange variable
  void move(){
    if (x-s/2 <= 0) { //colision with left side Note S/2 is because XY are pulled from the center and the S is the radius
      Xchange *= -1;
      Ychange *= 1.05;
    } else if (x + (s/2) >= 800){ // colision with right side
      Xchange *= -1;
      Ychange *= 1.05;
    }
    
    
    //PLAYER 1 PADDLE COLISION P2 will be ctrl+c/v top/bottom
    if ((player.y <= (y+s/2) && (y+s/2) >= player.y) /*<-Y*/ && /*X->*/  (((x-s/2) >= player.x && (x-s/2) <= player.x + 225) /* left side must be greater then left side of rectangle */ || (x+s/2) >= player.x && (x+s/2) <= player.x + 225)) { //determines collision with top edge of the rectangle
      Ychange *= -1;
      Xchange *= 1.1;
    }
    //player 2 colision SHOULD grab the top part
    if ((player2.y <= (y-s/2) && (y-s/2) <= player2.y+50) /*<-Y*/ && /*X->*/  (((x+s/2) >= player2.x && (x-s/2) <= player2.x + 225) || (x+s/2) >= player2.x && (x+s/2) <= player2.x + 225)) { //determines collision with top edge of the rectangle
      Ychange *= -1;
      Xchange *= 1.1;
    }
    //sides of paddles this one is player 1
    if (( player.y >= y && y <=player.y+50)/*This determines Y Axis*/ && (player.x == x+s/2 || player.x+225 == x-s/2)/*accomadates both sides with OR statement */ ) {
      Xchange *= -1;
      Ychange *= 1.1;
    }
    if (( player2.y >= y && y <=player2.y+50)/*This determines Y Axis*/ && (player2.x == x+s/2 || player2.x+225 == x-s/2)/*accomadates both sides with OR statement */ ) {
      Xchange *= -1;
      Ychange *= 1.1;
    }
   
    //SCORING!
    if (y<0) {
      dead = true;
      player.score += 1;
      return;
    } else if (y>800) {
      dead = true;
      player2.score += 1;
      return;
    }
    
    x += Xchange/4;
    y += Ychange/4;
  
  }
  
  void display() {
    fill(Rcolor, Gcolor, Bcolor);
    circle(x, y, s);
    fill(255);
  }
}





class power {
  int x;
  int y;
  boolean alive;
  
  power() {
    
  };
  
  void display() {
    
  }
}
