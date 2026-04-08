/*Music Buttons
*/
// 
//Global Variable
int appWidth, appHeight;
//
void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  musicButtons();
  drawButtons(musicButtonX, buttonY, buttonWidth);
  
  // Draw all 12 button symbols
  for (int i = 0; i < numberOfButtons; i++) {
    musicSymbol(i, musicButtonX[i], buttonY, buttonWidth);
  }
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
