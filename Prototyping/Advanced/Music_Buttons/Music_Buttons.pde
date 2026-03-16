/*Music Buttons (teacher example)
 */
//
// Global Variables
int appWidth, appHeight;
int numberOfButtons = 12;
float[] musicButtonDivX = new float[numberOfButtons];

//
void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  //population
  int buttonWidth = appWidth/13; // Number of buttons in a row + 2xPadding
  int buttonY = appHeight*3/5; //Most Buttons
  int randomButtonX = 0;
  int randomButtonY = 0;
  float randomButtonDimension = appHeight*1/20;//changed to SQUARE
  //musicButtonDivX
  musicButtonDivX[0] = randomButtonX;
  for ( int i=1; i<musicButtonDivX.length; i++) {
    musicButtonDivX[i] = buttonWidth*i;
  }
  
    //
}//End Setup
//
void draw() {
}//End Draw
//
void mousePressed() {
}//End MousePressed
//
void keyPressed() {
}//End KeyPressed
//
//End MAIN
