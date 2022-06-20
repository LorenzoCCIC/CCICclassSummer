//Game for summer class
//Game: Breakout
//Requirements for end product: colision, paddle, scoring. 
/*Power up info:
black cross: player speed down/up DONE
blue box: paddle size change DONE

*/


//Writing variables
//Player text colors. Please change! have fun! (RGB)
int[] P1C = {255, 0, 18};
int[] P2C = {255, 13, 214};
int[] BC = {255, 225, 255};
int[] EBC = {122, 122, 122};
int winScore = 5;

float m = 1; //Multiplier on speed.
int sizeX = 800;
int sizeY = 800;
boolean rArrow;
boolean lArrow;
boolean aKey;
boolean dKey;
//Defines the items in this

ball ball;
ball extraBall1;
ball extraBall2;
paddle player;
paddle player2;
power power;
//Setup


void draw() {
  background(0);
  power.generation();
  int boxL = 50;
  
  //do we need a new ball
  if (ball.dead == true) {
      delay(3000);
      m = 1;
      ball = new ball(400,400,50, BC);
      ball.kickoff();
   } if (extraBall1.dead == true) {
      extraBall1 = new ball(-100, -100, 1, EBC);
   } if (extraBall2.dead == true) {
      extraBall2 = new ball(-100, -100, 1, EBC);
   }
   
   //create the goals.
   for (int i = 0; i<=sizeX/(boxL); i++) {
     if (i % 2== 0){
       fill(255);
       rect(boxL*(i), 390, boxL, 10);
     } else {
       fill(0);
       rect(boxL*(i), 390, boxL, 10);
     }
   }
   //has someone won?
   if (player.score == winScore) {
     fill(P1C[0], P1C[1], P1C[2]);
     text("Player 1 WINS!!!!!",300, 300);
     ball.dead = true;
   } else if (player2.score == winScore) {
     fill(P2C[0], P2C[1], P2C[2]);
     text("Player 2 WINS!!!!!", 300, 500);
     ball.dead = true;
  }
  //is it in bounds? and move
  if (800 > player.x+player.Xsize && rArrow == true) {  
    player.x += 15*m;
  } if (lArrow == true && player.x > 0) {
    player.x -= 15*m;
  } if (800 > player2.x+player2.Xsize && dKey == true) {
    player2.x += 15*m;
  } if (0 < player2.x && aKey == true) {
    player2.x -= 15*m;
  }
  
  //just the rest of the functions
  fill(P2C[0],P2C[1],P2C[2]);
  rect(0,0,800,10);
  fill(P1C[0], P1C[1], P1C[2]);
  rect(0, 790, 800, 10);
  power.collision();
  power.display();
  player.display();
  player2.display();
  ball.move();
  ball.display();
  
}

void setup() {
  size(800, 800);
  background(0);
  background(0);
  rect(225, 0, 150, 50);
  power = new power();
  player = new paddle(0, 225, 700, P1C);
  player2 = new paddle(0, 225, 50, P2C);
  ball = new ball(350,350,50, BC);
  extraBall1 = new ball(-100,-100,50, EBC);
  extraBall2 = new ball(-100,-100,50, EBC);
  ball.kickoff();
  power.generation();
}

//INPUT


void keyPressed() {
  // A new ball object is added to the ArrayList (by default to the end)\
  
  if (keyCode == 39) {
    rArrow = true;
  } if (keyCode == 37) {
    lArrow = true;
  } if (keyCode == 68) {
    dKey = true;
  } if (keyCode == 65) {
    aKey = true;
  } else {
   
  }
  print(keyCode); 
}

//checks which key is released. 
void keyReleased() {
  if (keyCode == 39) {
      rArrow = false;
  } if (keyCode == 37) {
      lArrow = false;
  } if (keyCode == 68) {
      dKey = false;
  } if (keyCode == 65) {
      aKey = false;
  } else {return;}
  print(keyCode); 
}
