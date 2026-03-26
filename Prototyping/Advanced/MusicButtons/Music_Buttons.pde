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

void musicSymbols(int index, float divX, float divY, float divDimension ){
divX = smallerDivDimension(divX, divDimension);
divY = smallerDivDimension(divY, divDimension);
divDimension = smallerDivDimension(divDimension);
//
if(index == 6) drawWideTriangle(6, divX, divY, divDimension);


}


float smallerDivDimension(float divXY, float divDimension){
return divXY = divXY + divDimension*1/4;
}
float smallerDivDimension(float divDimension){
return divDimension = divDimension*1/2;
}

void drawWideTriangle( int index, float divX, float divY, float divDimension) {
  triangle(divX, divY, divX+divDimension, divY+smallerDivDimension(divDimension), divX, divY+divDimension);
}//End drawBigTriangle
void drawLines(float divX, float divY, float divDimension) {
  line(divX, divY, divX+divDimension, divY+divDimension);
  line(divX+divDimension, divY, divX, divY+divDimension);
}//End drawLines
