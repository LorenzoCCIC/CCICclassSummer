public class power {
  /*Power up options
  player speedup: moveUp DONE
  ball speedUp: speedUp 
  player slowDown (.5 if M = 1, .25 if m = .5) || (halve speed? m *= .5?) moveDown         DONE 
  player paddle expand: paddleSize = paddleSize*2. Im thinking if true, set true, add to a buffer number (buf) every frame then halve it once it reaches a certain value    DONE
  
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
      type = ceil(random(1, 6))-1;
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
    if ((((ball.x < x+50 && ball.x > x ) && (ball.y < y+50 && ball.y > y)) || ((ball.x-25 < x+50 && ball.x+25 > x ) && (ball.y-25 < y+50 && ball.y+25 > y))) && alive == true) {
      if (type == 1) {
        tellAll = "Power up: Speedup!";
         m++;
      } else if (type == 2) {
        tellAll = "Power up: Slowdown!";
        m *= .5;
      } else if (type == 3) {
        tellAll = "Power up: Big paddle!";
        player2.Xsize *= 1.5;
        player.Xsize *= 1.5;
        player2.Ysize *= 1.5;
        player.Ysize *= 1.5;
      } else if (type == 4) {
        tellAll = "Power up: Small paddle!";
        player2.Xsize *= .75;
        player.Xsize *= .75;
        player2.Ysize *= .75;
        player.Ysize *= .75;
      } else if (type == 5) {
        tellAll = "Power up: Extra balls!";
        
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
    
    //draws my cubes. this pattern creates one big cube and a bunch of smaller ones in  a cross
    
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
        fill(0, 0, 0);
        square(x+20, y+10, 10);
        square(x+20, y+30, 10);
        square(x+10, y+20, 10);
        square(x+30, y+20, 10);
      } else if (type == 3) {
        fill(0, 0, 255);
        rect(x, y, 50, 50);
        fill(0, 255, 0);
        square(x+20, y+10, 10);
        square(x+20, y+30, 10);
        square(x+10, y+20, 10);
        square(x+30, y+20, 10);
      } else if (type == 4) {
        fill(0, 0, 255);
        rect(x, y, 50, 50);
        fill(255, 0, 0);
        square(x+20, y+10, 10);
        square(x+20, y+30, 10);
        square(x+10, y+20, 10);
        square(x+30, y+20, 10);
      } else if (type == 5) {
        fill(0, 255, 0);
        rect(x, y, 50, 50);
        fill(0, 0, 0);
        square(x+20, y+10, 10);
        square(x+20, y+30, 10);
        square(x+10, y+20, 10);
        square(x+30, y+20, 10);
      }
      
    }   
  }
}  
