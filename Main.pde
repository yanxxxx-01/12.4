//Main page of the game

//Variables setup
//Create a finite-state machine for gamestate https://www.ni.com/en/support/documentation/supplemental/16/simple-state-machine-template-documentation.html
//0 for not started, 1 for started,2 for game overed
int gameState = 1;
PVector bgLocation;
//set class
JellyFish jf;

//Set PImage
PImage jellyFish, background;

//setting
void setup() {
  //canva setting
  size(400, 400);
  rectMode(CORNER);
  //image setting
  imageMode(CENTER);
  //import images
  background = loadImage("background.png");
  //use class
  jf = new JellyFish();
  //Pvector
  bgLocation = new PVector(300, 200);
}

void draw() {
  background(255);
  //game started
  if (gameState == 1) {

    fill(#FFBC3E);//ground color
    noStroke();
    rect(0, 350, 400, 400);// Draw ground

    image(background, bgLocation.x, bgLocation.y, 600, 300);//draw background
    image(background, bgLocation.x+300, bgLocation.y, 600, 300);//draw background
    bgLocation.x -= 2;
    if (bgLocation.x <= 0) {
      bgLocation.x = 300;
    }

    jf.display(); // Draw jellyfish
    jf.move();
  }
}
