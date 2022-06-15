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
    text("Score: " + score, x+15, (y+40));
    fill(255);
  }
}





//PLEASE WELCOME THE BALL  OoOoOOOOOOH!
public class ball {
  //X coordinate
  float x;
  //Y coordinate
  float y;
  //how fast it moves up/down
  float Ychange;
  //how fast it moves left and right
  float Xchange;
  //the diameter of the ball
  int s;
  //RGB colors (change B1C)
  int Rcolor;
  int Gcolor;
  int Bcolor;
  //whether or not the ball hit the wall. 
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
    int temp = floor(random(.2, 1.9));
    print(temp);
    if (temp == 0) {
      Ychange = random(10, 25);
    } else if (temp == 1) {
      Ychange = random(-10, -25);
    }
    //Generate Y-axis motion
    temp = floor(random(.2, 1.9));
    if (temp == 0) {
      Xchange = random(10, 25);
    } else if (temp == 1) {
      Xchange = random(-10, -25);
    }
    print(temp);
  }
  
  
  
  //Colision with walls and paddles will be stored here. XY is changed by adding X/Ychange variable ALL randoms here just add a bit of randomness to how the ball bounces off that way you have to stay on your toes.
  void move(){
    if (x-s/2 <= 0) { //colision with left side Note S/2 is because XY are pulled from the center and the S is the radius
      Xchange *= -1;
      Ychange *= random(.85, 1.15);
    } else if (x + (s/2) >= 800){ // colision with right side
      Xchange *= -1;
      Ychange *= random(.85, 1.15);
    }
    
    
    //PLAYER 1 PADDLE COLISION P2 will be ctrl+c/v top/bottom
    if ((player.y <= (y+s/2) && (y+s/2) >= player.y) /*<-Y*/ && /*X->*/  (((x-s/2) >= player.x && (x-s/2) <= player.x + 225) /* left side must be greater then left side of rectangle */ || (x+s/2) >= player.x && (x+s/2) <= player.x + player.Xsize)) { //determines collision with top edge of the rectangle
      Ychange *= -1;
      Xchange *= random(.85, 1.15);
    }
    //player 2 colision SHOULD grab the top part
    if ((player2.y <= (y-s/2) && (y-s/2) <= player2.y+player2.Ysize) /*<-Y*/ && /*X->*/  (((x+s/2) >= player2.x && (x-s/2) <= player2.x + player2.Xsize) || (x+s/2) >= player2.x && (x+s/2) <= player2.x + player2.Xsize)) { //determines collision with top edge of the rectangle
      Ychange *= -1;
      Xchange *= random(.85, 1.15);
    }
    //sides of paddles this one is player 1
    if (( player.y >= y && y <= player.y+ player.Ysize /*This determines Y Axis*/ && (player.x == x+s/2 || player.x+225 == x-s/2))/*accomadates both sides with OR statement */ ) {
      Xchange *= -1;
      Ychange *= random(.85, 1.15);
    }
    if (( player2.y >= y && y <=player2.y+player2.Ysize)/*This determines Y Axis*/ && (player2.x == x+s/2 || player2.x+player2.Xsize == x-s/2)/*accomadates both sides with OR statement */ ) {
      Xchange *= -1;
      Ychange *= random(.85, 1.15);
    }
   
    //SCORING! if it hits a wall it becomes "dead" and gives a point
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





public class power {
  /*Power up options
  player speedup: moveUp
  ball speedUp: speedUp
  player slowDown (.5 if M = 1, .25 if m = .5) || (halve speed? m *= .5?) moveDown
  player paddle expand: paddleSize = paddleSize*2. Im thinking if true, set true, add to a buffer number (buf) every frame then halve it once it reaches a certain value
  
  */
  
  int x;
  int y;
  boolean alive = false;
  boolean moveUp = false;
  boolean moveDown = false;
  int type = 1;
  int wait;
  float bX;
  float bY;
  int timer = 0;
  String tellAll = "";
  
  power() {
  };
  
  void generation() {
    if (alive == false) {
      type = ceil(random(1, 3))-1;
      x = int(random(0,750));
      y = int(random(100,650));
      timer++;
      if (timer >= wait){
        alive = true;
        timer = 0;
      }
    }
    
  }
  
  
  void collision() {
    if ((ball.x < x+50 && ball.x > x ) && (ball.y < y+50 && ball.y > y) && alive == true) {
      if (type == 1) {
        tellAll = "Power up: Speedup!";
         m++;
      } else if (type == 2) {
        tellAll = "Power up: Slowdown!";
        m *= .5;
      }
      //After everything, delete the box
      alive = false;
      wait = int(random(1000, 2000));
    }
  }
  void display() {
    //Actually drawing the square
    if (alive == false && timer > 500) {
      player2.Xsize = 225;
      player.Xsize = 225;
      player2.Ysize = 50;
      player.Ysize = 50;
      tellAll = "";
    }
    textAlign(CENTER,CENTER);
    fill(255);
    text(tellAll, 400, 410);
    textAlign(TOP, LEFT);
    
    if (alive == true) {
      if (type == 1) {
        fill(0, 255, 0);
        rect(x, y, 50, 50);
        fill(0, 0, 0);
        square(x+20, y+10, 10);
        square(x+20, y+30, 10);
        square(x+10, y+20, 10);
        square(x+30, y+20, 10);
      } else if (type == 2) {
        fill(255, 0, 0);
        rect(x, y, 50, 50);
        fill(0, 0, 122);
        square(x+20, y+10, 10);
        square(x+20, y+30, 10);
        square(x+10, y+20, 10);
        square(x+30, y+20, 10);
      }
    }   
  }
}
