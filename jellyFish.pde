//JellyFish class

class JellyFish {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float gravity = 5;
  boolean inJump = false;
  // Consturctor
  JellyFish () {
    location = new PVector(50, 200);
    velocity = new PVector(0, -10);
    acceleration = new PVector(0, 1);
  }

  void display() {
    //draw jellyfish
    jellyFish = loadImage("jellyfish.png");
    image(jellyFish, location.x, location.y, 70, 70);
  }

  //moving control
  void move() {
    //in the game
    if (gameState == 1) {
      //gravity
      location.y += gravity;

      if (location.y > 350) {
        //if touch ground, stop falling
        gravity = 0;
        location.y = 350;
        
      } else {
        gravity = 3;
      }

      if (keyPressed) {
        //if key 'w' pressed, start jump
        velocity.y = -10;
        if (key == 'w' && inJump == false) {
            inJump
            velocity.y -= acceleration.y;
            location.y += velocity.y;
          
        }
        //if key 's' pressed, let falling speed faster
        if (key == 's') {
          location.y -= velocity.y;
        }
      }
    }
  }
}
