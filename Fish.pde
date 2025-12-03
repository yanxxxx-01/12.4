//create enemy for chanllenge, use fish right here
//fish should come from right to left
//if jellyfish touched fish, game over

class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Fish() {
    location = new PVector(200, 200);
    velocity = new PVector(10, 10);
  }

  void display() {
    //come from right side screen
    image(fishImage, 200, 200, 150, 100);
  }
}
