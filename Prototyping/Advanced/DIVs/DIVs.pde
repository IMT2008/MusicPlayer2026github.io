/* DIVs for music Interface
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
  musicPlayer = new MusicPlayer(14); //ERROR, Constructor: if undeclared, NullPointerException, like variable
  //musicPlayer.draw();
  //musicPlayer.errorStatement("Hello World, second time");
  musicPlayer.divsArray();
  appWidth = displayWidth; //Best Practice
  appHeight = displayHeight;
}//End Setup
//
void draw() {}//End Draw
//
void keyPressed() {}//End KeyPressed
//
void mousePressed() {}//End MousePressed
//
//End DRIVER
