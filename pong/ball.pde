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
      Ychange *= random(.95, 1.15);
    } else if (x + (s/2) >= 800){ // colision with right side
      Xchange *= -1;
      Ychange *= random(.95, 1.15);
    }
    
    
    //PLAYER 1 PADDLE COLISION P2 will be ctrl+c/v top/bottom
    if ((player.y <= (y+s/2) && (y+s/2) >= player.y) /*<-Y*/ && /*X->*/  (((x-s/2) >= player.x && (x-s/2) <= player.x + 225) /* left side must be greater then left side of rectangle */ || (x+s/2) >= player.x && (x+s/2) <= player.x + player.Xsize)) { //determines collision with top edge of the rectangle
      Ychange *= -1;
      Xchange *= random(.95, 1.15);
    }
    //player 2 colision SHOULD grab the top part
    if ((player2.y <= (y-s/2) && (y-s/2) <= player2.y+player2.Ysize) /*<-Y*/ && /*X->*/  (((x+s/2) >= player2.x && (x-s/2) <= player2.x + player2.Xsize) || (x+s/2) >= player2.x && (x+s/2) <= player2.x + player2.Xsize)) { //determines collision with top edge of the rectangle
      Ychange *= -1;
      Xchange *= random(.95, 1.15);
    }
    //sides of paddles this one is player 1
    if (( player.y >= y && y <= player.y+ player.Ysize /*This determines Y Axis*/ && (player.x == x+s/2 || player.x+225 == x-s/2))/*accomadates both sides with OR statement */ ) {
      Xchange *= -1;
      Ychange *= random(.95, 1.15);
    }
    if (( player2.y >= y && y <=player2.y+player2.Ysize)/*This determines Y Axis*/ && (player2.x == x+s/2 || player2.x+player2.Xsize == x-s/2)/*accomadates both sides with OR statement */ ) {
      Xchange *= -1;
      Ychange *= random(.95, 1.15);
    }//Ball and ball colision
    if ((x == x) || (y == y)){
      
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
