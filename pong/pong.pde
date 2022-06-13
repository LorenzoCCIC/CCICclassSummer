//Game for summer class
//Game: Breakout
//Requirements for end product: colision, paddle, disappearing bricks. 

//Writing variables
//Player text colors. Please change! have fun! (RGB)
int[] P1C = {255, 0, 18};
int[] P2C = {16, 13, 214};
int[] BC = {255, 255, 255};
int winScore;

//Defines the items in this
ball ball;
paddle player;
paddle player2;
//Setup


void draw() {
  
  background(0);
  player.display();
  player2.display();
  ball.move();
  ball.display();
  if (ball.dead == true) {
    delay(2500);
    ball = new ball(350,350,50, BC);
    ball.kickoff();
  }
}

void setup() {
  fill(P2C[0],P2C[1],P2C[2]);
  rect(0,0,800,10);
  size(800, 800);
  background(0);
  rect(225, 0, 150, 50);
  player = new paddle(0, 225, 700, P1C);
  player2 = new paddle(0, 225, 50, P2C);
  ball = new ball(350,350,50, BC);
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
