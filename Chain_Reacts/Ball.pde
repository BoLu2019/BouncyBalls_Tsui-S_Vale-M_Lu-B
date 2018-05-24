class Ball {
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
    radius = random(5,20);
    xMax = 600;
    yMax = 600;
    xcor = xMax/2;
    ycor = yMax/2;
    xMove = random(1, 10);
    yMove = random(1, 10);
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
