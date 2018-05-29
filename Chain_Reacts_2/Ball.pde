class Ball {
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
  final float CHANGE_FACTOR = .25;
  final float MAX_RADIUS = 50;
  int state;
  color c;
  float radius;
  float xcor;
  float ycor;
  float xMax;
  float yMax;
  float xMove;
  float yMove;
  int xDir;
  int yDir;


  Ball() {
    c = color(random(255), random(255), random(255));
    radius = 5;
    xMax = 600;
    yMax = 600;
    xcor = xMax/2;
    ycor = yMax/2;
    xMove = random(1, 10);
    yMove = random(1, 10);
    state = MOVING;
    if (random(1) < 0.5) {
      xDir = 1;
    } else {
      xDir = -1;
    }
    if (random(1) < 0.5) {
      yDir = 1;
    } else {
      yDir = -1;
    }
  }

  Ball(int x, int y) {
    this();
    xcor = mouseX;
    ycor = mouseY;
  }

  void stateCheck(Ball[] ballList) {
    for (int i = 0; i < ballList.length; i++) {
      if (state == MOVING) {
        if (ballList[i].state == GROWING || ballList[i].state == SHRINKING) {
          float xdif = xcor - ballList[i].xcor;
          float ydif = ycor - ballList[i].ycor;
          if (pow(radius + ballList[i].radius, 2) >= pow(xdif, 2) + pow(ydif, 2)) {
            state = GROWING;
          }
        }
      }
    }
  }

  void runMode() {
    if (state == MOVING) {
      move();
      stateCheck(ballList);
    }
    else if(state == GROWING){
      grow();
    }
    else if(state == SHRINKING){
      shrink();
    }
  }

  void grow() {
    if (radius >= MAX_RADIUS) {
      state = SHRINKING;
    }
    radius += CHANGE_FACTOR;
    fill(c);
    ellipse(xcor, ycor, radius, radius);
  }

  void shrink() {
    if (radius <= 0) {
      state = DEAD;
    }
    radius -= CHANGE_FACTOR;
    fill(c);
    ellipse(xcor, ycor, radius, radius);
  }

  void move() {
    if (xcor <= radius || xMax - xcor <= radius) {
      xDir *= -1;
    }
    if (ycor <= radius || yMax - ycor <= radius) {
      yDir *= -1;
    }
    xcor += xMove * xDir;
    ycor += yMove * yDir;

    fill(c);
    ellipse(xcor, ycor, radius, radius);
  }
}
