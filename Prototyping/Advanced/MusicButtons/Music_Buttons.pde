/*Note
 - All 12 Music Button Symbols
 */
//global variables
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

void musicSymbol(int index, float divX, float divY, float divDimension ){
  divX = smallerDivDimension(divX, divDimension);
  divY = smallerDivDimension(divY, divDimension);
  divDimension = smallerDivDimension(divDimension);
  
  if(index == 0) drawPlayButton(divX, divY, divDimension);
  else if(index == 1) drawPauseButton(divX, divY, divDimension);
  else if(index == 2) drawRewindButton(divX, divY, divDimension);
  else if(index == 3) drawBackwardButton(divX, divY, divDimension);
  else if(index == 4) drawForwardButton(divX, divY, divDimension);
  else if(index == 5) drawSkipButton(divX, divY, divDimension);
  else if(index == 6) drawStopButton(divX, divY, divDimension);
  else if(index == 7) drawMuteButton(divX, divY, divDimension);
  else if(index == 8) drawLoopButton(divX, divY, divDimension);
  else if(index == 9) drawShuffleButton(divX, divY, divDimension);
  else if(index == 10) drawAddToQueueButton(divX, divY, divDimension);
  else if(index == 11) drawRandomSongButton(divX, divY, divDimension);
}//End musicSymbol

// PLAY BUTTON - Triangle pointing right
void drawPlayButton(float x, float y, float d) {
  triangle(x, y, x+d, y+d/2, x, y+d);
}//End drawPlayButton

// PAUSE BUTTON - Two rectangles
void drawPauseButton(float x, float y, float d) {
  float rectWidth = d/8;
  float rectHeight = 2*d/3;
  
  // First rectangle (left)
  rect(x+d/6, y+d/6, rectWidth, rectHeight);
  // Second rectangle (right)
  rect(x+2*d/3, y+d/6, rectWidth, rectHeight);
}//End drawPauseButton


// REWIND BUTTON - Triangle pointing left with rectangle
void drawRewindButton(float x, float y, float d) {
  triangle(x+d/2, y+d/6, x+d/6, y+d/2, x+d/2, y+5*d/6);
  rect(x+d/6-d/6, y+d/4, d/6, d/2);
}//End drawRewindButton

// BACKWARD BUTTON - Two triangles pointing left
void drawBackwardButton(float x, float y, float d) {
  // First triangle (larger and centered)
  triangle(x+7*d/8, y+d/6, x+d/2, y+d/2, x+7*d/8, y+5*d/6);
  // Second triangle (larger and centered)
  triangle(x+d/2, y+d/6, x+d/8, y+d/2, x+d/2, y+5*d/6);
}//End drawBackwardButton

// FORWARD BUTTON - Triangle pointing right with rectangle
void drawForwardButton(float x, float y, float d) {
  triangle(x+d/6, y+d/6, x+d/2, y+d/2, x+d/6, y+5*d/6);
  rect(x+d/2, y+d/4, d/6, d/2);
}//End drawForwardButton

// SKIP BUTTON - Two triangles pointing right
void drawSkipButton(float x, float y, float d) {
  // First triangle (larger and centered)
  triangle(x+d/8, y+d/6, x+d/2, y+d/2, x+d/8, y+5*d/6);
  // Second triangle (larger and centered)
  triangle(x+d/2, y+d/6, x+7*d/8, y+d/2, x+d/2, y+5*d/6);
}//End drawSkipButton

// STOP BUTTON - Square
void drawStopButton(float x, float y, float d) {
  rect(x, y, d, d);
}//End drawStopButton

// MUTE BUTTON - Square with X
void drawMuteButton(float x, float y, float d) {
  // Draw square
  rect(x, y, d, d);
  
  // X through it
  line(x, y, x+d, y+d);
  line(x+d, y, x, y+d);
}//End drawMuteButton

// LOOP BUTTON - Small square with triangle peeking out of corner
void drawLoopButton(float x, float y, float d) {
  // Draw small square
  float squareSize = 3*d/4;
  rect(x+d/8, y+d/8, squareSize, squareSize);
  
  // Triangle on its side peeking out of bottom-right corner
  triangle(x+d-d/8, y+d-d/8, x+d+d/12, y+d-d/8-d/12, x+d+d/12, y+d-d/8+d/12);
}//End drawLoopButton


// SHUFFLE BUTTON - X with triangles at the ends
void drawShuffleButton(float x, float y, float d) {
  // First line (top-left to bottom-right)
  line(x, y, x+d, y+d);
  // Triangle at bottom-right end (centered)
  triangle(x+d, y+d, x+d-d/10, y+d-d/10, x+d-d/10, y+d+d/10);
  
  // Second line (top-right to bottom-left)
  line(x+d, y, x, y+d);
  // Triangle at top-right end (centered)
  triangle(x+d, y, x+d-d/10, y-d/10, x+d-d/10, y+d/10);
}//End drawShuffleButton


// ADD TO QUEUE BUTTON - Four lines with plus sign in corner
void drawAddToQueueButton(float x, float y, float d) {
  // Four queue lines (top two shorter, bottom two longer)
  line(x, y+d/6, x+d/2, y+d/6);
  line(x, y+d/3, x+d/2, y+d/3);
  line(x, y+d/2, x+2*d/3, y+d/2);
  line(x, y+2*d/3, x+2*d/3, y+2*d/3);
  
  // Mini plus sign in top right corner
  float plusX = x + 3*d/4;
  float plusY = y + d/4;
  float plusSize = d/6;
  
  line(plusX, plusY-plusSize/2, plusX, plusY+plusSize/2);
  line(plusX-plusSize/2, plusY, plusX+plusSize/2, plusY);
}//End drawAddToQueueButton

// RANDOM SONG BUTTON - Star or Random symbol (dice)
void drawRandomSongButton(float x, float y, float d) {
  // Draw a dice symbol with dots
  float dotSize = d/8;
  // Top-left dot
  circle(x+d/6, y+d/6, dotSize);
  // Bottom-right dot
  circle(x+5*d/6, y+5*d/6, dotSize);
  // Center dot
  circle(x+d/2, y+d/2, dotSize);
  // Top-right dot
  circle(x+5*d/6, y+d/6, dotSize);
  // Bottom-left dot
  circle(x+d/6, y+5*d/6, dotSize);
}//End drawRandomSongButton

float smallerDivDimension(float divXY, float divDimension){
  return divXY = divXY + divDimension*1/4;
}

float smallerDivDimension(float divDimension){
  return divDimension = divDimension*1/2;
}
