//Game for summer class
//Game: Breakout
//Requirements for end product: colision, paddle, disappearing bricks. 

//Writing variables
//Player text colors. Please change! have fun! (RGB)
int[] P1C = {255, 0, 18};
int[] P2C = {16, 13, 214};
int[] BC = {255, 255, 255};
int winScore = 5;
int m = 1; //Multiplier on speed.
int sizeX = 800;
int sizeY = 800;
boolean rArrow;
boolean lArrow;
boolean aKey;
boolean dKey;
//Defines the items in this
ball ball;
paddle player;
paddle player2;
power power;
//Setup


void draw() {
  background(0);
  int boxL = 50;
  if (ball.dead == true) {
      delay(2500);
      ball = new ball(400,400,50, BC);
      ball.kickoff();
   }
   for (int i = 0; i<=sizeX/(boxL); i++) {
     if (i % 2== 0){
       fill(255);
       rect(boxL*(i), 390, boxL, 10);
     } else {
       fill(0);
       rect(boxL*(i), 390, boxL, 10);
     }
   }
   if (player.score == winScore) {
     fill(P1C[0], P1C[1], P1C[2]);
     text("Player 1 WINS!!!!!",300, 300);
     ball.dead = true;
   } else if (player2.score == winScore) {
     fill(P2C[0], P2C[1], P2C[2]);
     text("Player 2 WINS!!!!!", 300, 500);
     ball.dead = true;
  }
  if (585 > player.x && rArrow == true) {  
    player.x += 30*m;
  } if (lArrow == true && player.x > 0) {
    player.x -= 30*m;
  } if (585 > player2.x && dKey == true) {
    player2.x += 30*m;
  } if (0 < player2.x && aKey == true) {
    player2.x -= 30*m;
  }
  
  fill(P2C[0],P2C[1],P2C[2]);
  rect(0,0,800,10);
  fill(P1C[0], P1C[1], P1C[2]);
  rect(0, 790, 800, 10);
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
  player = new paddle(0, 225, 700, P1C);
  player2 = new paddle(0, 225, 50, P2C);
  ball = new ball(350,350,50, BC);
  ball.kickoff();
}

//INPUT


void keyPressed() {
  // A new ball object is added to the ArrayList (by default to the end)\
  
  if (keyCode == 39) {
    if (585 > player.x) {
        rArrow = true;
    }
  } else if (keyCode == 37) {
    if (player.x > 0) {
      lArrow = true;
    }
  } else if (keyCode == 68) {
    if (585 > player2.x) {
      dKey = true;
    }
  } else if (keyCode == 65) {
    if (player2.x > 0) {
      aKey = true;
    } 
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
