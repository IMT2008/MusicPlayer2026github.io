//Global variables
int numberOfDIVs = 1; //Best Practice
int numberOfParameters = 4;
float[] divs = new float[numberOfDIVs*numberOfParameters];
//
void divs() {
  //Note: even-odd for width-height
  float paperWidth = 279;
  float paperHeight = 216;
  divs[0] = appWidth * 70 / paperWidth;
  divs[1] = appHeight * 54 / paperHeight;
  divs[2] = appWidth * 134 / paperWidth;
  divs[3] = appHeight * 102 / paperHeight;
  
  //printArray(divs);
  rectDIV(divs[0],divs[1],divs[2],divs[3]);
  //
  for( int i=0; i<divs.length; i+=4 ) {
      rectDIV(divs[i],divs[i+1],divs[i+2],divs[i+3]);

  } //End FOR
  //
}//End DIVs
//

void rectDIV(float x, float y, float w, float h) {
  //DIVs: dividing out the CANVAS in non-overlapping sections
  rect(x ,y ,w ,h);
}//End Rectangle Code
//
//End Subprogram DIVs
