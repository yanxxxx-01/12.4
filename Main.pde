//Game 12805 Object Oriented Game
//Created by Cindy Wang

//Main page of the game
//Variables setup
//Create a finite-state machine for gamestate https://www.ni.com/en/support/documentation/supplemental/16/simple-state-machine-template-documentation.html
//0 for not started, 1 for started,2 for game overed
int gameState = 0;
int score = 0;

PVector bgLocation;
//set class
JellyFish jf;
//set array
Fish fishs[];

//Set PImage
PImage jellyFish, background, fishImage, jellyFish2;

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
  jellyFish = loadImage("jellyfish.png");
  jellyFish2 = loadImage("jellyfish2.png");
  
  //jellyfish class
  jf = new JellyFish();
  
  //create fish class by array
  fishs = new Fish[2];
  for (int i = 0; i<fishs.length; i++) {
    fishs[i] = new Fish();
  }

  //Pvector
  bgLocation = new PVector(300, 200);
}

void draw() {
  background(255);

  if (gameState == 0) { //menu page
    image(background, 200, 200, 1200, 800);
    image(jellyFish, 200, 200, 300, 300);
    textSize(30);
    text("Press 'w' to start and jump!", 20, 40);
    if (key == 'w') { //game start
      gameState = 1;
    }
  }

  if (gameState == 1) { //in game

    frameRate(120) ;

    fill(#FFBC3E);//ground color
    noStroke();
    rect(0, 350, 400, 400);// Draw ground

    image(background, bgLocation.x, bgLocation.y, 600, 300);//draw background
    image(background, bgLocation.x+300, bgLocation.y, 600, 300);//draw background 2
    bgLocation.x -= 2;
    if (bgLocation.x <= 0) {
      bgLocation.x = 300;
    }

    jf.display(); // Draw jellyfish
    jf.move();
    for (int i = 0; i < fishs.length; i++) {
      fishs[i].display();//Draw fish
    }
    collision(); //check collision box

    //score
    score++;
    textSize(40);
    text("score: "+score/10, 20, 40);
  }

  if (gameState == 2) {//game over
    score = 0;//reset score when game over
    background (255);
    image(jellyFish2, 200, 200, 350, 350);
    if (keyPressed) {
      gameState = 1;
      for (int i = 0; i < fishs.length; i++) {
      fishs[i].location.x = 500;
      }
    }
  }
}

void collision() {
  //collision check, using aabb, reference: https://kishimotostudios.com/articles/aabb_collision/
  //var for collision
  float jfLeft = jf.location.x - 15;
  float jfRight = jf.location.x + 15;
  float jfTop = jf.location.y - 25;
  float jfBottom = jf.location.y + 15;

 for(int i = 0; i < fishs.length; i++){
  float fishLeft = fishs[i].location.x -35;
  float fishRight = fishs[i].location.x + 35;
  float fishTop = fishs[i].location.y - 25;
  float fishBottom = fishs[i].location.y + 25;

  //if touched fish (collision check) , game over (state to 2)
  if (jfLeft <= fishRight &&
    jfRight >= fishLeft &&
    jfTop <= fishBottom &&
    jfBottom >= fishTop) {
    gameState = 2;
  }
}
}
