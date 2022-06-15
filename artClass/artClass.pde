int s = 50;

void setup() {
  background(0);
  size(800, 800);
}

void draw() {
  background(122);
  frameRate(30);
  stroke(255);
  grid();
  stroke(255,0,0);
  line(400, 0, 400, 800);
  stroke(255);
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
  head(8, 4);
  nose(8, 6);
  eye(5, 7);
  eye(11, 7);
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
  circle(x*s, y*s, 50);
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
