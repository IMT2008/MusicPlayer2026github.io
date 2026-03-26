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
  drawButtons(musicButtonX[0], buttonY, buttonWidth);
  musicSymbol(6, musicButtonX[6], buttonY, buttonWidth);

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
