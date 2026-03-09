//Global variables
int numberOfDIVs = 16; //Best Practice
int numberOfParameters = 4;
float[] divs = new float[numberOfDIVs*numberOfParameters];
//
void divs() {
divs[0] = appWidth*1/4 ; 
divs[1] = appHeight*1/4 ; 
divs[2] = appWidth*1/2 ; 
divs[3] = appHeight*1/2 ; 

float referent = divs[2]/13; 
float column1 = divs[0] + referent; 
float row1 = divs[1] + referent; 
float textWidth = referent*5; 
float textHeight = referent*3; 
float column2 = column1 + referent; 
float column3 = column2 + referent; 
float column4 = column3 + referent; 
float column5 = column4 + referent; 
float column6 = column5 + referent*2; 
float row2 = row1 + referent + referent*1/2; 
float row3 = row2 + textHeight+ referent*1/2; 
float row4 = row3 + referent + referent*1/2; 


  float testHeight = referent*2.5 + textHeight*2;
  float errorIncrease = referent*1/2;
  while (divs[3] < testHeight) { //Height Calculation ERROR
    //Extend Height by moving divs[1] up one referent, and extending rect() one-referent
    divs[1] -= errorIncrease; //Move Y-start up
    row1 = divs[1] + referent;
    row2 = row1  + referent + referent* 1/2;
    row3 = row2 + textHeight + referent*1/2;
    row4 = row3 + referent + referent*1/2; 
    divs[3] += errorIncrease; //Increase height
  }

// Rectangle 1:
divs[4] = appWidth - referent;           
divs[5] = appHeight*0;              
divs[6] = referent;         
divs[7] = referent;        

// Rectangle 2: 
divs[8] = appWidth*0;           
divs[9] = appHeight - referent;              
divs[10] = referent;     
divs[11] = referent; 

// Rectangle 3: 
divs[12] = column1;          
divs[13] = row1;             
divs[14] = textWidth;         
divs[15] = referent;        

// Rectangle 4: 
divs[16] = column1;          
divs[17] = row2;             
divs[18] = textWidth;         
divs[19] = textHeight;         

// Rectangle 5: First row small square (col 2)
divs[20] = column1;          
divs[21] = row3;             
divs[22] = referent;         
divs[23] = referent;         

// Rectangle 6: First row small square (col 3)
divs[24] = column2;          
divs[25] = row3;             
divs[26] = referent;         
divs[27] = referent;         

// Rectangle 7: First row small square (col 4)
divs[28] = column3;          
divs[29] = row3;             
divs[30] = referent;         
divs[31] = referent;         

// Rectangle 8: First row small square (col 5)
divs[32] = column4;          
divs[33] = row3;             
divs[34] = referent;         
divs[35] = referent;         

// Rectangle 9: Second row small square (col 1)
divs[36] = column5;          
divs[37] = row3;             
divs[38] = referent;         
divs[39] = referent;         

// Rectangle 10: Second row small square (col 2)
divs[40] = column1;          
divs[41] = row4;             
divs[42] = referent;         
divs[43] = referent;         

// Rectangle 11: Second row small square (col 3)
divs[44] = column2;          
divs[45] = row4;             
divs[46] = referent;         
divs[47] = referent;         

// Rectangle 12: Second row small square (col 4)
divs[48] = column3;          
divs[49] = row4;             
divs[50] = referent;         
divs[51] = referent;         

// Rectangle 13: Second row small square (col 5)
divs[52] = column4;          
divs[53] = row4;             
divs[54] = referent;         
divs[55] = referent;         

// Rectangle 14: Bottom left corner box
divs[56] = column5;          
divs[57] = row4;             
divs[58] = referent;         
divs[59] = referent;         

// Rectangle 15: Top right corner box
divs[60] = column6;          
divs[61] = row1;             
divs[62] = textWidth;         
divs[63] = textHeight * 5 * 1/2;              
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
