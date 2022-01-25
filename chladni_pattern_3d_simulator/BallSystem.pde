class ParticleSystem {
  ArrayList<Ball> balls;
  Plate holder;
  PVector origin;
  int numberOfBalls;

  ParticleSystem(Plate hold, int numberOfBalls, float ballSize) {
    holder = hold;
    numBalls = numberOfBalls;

    balls = new ArrayList<Ball>();

    for (int i = 0; i < numBalls; i++) {
      balls.add( new Ball(random(0, holder.w), -600, random(0, holder.d), ballSize, i, holder) );
    }
    
    for (int i = 0; i < numBalls; i++) {
      Ball b = balls.get(i);
      b.others = balls;
    }
  }

  void run() {
    for (int i = balls.size()-1; i >= 0; i--) {
      Ball b = balls.get(i);
      b.collide();
      b.move();
      b.display();
      if (b.alpha < 1) {
        balls.remove(i);
      }
    }
  }
}
