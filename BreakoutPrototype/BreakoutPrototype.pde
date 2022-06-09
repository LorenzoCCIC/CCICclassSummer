//Game for summer class
//Game: Breakout
//Requirements for end product: colision, paddle, disappearing bricks. 

//Writing variables

IntList paddle;
ArrayList<Ball> balls;
int ballWidth = 99;
paddle player = new paddle();

//Setup

void draw() {
  background(255);
  //paddle.display();
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      // Items can be deleted with remove()
      balls.remove(i);
    }
    
  }  
}

void setup() {
  balls = new ArrayList<Ball>();
  size(600, 600);
  background(0);
  rect(225, 500, 150, 50);
  paddle = new IntList();
  paddle.append(225);
  paddle.append(500);
  paddle.append(150);
  paddle.append(50);
  print(paddle);
  balls.add(new Ball(width/2, 0, ballWidth));
  
  
}
void keyPressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  if (keyCode == 39) {
    player.x += 15;
    
  } else if (keyCode == 37) {
    
  }
}

//INPUT
class paddle {
  int direction;
  int x = 225;
  int y = 500;  
  
  
  void display() {
    // Display the Rectangle
    fill(255);
    rect(x,y,225,500);
  }
}
