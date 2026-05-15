class MusicPlayer {
  //
  //Global Variables
  float[] divs;
  int[] boxes = new int[10];
  Boolean musicGUI=false;
  //Constructor & Multiple Constructors (different parameters)
  MusicPlayer() {
  }
  //End Constructor
  //
  MusicPlayer(int numberOfRectangles) {
    this.divs = new float[numberOfRectangles*4];
    divs();
    setupBoxes();
  }//End Constructor
  //
  void draw() {
    //ERRORCheck("Hello World");
    seeMusicGUI();
    drawButtons();
  }//End Draw
  //
  void mousePressed() {
    int num=4;
    if ( mouseX>divs[num] && mouseX<divs[num]+divs[num+2] && mouseY>divs[num+1] && mouseY<divs[num+1]+divs[num+3] ) exit();
    num=8;
    if ( mouseX>divs[num] && mouseX<divs[num]+divs[num+2] && mouseY>divs[num+1] && mouseY<divs[num+1]+divs[num+3] ) musicGUI = varSwitch(musicGUI);
  }// End Mouse Pressed
  //
  void keyPressed() {
    //key=='CAP' || key=='LOWER' //Note" Caps Lock
    //key==CODED || keyCode==ESC //Special Keys
    if (key==CODED || keyCode==ESC) exit();
    if (key=='Q' || key=='q') exit();
    if (key=='M' || key=='m') musicGUI = varSwitch(musicGUI);
  }//End Key Pressed
  //
  Boolean varSwitch(Boolean variable) {
    if ( variable==true ) {
      return variable=false;
    } else {
      return variable=true;
    }
  }//End Boolean Variable Switch
  int boxIndex(int i) {
    return 20 + (i * 4);
  }//end boxIndex

  void setupBoxes() {
    for (int i = 0; i < boxes.length; i++) {
      boxes[i] = boxIndex(i);
    }
  }//end setupboxes

  //------BUTTON SYMBOLS------//
  void basicTriangle(float x, float y, float w, float h, int dir) {
    float dx = w * dir;
    triangle(x, y, x+dx, y+h/2, x, y+h);
  }

  void basicRect(float x, float y, float w, float h) {
    rect(x, y, w, h);
  }
  void xShape(float x, float y, float w, float h) {
    line(x, y, x+w, y+h);
    line(x+w, y, x, y+h);
  }

  //BUTTON SYMBOLS
  void drawPlayButton(float x, float y, float w, float h) {
    basicTriangle(x, y, w, h, 1);
  }//End drawPlayButton

  // PAUSE BUTTON - Two rectangles
  void drawPauseButton(float x, float y, float w, float h) {

    float barW = w * 1/4;
    float gap = w * 3/4;

    basicRect(x, y, barW, h);
    basicRect(x + gap, y, barW, h);
  }//End drawPauseButton

  // REWIND BUTTON - Triangle pointing left with rectangle
  void drawRewindButton(float x, float y, float w, float h) {
    basicTriangle(x + w, y, w * 3/4, h, -1);
    basicRect(x, y, w * 1/4, h);
  }

  // BACKWARD BUTTON - Two triangles pointing left
  void drawBackwardButton(float x, float y, float w, float h) {
    basicTriangle(x + w/2, y, w/2, h, -1);
    basicTriangle(x + w, y, w/2, h, -1);
  }//End drawBackwardButton

  // FORWARD BUTTON - Triangle pointing right with rectangle
  void drawForwardButton(float x, float y, float w, float h) {
    basicTriangle(x, y, w * 3/4, h, 1);
    basicRect( x + w * 3/4, y, w * 1/4, h);
  }//End drawForwardButton

  // SKIP BUTTON - Two triangles pointing right
  void drawSkipButton(float x, float y, float w, float h) {
    basicTriangle(x, y, w/2, h, 1);
    basicTriangle(x + w/2, y, w/2, h, 1);
  }//End drawSkipButton

  // STOP BUTTON - Square
  void drawStopButton(float x, float y, float w, float h) {
    basicRect(x, y, w, h);
  }//End drawStopButton

  // MUTE BUTTON - Square with X
  void drawMuteButton(float x, float y, float w, float h) {
    basicRect(x, y, w, h);
    xShape(x, y, w, h);
  }//End drawMuteButton

  // LOOP BUTTON - Small square with triangle peeking out of corner
  void drawLoopButton(float x, float y, float w, float h) {
    basicRect(x, y, w, h);
    basicTriangle(x + w * 17/20, y + h * 17/20, w * 1/4, h * 1/4, 1);
  }//End drawLoopButton

  // SHUFFLE BUTTON - X with triangles at the ends
  void drawShuffleButton(float x, float y, float w, float h) {
    float a = w * 1/4;
    xShape(x, y, w, h);
    basicTriangle(x+w-a/2, y-a/2, a, a, 1);
    basicTriangle(x+w-a/2, y+h-a/2, a, a, 1);
  }//end shuffle

  // ADD TO QUEUE BUTTON - Four lines with plus sign in corner
  void drawAddToQueueButton(float x, float y, float w, float h) {

    // queue lines
    line(x, y + h * 0.25, x + w * 0.5, y + h * 0.25);
    line(x, y + h * 0.45, x + w * 0.5, y + h * 0.45);

    line(x, y + h * 0.65, x + w, y + h * 0.65);
    line(x, y + h * 0.85, x + w, y + h * 0.85);

    float px = x + w * 3/4;
    float py = y + h * 1/4;

    float s = w * 0.15;

    line(px, py - s, px, py + s);
    line(px - s, py, px + s, py);
  }

  void drawRandomSongButton(float x, float y, float w, float h) {

    float s = w * 0.12;

    circle(x+w*0.2, y+h*0.2, s);
    circle(x+w*0.8, y+h*0.2, s);

    circle(x+w*0.5, y+h*0.5, s);

    circle(x+w*0.2, y+h*0.8, s);
    circle(x+w*0.8, y+h*0.8, s);
  }

  void drawButtons() {
    for (int i = 0; i < boxes.length; i ++) {
      int index = boxes[i];
      fill(255);
      float boxX = divs[index];
      float boxY = divs[index + 1];

      float boxW = divs[index + 2];
      float boxH = divs[index + 3];

      float iconW = smallerDivDimension(boxW);
      float iconH = smallerDivDimension(boxH);

      float shiftX = (boxW - iconW) / 2;
      float shiftY = (boxH - iconH) / 2;

      float x = boxX + shiftX;
      float y = boxY + shiftY;

      rect(boxX, boxY, boxW, boxH);
      fill(255);

      drawSymbol(i, x, y, iconW, iconH);
    }
  }//end drawButtons

  void drawSymbol(int i, float x, float y, float w, float h) {

    if (i == 0) drawBackwardButton(x, y, w, h);
    if (i == 1) drawRewindButton(x, y, w, h);
    if (i == 2) drawPlayButton(x, y, w, h);
    if (i == 3) drawForwardButton(x, y, w, h);
    if (i == 4) drawSkipButton(x, y, w, h);
    if (i == 5) drawMuteButton(x, y, w, h);
    if (i == 6) drawLoopButton(x, y, w, h);
    if (i == 7) drawShuffleButton(x, y, w, h);
    if (i == 8) drawAddToQueueButton(x, y, w, h);
    if (i == 9) drawRandomSongButton(x, y, w, h);
  }//end drawsymbol

  float smallerDivDimension(float divDimension) {
    return divDimension * 1/2;
  }//end smallerDivDimension
  //End button symbols


  void divs() {
    divs[0] = appWidth*1/4 ;
    divs[1] = appHeight*1/4 ;
    divs[2] = appWidth*1/2 ;
    divs[3] = appHeight*1/2 ;

    float referent = divs[2]/13;
    float textWidth = referent*5;
    float textHeight = referent*3;

    float[] column = new float[6];
    column[0] = divs[0]+ referent;
    for (int i = 1; i < column.length; i++) {
      if (i==5) {
        column[i] = column[i-1] + referent* 2;
      } else {
        column[i] = column[i-1] + referent;
      }
    }
    float[] row = new float[4];
    row[0] = divs[1]+ referent;
    for (int i = 1; i<row.length; i++) {
      if (i == 2) {
        row[i] = row[i-1]+ textHeight + referent* 1/2;
      } else {
        row[i] = row[i-1] + referent + referent * 1/2;
      }
    }
    float testHeight = referent*2.5 + textHeight*2;
    float errorIncrease = referent*2;

    while (divs[3] < testHeight) {
      divs[1] -= errorIncrease;
      row[0] = divs[1] + referent;
      row[1] = row[0]  + referent + referent* 1/2;
      row[2] = row[1] + textHeight + referent*1/2;
      row[3] = row[2] + referent + referent*1/2;
      divs[3] += errorIncrease;
    }
    for (int i = 4; i < divs.length; i++) {
      // X Position
      if (i % 4 == 0 && int(i/4) == 1) {
        divs[i] = appWidth - referent;
      } else if (i % 4 == 0 && int(i/4) == 2) {
        divs[i] = appWidth*0;
      } else if (i % 4 == 0 && (int(i/4) >= 3 && int(i/4) <= 5 || int(i/4) == 10 )) {
        divs[i] = column[0];
      } else if (i % 4 == 0 && (int(i/4) == 6 || int(i/4) == 11)) {
        divs[i] = column[1];
      } else if (i % 4 == 0 && (int(i/4) == 7|| int(i/4) == 12)) {
        divs[i] = column[2];
      } else if (i % 4 == 0 && (int(i/4) == 8|| int(i/4) == 13)) {
        divs[i] = column[3];
      } else if (i % 4 == 0 && (int(i/4) == 9 || int(i/4) == 14 )) {
        divs[i] = column[4];
      } else if (i % 4 == 0 && (int(i/4) == 15 || int(i/4) == 16)) {
        divs[i] = column[5];
      } else {
        //Empty Else
      }
      // Y Position
      if (i % 4 == 1 && int(i/4) == 1) {
        divs[i] = appHeight*0;
      } else if (i % 4 == 1 && int(i/4) == 2) {
        divs[i] = appHeight - referent;
      } else if (i % 4 == 1 && (int(i/4) == 3 || int(i/4) == 15)) {
        divs[i] = row[0];
      } else if (i % 4 == 1 && int(i/4) == 4) {
        divs[i] = row[1];
      } else if (i % 4 == 1 && (int(i/4) >= 5 && int(i/4)<= 9)) {
        divs[i] = row[2];
      } else if (i % 4 == 1 && (int(i/4) >= 10 && int(i/4) <= 14)) {
        divs[i] = row[3];
      } else if (i % 4 == 1 && (int(i/4) == 16)) {
        divs[i] = row[2] - referent *1/2;
      } else {
        //Empty Else
      }
      // Width
      if (i % 4 == 2 && (int(i/4) == 3 || int(i/4) == 4 || int(i/4) == 15 ||int(i/4) == 16)) {
        divs[i] = textWidth;
      } else if (i % 4 == 2) {
        divs[i] = referent;
      } else {
        //Empty Else
      }
      // Height
      if (i % 4 == 3 && (int(i/4) == 4|| int(i/4) == 16)) {
        divs[i] = textHeight;
      } else if (i % 4 == 3 && (int(i/4)==15)) {
        divs[i] = textHeight + referent;
      } else if (i % 4 == 3) {
        divs[i] = referent;
      } else {
        //Empty Else
      }
    }
  }//End DIVs

  //
  void seeQuitMusicButton() {
    for ( int j=4; j<9; j+=4 ) {
      rectDIV(divs[j], divs[j+1], divs[j+2], divs[j+3]);
    }
  }//End See Quit & Music Button
  //
  void seeMusicGUI() {
    int j=0;
    rectDIV(divs[j], divs[j+1], divs[j+2], divs[j+3]);
    for ( j=12; j<divs.length; j+=4 ) {
      rectDIV(divs[j], divs[j+1], divs[j+2], divs[j+3]);
    }
  }//End See Music GUI
  //
  void rectDIV( float x, float y, float w, float h) {
    rect(x, y, w, h);
  } //End RECT
  //
  //Getters
  Boolean musicPlayerGUI() {
    return musicGUI;
  }//End Music Player GUI
  //
  //
  //Setters
  //
  //Output - Println
  //Mutliple ERROR statements based on parameters, like Contructors
  void ERRORCheck(String description) {
    println(description);
  }//End
  void ERRORCheck(String description, float variable) {
    println(description, variable);
  }//End
  //
}//End Music Player Class
