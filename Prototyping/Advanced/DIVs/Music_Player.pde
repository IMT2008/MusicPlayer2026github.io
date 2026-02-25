class MusicPlayer {
  //
  //Global Variables
  float[] divs;
  float referent;
  float column1;
  float column2;
  float column3;
  float column4;
  float column5;
  float column6;
  float textWidth;
  float textHeight;
  float row1;
  float row2;
  float row3;
  float row4;
  float errorIncrease;
  float testHeight;
  //
  //Constructor & Multiple Constructors (different parameters)
  MusicPlayer() {
  }//End Constructor
  //
  MusicPlayer(int numberOfRectangles) {
    this.divs = new float[numberOfRectangles * 4];
  }//End Constructor
  //
  void draw() {
    errorStatement("Hello World");
  }//End Draw
  //
  //Functions or Behaivours
  
  void rect(float x, float y, float w, float h) {
    rect(x, y, w, h);
  }//End RECT
  
   
  
  void divsArray() {
    //CONTINUE HERE
    //Note: develop formulaic lines through copy & paste
    //End with FOR( int  i=0; i<divs.length; i++) {}
    divs[0] = appWidth*1/4 ;
    divs[1] = appHeight*1/4 ;
    divs[2] = appWidth*1/2 ;
    divs[3] = appHeight*1/2 ;

    referent = divs[2]/13;
    column1 = divs[0] + referent;
    row1 = divs[1] + referent;
    textWidth = referent*5;
    textHeight = referent*3;
    column2 = column1 + referent;
    column3 = column2 + referent;
    column4 = column3 + referent;
    column5 = column4 + referent;
    column6 = column5 + referent*2;
    row2 = row1 + textHeight + referent*1/2;
    row3 = row2 + referent + referent*1/2;
    //

    testHeight = referent*2.5 + textHeight*2;
    errorIncrease = referent*1/2;
    while (divs[3] < testHeight) {
      divs[1] -=errorIncrease;
      row1 = divs[1] + referent;
      row2 = row1 + textHeight + referent*1/2;
      row3 = row2 + referent + referent*1/2;
      divs[3] += errorIncrease;
    }

    for ( int  i=0; i<divs.length; i++) {
      if (i%4==0 && int(i/4)==0) {
        divs[i] = appWidth*1/4;
      } else if (i%4==0&&int(i/4)==1) {
        divs[i] = appWidth-referent;
      } else if (i%4 == 0 && int(i/4)==2) {
        divs[i] = appWidth*0;
      } else if (i%4==0 && int(i/4)==3 || i%4==0 && int(i/4)==4) {
        divs[i] = column1;
      } else if (i%4==0 && int(i/4)==5) {
        divs[i] = column2;
      } else if (i%4==0 && int(i/4)==6) {
        divs[i] = column3;
      } else if  (i%4==0 && int(i/4)==7) {
        divs[i] = column4;
      } else if (i%4==0 && int(i/4)==8) {
        divs[i] = column5;
      } else if (i%4==0 && int(i/4)==9) {
        divs[i] = column6;
      } else {
      }

      if (i%4==1 && int(i/4)==0) {
        divs[i] = appHeight*1/4;
      } else if (i%4==1 && int(i/4)==1) {
        divs[i] = appHeight*0;
      } else if (i%4 ==1 && int(i/4)==2) {
        divs[i] = appHeight - referent;
      } else if (i%4==1 && int(i/4)==3) {
        divs[i] = row1;
      } else if (i%4==1 && int(i/4)>=4) {
        divs[i] = row2;
      } else {
      }

      if (i%4==2 && int(i/4) == 0) {
        divs[i] = appWidth*1/2;
      } else if (i%4==2 && int(i/4) == 1) {
        divs[i] = referent;
      } else if (i%4==2 && int(i/4) == 2) {
        divs[i] = textWidth;
      } else {
      }
      
      if ( i%4==3 && int(i/4)==0 ) {
      divs[i] = appHeight*1/2;
    } else if ( i%4==3  && int(i/4)==3 ) {
      divs[i] = textHeight;
    } else {
    }
      println(i, divs[i]);
      
      for( int  j=0; j<divs.length; j++) {
        rect(divs[j], divs[j+1], divs[j+2], divs[j+3]);
      }
    }
    
  }//End RECT
    
// End DIVs Array
    //
    //Getters
    //
    //Setters
    //
    //Output - println
    //Multiple ERROR statements based on parameters, like Constuctors
    void errorStatement(String description) {
      println(description);
    }//End Hello World
    void errorStatement(String description, float variable) {
      println(description, variable);
    }//End Hello World
    //
  
}//End Music Player Class
