//Game for summer class
//Game: Breakout
//Requirements for end product: colision, paddle, disappearing bricks. 

//Writing variables
//Player text colors. Please change! have fun! (RGB)
int[] P1C = {179, 18, 18};
int[] P2C = {16, 13, 214};
int[] BC = {0, 255, 0};

//Defines the items in this
ball ball;
paddle player;
paddle player2;
//Setup


void draw() {
  background(122);
  player.display();
  player2.display();
  ball.move();
  ball.display();
}

void setup() {
  size(800, 800);
  background(0);
  rect(225, 0, 150, 50);
  player = new paddle(0, 225, 700, P1C);
  player2 = new paddle(0, 225, 50, P2C);
  ball = new ball(375,375,50, BC);
  ball.kickoff();
}
//INPUT

void keyPressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  if (keyCode == 39) {
    if (585 > player.x) {
        player.x += 30;
    }
  } else if (keyCode == 37) {
    if (player.x > 0) {
        player.x -= 30;
    }
  } else if (keyCode == 68) {
    if (585 > player2.x) {
      player2.x += 30;
    }
  } else if (keyCode == 65) {
    if (player2.x > 0) {
      player2.x -= 30;
    } 
  } else {
   
  }
  print(keyCode); 
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
    int temp = int(random(0, 1));
    if (temp == 0) {
      Ychange = random(0, 25);
    } else if (temp == 1) {
      Ychange = random(0, -25);
    }
    //Generate Y-axis motion
    temp = int(random(0, 1));
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
    // X is the x coordinate of the ball (center) and player.x is the upper right corner of the bottom paddle. 
    //It should put true in the console when the left side of the circle is between the left and right sides of the bottom paddle
    print();
    
    //PLAYER 1 PADDLE COLISION P2 will be ctrl+c/v
    if (((y-s/2) <= player.y && (y-s/2) >= player.y-50) /*<-Y*/ && /*X->*/  (((x-s/2) >= player.x && (x-s/2) <= player.x + 225) /* left side must be greater then left side of rectangle */ || (x+s/2) >= player.x && (x+s/2) <= player.x + 225)) { //determines collision with top edge of the rectangle
      Ychange *= -1;
      Xchange *= 1.05;
    }
    //player 2 colision SHOULD grab the top part
    if (((y-s/2) <= player2.y && (y+s/2) >= player2.y+50) /*<-Y*/ && /*X->*/  (((x-s/2) >= player2.x && (x-s/2) <= player2.x + 225) || (x+s/2) >= player2.x && (x+s/2) <= player2.x + 225)) { //determines collision with top edge of the rectangle
      Ychange *= -1;
      Xchange *= 1.05;
    }
    
    
    x += Xchange/4;
    y += Ychange/4;
  
  }
  
  void display() {
    fill(Rcolor, Gcolor, Bcolor);
    circle(x, y, s);
    fill(0);
    text(int(x),x-5, y);
    text(int(y),x-5, y+10);
    fill(255);
  }
}
