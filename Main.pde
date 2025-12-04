//Main page of the game

//Variables setup
//Create a finite-state machine for gamestate https://www.ni.com/en/support/documentation/supplemental/16/simple-state-machine-template-documentation.html
//0 for not started, 1 for started,2 for game overed
int gameState = 1;
PVector bgLocation;
//set class
JellyFish jf;
Fish fish;

//Set PImage
PImage jellyFish, background, fishImage;

//setting
void setup() {
  //canva setting
  size(400, 400);
  rectMode(CORNER);
  //image setting
  imageMode(CENTER);
  //import images
  background = loadImage("background.png");
  fishImage = loadImage("tuna.png");
  //jellyfish class
  jf = new JellyFish();
  //fish class
  fish = new Fish();

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

    fish.display();//Draw fish

    //collision check, using aabb, reference: https://kishimotostudios.com/articles/aabb_collision/
   //var for collision
    float jfLeft = jf.location.x -35;
    float jfRight = jf.location.x + 35;
    float jfTop = jf.location.y - 35;
    float jfBottom = jf.location.y + 35;
    
    float fishLeft = fish.location.x -35;
    float fishRight = fish.location.x + 35;
    float fishTop = fish.location.y - 35;
    float fishBottom = fish.location.y + 35;
    
     //if touched fish (collision check) , game over (state to 2)
    if (jfLeft <= fishRight &&
    jfRight >= fishLeft &&
    jfTop <= fishBottom &&
    jfBottom >= fishTop) {
      gameState = 2; 
    }
  }
}
