int s = 30;
int eyeL = 4;
int eyeLY =4;
int rad = 200;        // Width of the shape
float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;
void setup() {
  background(0);
  size(800, 800);
  eyeL = 6;
  eyeLY = 6;
}

void draw() {
  background(122);
  frameRate(30);
  stroke(255);
  //grid();
  //stroke(255,0,0);
  //line(400, 0, 400, 800);
  //stroke(255);
  complete();
    delay(1000);
    s += 10;
    
    eyeL = (800/s)/2;
    eyeLY = (800/s)/3;
    complete();
  
  
  
}

void grid() {
  for (int i=0; i <= 18; i++) {
    line(s*i, 0, s*i, 800);
  }
  for (int i=0; i <= 18; i++) {
    line(0, s*i, 800, s*i);
  }
}

void complete() {
  ears(eyeL, eyeLY-3);
  head(eyeL, eyeLY-3);
  nose(eyeL, eyeLY-1);
  eye(eyeL-3, eyeLY);
  eye(eyeL+3, eyeLY);
  
  
}

void ears(float x, float y){
  fill(#f27b97);
  stroke(#f27b97);
  triangle((x-3)*s, y*s, (x-6)*s, (y-1)*s, (x-4)*s,  (y+3)*s);
  triangle((x+3)*s, y*s, (x+6)*s, (y-1)*s, (x+4)*s,  (y+3)*s);
  fill(#ef477c);
  stroke(#ef477c);
  triangle((x+5)*s, (y+2.5)*s, (x+6)*s, (y-1)*s, (x+4)*s,  (y+3)*s);
  triangle((x-5)*s, (y+2.5)*s, (x-6)*s, (y-1)*s, (x-4)*s,  (y+3)*s);
}
void head(float x, float y) {
  fill(#f8afbc);
  stroke(#f8afbc);
  rect((x-3)*s,(y)*s,6*s,6*s);
  triangle((x+3)*s, (y)*s, (x+4)*s, (y+3)*s, (x+3)*s, (y+3)*s);
  triangle((x-3)*s, (y)*s, (x-4)*s, (y+3)*s, (x-3)*s, (y+3)*s);
  rect((x-4)*s, (y+3)*s, 8*s, 3*s);
  triangle((x-4)*s, (y+6)*s, (x)*s, (y+7)*s, (x+4)*s, (y+6)*s);
}
void eye(float x, float y) {
  fill(#6f3619);
  stroke(#6f3619);
  circle(x*s, y*s, s);
}
void nose(float x, float y){
  fill(#ef477c);
  stroke(#ef477c);
  triangle((x-2)*s,(y+1)*s,(x*s),y*s,(x+2)*s,(y+1)*s);
  rect((x-2)*s, (y+1)*s, 4*s, 2*s);
  triangle((x-2)*s,(y+3)*s,(x*s),(y+4)*s,(x+2)*s,(y+3)*s);
  fill(#cf065c);
  stroke(#cf065c);
  circle((x-1)*s,(y+2)*s, 1*s);
  circle((x+1)*s,(y+2)*s, 1*s);
}
