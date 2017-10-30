int[][] theBoard;
int rows, cols;
float squareWidth, squareHeight;

void setup() {
  size(800, 800);
  
  rows = 40;
  cols = 40;
  startBoardValues();

}

void draw() {
  displayBoard();

}





void startBoardValues() {
  theBoard = new int [cols][rows];
  squareWidth = width/cols;
  squareHeight = height/rows;
  
}


void displayBoard() {
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (y == 20) {
        fill(0);
      }
      else {
        fill(255);
      }
      rect(x*squareWidth,y*squareHeight,squareWidth,squareHeight);
    }
  
  }
}