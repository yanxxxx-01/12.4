//JellyFish/player class, player move control
//what player can control in this game

class JellyFish {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float gravity = 0.25;
  boolean inJump = false;
  int passTime = 350;
  int saveTime;

  // Consturctor
  JellyFish () {
    location = new PVector(50, 200);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 5);
  }

  void display() {
    //draw jellyfish
    jellyFish = loadImage("jellyfish.png");
    image(jellyFish, location.x, location.y, 70, 70);
  }

  //moving control
  void move() {
    //if in the game
    if (gameState == 1) {

      velocity.y += gravity;
      location.y += velocity.y;


      //Make a timer for jump CD, let player can't keep pressing key. reference: https://blog.csdn.net/weifengdq/article/details/50598490#:~:text=%E6%9C%AC%E6%96%87%E8%AF%A6%E7%BB%86%E4%BB%8B%E7%BB%8D%E4%BA%86%E5%A6%82%E4%BD%95%E5%9C%A8Processing%E4%B8%AD%E5%88%A9%E7%94%A8CTimer%E7%B1%BB%E5%AE%9E%E7%8E%B0%E7%B1%BB%E4%BC%BC%E5%8D%95%E7%89%87%E6%9C%BA%E7%9A%84%E5%AE%9A%E6%97%B6%E5%99%A8%E5%8A%9F%E8%83%BD%EF%BC%8C%E9%80%9A%E8%BF%87%E5%AE%9E%E4%BE%8B%E5%8C%96%E5%AE%9A%E6%97%B6%E5%99%A8%E5%AF%B9%E8%B1%A1%E5%B9%B6%E8%AE%BE%E7%BD%AE%E6%89%A7%E8%A1%8C%E5%91%A8%E6%9C%9F%E6%9D%A5%E6%8E%A7%E5%88%B6%E7%A8%8B%E5%BA%8F%E8%A1%8C%E4%B8%BA%E3%80%82,%E6%96%87%E7%AB%A0%E7%89%B9%E5%88%AB%E8%AE%A8%E8%AE%BA%E4%BA%86%E4%B8%8EC%E8%AF%AD%E8%A8%80%E4%B8%ADstatic%E5%85%B3%E9%94%AE%E5%AD%97%E7%9A%84%E4%B8%8D%E5%90%8C%E7%94%A8%E6%B3%95%EF%BC%8C%E5%B9%B6%E5%B1%95%E7%A4%BA%E4%BA%86%E5%A6%82%E4%BD%95%E4%BD%BF%E7%94%A8millis%20%28%29%E5%87%BD%E6%95%B0%E8%8E%B7%E5%8F%96%E7%B3%BB%E7%BB%9F%E8%BF%90%E8%A1%8C%E6%97%B6%E9%97%B4%E4%BB%A5%E7%B2%BE%E7%A1%AE%E6%8E%A7%E5%88%B6%E5%AE%9A%E6%97%B6%E4%BB%BB%E5%8A%A1%E3%80%82
      if (millis()-saveTime >= passTime) {
        inJump = false;
      }

      //in game - player actions usable
      if (keyPressed) {

        //if key 'w' pressed, start jump
        if (key == 'w' && inJump == false) {
          saveTime = millis();
          inJump = true;
          velocity.y -= min(acceleration.y,10);
        }
        //if key 's' pressed, let falling speed faster
        if (key == 's') {

          velocity.y += max(acceleration.y/2,5);
        }
      }
    }

    //if touch ground, stop falling
    if (location.y > 350) {
      location.y = 349;
      velocity.y = 0;
    }

    //if touch the top, stop up
    if (location.y < 100) {
      location.y = 101;
      velocity.y = 0;
    }
  }
}
