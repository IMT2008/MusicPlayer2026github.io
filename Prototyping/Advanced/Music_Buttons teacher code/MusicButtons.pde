/*Note
 -
 */
//global variables'
int randomButtonY, randomButtonDimension, buttonY, buttonWidth, numberOfButtons = 12 ;
float[] musicButtonDivX = new float[numberOfButtons];
//
void populationBuild() {
  //population building
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
//
void musicSymbol(int index, float divX, float divY, float divDimension ) { //index from X-Var, musicButtonDivX
  divX = smallerNum(divX, divDimension);
  divY = smallerNum(divY, divDimension);
  divDimension = smallerNum(divDimension);
  //
  if (index == 11)drawStaightLines(divX, divY);

  if (index == 1 || index == 2 || index== 7 || index== 8) {
    if ((index == 1 || index == 2 || index== 7 || index== 8))drawMusicDivs(divX, divY, divDimension);
    if (index == 7 || index ==8) {
      float newDivX = divX - divDimension*1/8;
      float newDivY  = divY - divDimension*1/8;
      float newDivDimension = divDimension * 1/4;
      drawWideTrangle(6, newDivX, newDivY, newDivDimension);
    }
  }
    if (index == 7 || index ==8) {
      divX = smallerNum(divX, divDimension);
      divY = smallerNum(divY, divDimension);
      divDimension = smallerNum(divDimension);
      drawMusicDivs(divX, divY, divDimension);
  }
  if (index == 2)drawLines(divX, divY, divDimension);
  if (index == 6)drawWideTrangle(6, divX, divY, divDimension);
  
  
}//End MusicSymbols
float smallerNum( float divXY, float divDimension) {
  return divXY = divXY + divDimension*1/4;
}
float smallerNum(float divDimension) {
  return divDimension = divDimension*1/2;
}
void drawLines(float divX, float divY, float divDimension) {
  line(divX, divY, divX+divDimension, divY+divDimension);
  line(divX+divDimension, divY, divX, divY+divDimension);
}
void drawWideTrangle( int index, float divX, float divY, float divDimension) {
  triangle(divX, divY, divX+divDimension, divY+smallerNum(divDimension), divX, divY+divDimension);
}
void drawStaightLines(float divX, float divY, float divDimension){
    line(divX, divX, divY, divY);
}
//























//End Subprogram
