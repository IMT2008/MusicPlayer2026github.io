/*Note
 -
 */
//global variables'
int randomButtonY, randomButtonDimension, buttonY, buttonWidth,numberOfButtons = 12 ;
float[] musicButtonDivX = new float[numberOfButtons];
//
void populationBuild() {
  //population
  buttonWidth = appWidth/13; // Number of buttons in a row + 2xPadding
  buttonY = appHeight*3/5; //Most Buttons
  int randomButtonX = 0;
  randomButtonY = 0;
  randomButtonDimension = appHeight*1/20;//changed to SQUARE
  //musicButtonDivX
  musicButtonDivX[0] = randomButtonX;
  for ( int i=1; i<musicButtonDivX.length; i++) {
    musicButtonDivX[i] = buttonWidth*i;
  }
  //
}//End populationBuild
//
void drawMusicDivs(float x, float y, float d) {
  square(x, y, d);
}//End Music Divs
void drawMusicDivs(float[] x, float y, float d) {
  for ( int i=1; i<musicButtonDivX.length; i++) {
    square(x[i], y, d);
  }
}//End Music Divs
