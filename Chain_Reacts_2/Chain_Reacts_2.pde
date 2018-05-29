Ball[] ballList = new Ball[25];

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  ellipseMode(RADIUS);
  for(int i = 0; i < 25; i++){
    ballList[i] = new Ball();
  }
}

void draw() {  
  background(0);
  for(int i = 0; i < ballList.length; i++){
    ballList[i].runMode();
  }
}

void mouseClicked(){
  Ball[] more = new Ball[ballList.length+1];
  for(int i = 0; i < ballList.length; i++){
      more[i] = ballList[i];
  }
  more[more.length-1] = new Ball();
  more[more.length-1].state = 1;
  ballList = more;
}
