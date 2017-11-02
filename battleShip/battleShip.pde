// this is for board related stuff
int[][] theBoard, theEnemyBoard;
int rows, cols;
float squareWidth, squareHeight;
int lengthOfBoard; // instead of me having to change rows and cols evertime


// this is for the ships on ally side
int playerNumberOfShips, totalLengthOfPlayerShips, ship1, ship2, ship3, ship4;

int ship1X,ship1Y,   ship2X,ship2Y,  ship3X,ship3Y,  ship4X,ship4Y;

boolean isHorizontal, ship1Moving,ship2Moving,ship3Moving,ship4Moving; // it makes the ships horizontal

float moveByX, moveByY;
// this is to keep track of where the game is. 
int state;

void setup() {
  size(800,800);
  lengthOfBoard = 20;
  
  rows = lengthOfBoard;
  cols = lengthOfBoard;
  
  state = 1;
  
  isHorizontal = false;
  
  playerNumberOfShips = 4;

  startMovmentBooleans(); 
  
  startBoardValues();

  startShipsValues();

}

void draw() {
  background(255);
  if (state == 0) {
  //
  }
  if (state == 1) { // main game loop
    displayBoard();
    displayEnemyBoard();
    showTheShips();
    checkIfisClickinShip();
    shipsMovment();

  }

}

void startMovmentBooleans() {
  ship1Moving = false;
  ship2Moving = false;
  ship3Moving = false;
  ship4Moving = false;
}


void startShipsValues() {
  ship1X = width - width/3 - width/12;
  ship1Y = 0 + 100;
  
  ship2X = width - width/6;
  ship2Y = 0 + 100;
  
  ship3X = width - width/3-  width/12;
  ship3Y = height - height/4;
  
  ship4X = width - width/4;
  ship4Y = height - height/4;
  
  
  
}

void startBoardValues() {
  theBoard = new int [cols][rows];
  theEnemyBoard = new int [cols] [rows];
  squareWidth = width/cols;
  squareHeight = height/rows;
  
  
}


void displayBoard() {
  for (int x = 0; x < cols-10; x++) {
    for (int y = rows/2; y < rows; y++) {
      if (y == lengthOfBoard/2) {
        fill(0);
      }
      else {
        fill(255);
      }
      rect(x*squareWidth,y*squareHeight,squareWidth,squareHeight);
    }
  
  }
}


void displayEnemyBoard() {
  for (int x = 0; x < cols-10; x++) {
    for (int y = 0; y < rows/2; y++) {
      if (y == lengthOfBoard/2) {
        fill(0);
      }
      else {
        fill(255);
      }
      rect(x*squareWidth,y*squareHeight,squareWidth,squareHeight);  
  }
    
  
  }
}


void showTheShips() {
  if (isHorizontal) {
    moveByX = squareWidth;
    moveByY = 0; 
    
  }
  else {
    moveByX = 0;
    moveByY = squareHeight;
  }
  
  fill(0);
  // ship 1 is 2 tiles
  rectMode(CENTER);
  rect(ship1X,ship1Y,squareWidth,squareWidth);
  rect(ship1X + moveByX,ship1Y + moveByY,squareWidth,squareWidth);

  
  
  // ship 2 is 3 tiles
 rect(ship2X,ship2Y,squareWidth,squareWidth);
 rect(ship2X + moveByX,ship2Y + moveByY,squareWidth,squareWidth);
 rect(ship2X + moveByX*2,ship2Y + moveByY*2,squareWidth,squareWidth);
  
  
  
  
  // ship 3 is 3 tiles
 rect(ship3X,ship3Y,squareWidth,squareWidth);
 rect(ship3X + moveByX,ship3Y + moveByY,squareWidth,squareWidth);
 rect(ship3X + moveByX*2,ship3Y + moveByY*2,squareWidth,squareWidth);
  
  
  // ship 4 is 4 tiles
 rect(ship4X,ship4Y,squareWidth,squareWidth);
 rect(ship4X + moveByX,ship4Y + moveByY,squareWidth,squareWidth);
 rect(ship4X + moveByX*2,ship4Y + moveByY*2,squareWidth,squareWidth);
 rect(ship4X + moveByX*3,ship4Y + moveByY*3,squareWidth,squareWidth);
}




void checkIfisClickinShip() {
  // if clicking first 1st ship
  float halfSize = squareHeight/2;
  if ((mouseY > ship1Y - halfSize && mouseY < ship1Y- halfSize + squareHeight*2) && (mouseX > ship1X- halfSize && mouseX < ship1X - halfSize + squareWidth )) { 
    if (mousePressed && (mouseButton == LEFT)) {
      ship1Moving = true;
    }
  
  }
  if ((mouseY > ship2Y - halfSize && mouseY < ship2Y- halfSize + squareHeight*2) && (mouseX > ship2X- halfSize && mouseX < ship2X - halfSize + squareWidth )) { 
    if (mousePressed && (mouseButton == LEFT)) {
      ship2Moving = true;
    }
  
  }
  if ((mouseY > ship3Y - halfSize && mouseY < ship3Y- halfSize + squareHeight*2) && (mouseX > ship3X- halfSize && mouseX < ship3X - halfSize + squareWidth )) { 
    if (mousePressed && (mouseButton == LEFT)) {
      ship3Moving = true;
    }
  
  }
  if ((mouseY > ship4Y - halfSize && mouseY < ship4Y- halfSize + squareHeight*2) && (mouseX > ship4X- halfSize && mouseX < ship4X - halfSize + squareWidth )) { 
    if (mousePressed && (mouseButton == LEFT)) {
      ship4Moving = true;
    }
  
  }
}


void shipsMovment() {
  if (ship1Moving) {  
    ship1X = mouseX;
    ship1Y = mouseY;
    ship2Moving = false;
    ship3Moving = false;
    ship4Moving = false;
}
  else if (ship2Moving) {
    ship2X = mouseX;
    ship2Y = mouseY;
    ship1Moving = false;
    ship3Moving = false;
    ship4Moving = false;
  }
  else if (ship3Moving) {
    ship3X = mouseX;
    ship3Y = mouseY;
    ship1Moving = false;
    ship2Moving = false;
    ship4Moving = false;
  }
  else if (ship4Moving) {
    ship4X = mouseX;
    ship4Y = mouseY;
    ship1Moving = false;
    ship2Moving = false;
    ship3Moving = false;
  }
  }


void mousePressed() {
   float halfSize = squareHeight/2;
  if  ((mouseY > ship1Y - halfSize && mouseY < ship1Y- halfSize + squareHeight*2) && (mouseX > ship1X- halfSize && mouseX < ship1X - halfSize + squareWidth ) &&(mouseButton == RIGHT)) {
    isHorizontal = !isHorizontal;
  }
  else if  ((mouseY > ship2Y - halfSize && mouseY < ship2Y- halfSize + squareHeight*2) && (mouseX > ship2X- halfSize && mouseX < ship2X - halfSize + squareWidth ) &&(mouseButton == RIGHT)) {
    isHorizontal = !isHorizontal;
  }
  else if  ((mouseY > ship3Y - halfSize && mouseY < ship3Y- halfSize + squareHeight*2) && (mouseX > ship3X- halfSize && mouseX < ship3X - halfSize + squareWidth ) &&(mouseButton == RIGHT)) {
    isHorizontal = !isHorizontal;
  }
  else if  ((mouseY > ship4Y - halfSize && mouseY < ship4Y- halfSize + squareHeight*2) && (mouseX > ship4X- halfSize && mouseX < ship4X - halfSize + squareWidth ) &&(mouseButton == RIGHT)) {
    isHorizontal = !isHorizontal;
  }
}
void mouseReleased() {
  ship1Moving =  false;
  ship2Moving = false;
  ship3Moving = false;
  ship4Moving = false;
}