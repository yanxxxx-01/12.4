//Main page of the game

//Variables setup
//Create a finite-state machine for gamestate https://www.ni.com/en/support/documentation/supplemental/16/simple-state-machine-template-documentation.html
//0 for not started, 1 for started,2 for game overed
int gameState = 1;

//set class
JellyFish jf;

//Set PImage
PImage jellyFish;

//setting
void setup() {
  //canva setting
  size(400, 400);


  //image setting
  imageMode(CENTER);
  rectMode(CORNER);

  //use class
  jf = new JellyFish();

  //import images I need


  //classies
}

void draw() {
  
  //game started
  background(255);
  fill(100);
  rect(0, 350, 400, 400);// Draw ground
  

  jf.display(); // Draw jellyfish
    jf.move();
  
}
