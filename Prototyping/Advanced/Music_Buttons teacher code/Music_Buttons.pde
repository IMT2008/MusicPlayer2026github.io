/*Music Buttons (teacher example)
 */
//
// Global Variables
int appWidth, appHeight;
//
void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  populationBuild();
  drawMusicDivs(musicButtonDivX[0], randomButtonY, randomButtonDimension);
  drawMusicDivs(musicButtonDivX, buttonY, buttonWidth);
  //
  musicSymbol(1, musicButtonDivX[1], buttonY, buttonWidth);
  musicSymbol(2, musicButtonDivX[2], buttonY, buttonWidth);
  musicSymbol(6, musicButtonDivX[6], buttonY, buttonWidth);
  musicSymbol(7, musicButtonDivX[7], buttonY, buttonWidth);
  musicSymbol(8, musicButtonDivX[8], buttonY, buttonWidth);
  musicSymbol(11, musicButtonDivX[11], buttonY, buttonWidth);

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
