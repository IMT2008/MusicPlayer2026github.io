/* DIVs for Music Interface
 */
//
//Libraries
//
//Classes - Objects
MusicPlayer musicPlayer;
//
// Global Variables
int appWidth, appHeight;
//
//void settings() {}//End Settings
//Note: CANVAS based on DISPLAY, see Intermedate
//
void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  musicPlayer = new MusicPlayer(16); //ERROR, Constructor: if undeclared, NullPointerException, like variable
  musicPlayer.seeQuitMusicButton();

  //musicPlayer.errorStatment("Hello World, second time");
}//End Setup
//
void draw() {
  //
  //Activate Music GUI
  //ErrorCheck("draw() Music GUI set:", musicGUI);
  if ( musicPlayer.musicPlayerGUI()==true ) {
    musicPlayer.draw();
  } else {
    background(0);
  }
  musicPlayer.seeQuitMusicButton();
  //
}//End Draw
//
void keyPressed() {
  musicPlayer.keyPressed();
}//End KeyPressed
//
void mousePressed() {
  musicPlayer.mousePressed();
}//End MousePressed
//
//End DRIVER
