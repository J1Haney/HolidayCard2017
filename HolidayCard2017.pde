ArrayList<Flake> f = new ArrayList<Flake>();
ArrayList<Smoke> s = new ArrayList<Smoke>();
Ground g = new Ground();
void setup() {
  size(800, 600);
  background(#00004f);
  noStroke();
  Flake fl = new Flake(random(800), random(600), random(1, 4), random(.5, 2));
  Smoke sm = new Smoke(205, 470, 10);
  for (int i=0; i<200; i++) {
    f.add(new Flake(random(800), random(600), random(1, 4), random(.5, 2)));
  }
  for (int i=0; i<50; i++) {
    s.add(new Smoke(random(205, 270), random(330, 470), random(10, 15)));
  }
}

void draw() {
  background(#00004f);
  g.display2();
  g.window();
  g.moon();
  for (Flake flak : f) {
    flak.display();
  }
  for (Smoke smok : s) {
    smok.display();
  }
  println(mouseX + " " + mouseY);
}
class Ground {

  Ground() {
  }
  void display2() {
    stroke(1);
    fill(#ffffff);
    rect(0, 550, 800, 50);
    fill(#4d2600);
    rect(130, 500, 90, 50);
    fill(0);
    triangle(120, 500, 175, 475, 230, 500);
    rect(200, 470, 10, 25);
    rect(185, 515, 20, 20);
    fill(#800000);
    rect(150, 518, 18, 32);
    fill(0);
    ellipse(153, 538, 2, 2);
    fill(#4d2600);
    rect(300, 535, 10, 15);
    rect(380, 535, 10, 15);
    rect(420, 520, 10, 30);
    rect(455, 535, 10, 15);
    rect(550, 535, 10, 15);
    rect(650, 535, 10, 15);
    rect(670, 520, 10, 30);
    rect(605, 535, 10, 15);
    fill(#336600);
    triangle(305, 470, 280, 535, 330, 535);
    triangle(385, 485, 370, 535, 400, 535);
    triangle(425, 435, 395, 520, 455, 520);
    triangle(460, 470, 440, 535, 485, 535);
    triangle(555, 470, 530, 535, 580, 535);
    triangle(385, 485, 370, 535, 400, 535);
    triangle(675, 435, 645, 520, 705, 520);
    triangle(610, 470, 590, 535, 635, 535);
    triangle(655, 470, 630, 535, 680, 535);
    fill(#ff3300);
    ellipse(300, 500, 3, 3);
    ellipse(315, 515, 3, 3);
    ellipse(290, 530, 3, 3);
    ellipse(310, 525, 3, 3);
    fill(#3399ff);
    ellipse(310, 495, 3, 3);
    ellipse(305, 510, 3, 3);
    ellipse(320, 530, 3, 3);
    ellipse(295, 520, 3, 3);
    fill(#ffff00);
    ellipse(307, 485, 3, 3);
    ellipse(313, 508, 3, 3);
    ellipse(301, 530, 3, 3);
    ellipse(297, 513, 3, 3);
    noStroke();
    fill(#ff0000);
    textAlign(CENTER);
    textSize(40);
    text("Happy Holidays!",400, 590);
  }
  void window() {
    stroke(1);
    fill(255, 170, 0, random(100, 200));
    rect(185, 515, 20, 20);
    fill(#4d2600);
    rect(194, 515, 2, 20);
    rect(185, 524, 20, 2);
    noStroke();
  }
  void moon() {
    float t = (frameCount / 5000.0)%1;
    float x = bezierPoint(-50, 200, 600, 850, t);
    float y = bezierPoint(80, 40, 40, 80, t);
    fill(#fff8e7);
    ellipseMode(CENTER);
    ellipse(x, y, 80, 80);
    fill(#00004f);
    ellipse(x+23, y-18, 80, 80);
  }
}
class Smoke {
  float x, y, size, increment;
  Smoke(float _x, float _y, float _size) {
    x=_x;
    y=_y;
    size=_size;
  }
  void display(){
  fill(135,135,135,increment);
  ellipse(x,y,size,size);
  if(y>340||x<370){y-=random(0,.3);x+=random(0,.3);size+=random(0,.08);increment-=random(0,1);}
  if(y<340||x>370){x=205;y=470;size=10;increment=255;}
  }
}
class Flake {
  float x, y, size, increment;

  Flake(float _x, float _y, float _size, float _increment) {
    x=_x;
    y=_y;
    size=_size;
    increment = _increment;
  }


  void display() {
    fill(#ffffff);
    ellipse(x, y, size, size);
    if (y<600) {
      y=y+increment;
      x=x+random(.5,1.5);
      if (y>=600) {
        y=0;
      }
      if (x>800) {
        x=0;
      }
    }
  }
}
