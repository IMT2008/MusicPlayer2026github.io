/* DIVs in Procedural VOICE
 
 -TBA
 
 */
//
//Libraries - Minim
//
//Global variables
int appWidth, appHeight;
//
void settings() {
  println(displayWidth, displayHeight);
  int shorterSide = (displayWidth > displayHeight) ? displayHeight : displayWidth;
  shorterSide *= 0.9; //90% of the orginal
    size(shorterSide,shorterSide); //ERROR IllegalStatic Exception: cannot use var in size()
    println("Display Question", displayWidth, displayHeight, shorterSide);
    println("CANVAS Size Key variables for setup()", width, height);
}//End Settings
//
void setup() {
  //int shorterSide = 1080;
  /*
  println(displayWidth, displayHeight);
  //size(600, 400); //width, height
  fullScreen();
  appWidth = displayWidth; //Best Practice
  appHeight = displayHeight;
  */
}//End Setup
//
void draw() {
}//End Draw
//
void mousePressed() {
}// End Mouse Pressed
//
void keyPressed() {
}// End Key Pressed
//
//End MAIN Program
