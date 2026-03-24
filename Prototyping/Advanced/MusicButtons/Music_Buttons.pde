/*Note
 -
 */
//global variables'
int buttonWidth, buttonY, numberOfButtons = 12;
float[] musicButtonX = new float[numberOfButtons];

void musicButtons() {
  buttonWidth = appWidth/13;
  buttonY = appHeight*3/5;
  musicButtonX[0] = 0;
  for (int i=1; i<musicButtonX.length; i++) {
    musicButtonX[i] = buttonWidth*i;
  }
}//End MusicButtons

void drawButtons(float[] x, float y, float d) {
  for ( int i=1; i<musicButtonX.length; i++) {
    square(x[i], y, d);
  }
}//End drawButtons

void musicSymbols(int whichButton, float divX, float divY, float divDimension ){
divX = smallerDivDimensionXY(divX, divDimension);
divY = smallerDivDimensionXY(divY, divDimension);
divDimension = smallerDivDimensionD(divDimension);
//


}


float smallerDivDimensionXY(float divXY, float divDimension){
return divXY = divXY + divDimension*1/4;
}
float smallerDivDimensionD(float divDimension){
return divDimension = divDimension*1/2;
}

void drawBigTriangle() {}//End drawBigTriangle
void drawLines(){}//End drawLines
