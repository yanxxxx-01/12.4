//create enemy for chanllenge, use fish right here
//fish should come from right to left
//if jellyfish touched fish, game over

class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Fish() {
    location = new PVector(500, random(100, 300));//start from out screen, random y location
    velocity = new PVector(random(5, 10), 10);
    acceleration = new PVector(random(2), 0);
  }

  void display() {
    //come from right side screen
    if (gameState == 1) { //game started, start display from out screen
      image(fishImage, location.x, location.y, 150, 100);
      //move, and reset fish when it
      location.x -= velocity.x;
      velocity.x += acceleration.x;
      if (location.x <-100) {
        velocity.x = random(5,10);
        location.y = random(100, 300);
        location.x = 500;
      }
    }
  }
}
