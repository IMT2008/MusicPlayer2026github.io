/* DIVs for Music Interface
 */
//
//Libraries
import java.io.File; //Partial & Wild card, *
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

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
  musicPlayer = new MusicPlayer(17, this); //ERROR, Constructor: if undeclared, NullPointerException, like variable
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
