
class bod {
  int x;
  int y;
  String dir;
  public bod (int newX, int newY, String dir1){
    x = newX;
    y = newY;
    dir = dir1;
  }
  
  public void display() {
    /*
    for(int i = 0; i <= snake.size()-1; i++) {
        bod segment = snake.get(i);
        for(int b = 0; b <= snake.size()-1; b++) {
          bod segment2 = snake.get(b);
          if (segment.x == segment2.x && segment2.y == foodY) {
            death = true;
          }
        }
        
        
      }*/
    fill(#000000);
    square(x*s, y*s, s);
    fill(#D30000);
    triangle((x*s)+s/2, (y*s)+s/2, (x*s), (y*s)+s, (x*s)+s, (y*s)+s);
    triangle((x*s)+s/2, (y*s)+s/2, (x*s), (y*s), (x*s)+s, (y*s));
    /*
    if (dir == "up") {
      triangle((x*s)+s/2, (y*s), (x*s), (y*s)+s, (x*s)+s, (y*s)+s);
    } else if (dir == "down") {
      triangle((x*s), (y*s), (x*s)+s, (y*s), (x*s)+s/2, (y*s)+s);
    } else if (dir == "right") {
      triangle((x*s), (y*s), (x*s), (y*s)+s, (x*s)+s, (y*s)+s/2);
    } else if (dir == "left") {
      triangle((x*s)+s, (y*s), (x*s)+s, (y*s)+s, (x*s), (y*s)+s/2);
    } else if (dir == "null") {
      
    }*/
    
  }
}
