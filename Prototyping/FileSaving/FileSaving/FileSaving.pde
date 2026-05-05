/* Loading Music
 - There are different folders of music
 - Load Multiple PlayLists based on Genre
 - Advanced CS Loads Pong Music and Sound Effect for Game Play
 - OR ... loads regular music or simply uses the app for mediative music
 
 - With Advanced Searches and Read-Write Files, create and search playLists from one folder
 - Last Song Played
 - Random First Song
 - Random Play List
 
 - Example of Shortcutting Boolean AND: mousepressed(), quitDoubleClick==true
 - Example of Background Colouring Buttons and saving colour based on preference, Random Start
 
 */
//Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
import java.io.File;
//
//Global Variables
String saveTxtPath_currentSong; //For Saving Last Known Song Played
String saveTxtPath_randomStart; //For Saving Preference: Random Start
//
Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
//int numberOfSoundEffects = ???
AudioPlayer[] playList; //length of array determined by reading the Music Folder
//AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong; //Reads .txt file to populate last known song
//
Boolean randomStart=false;
//
void setup() {
  // Display
  //fullScreen();
  size(700, 500);
  //
  //
  //Saving Last Known Song Played
  // Initialize the save file path
  saveTxtPath_currentSong = sketchPath("currentSong.txt");
  saveTxtPath_randomStart = sketchPath("randomStart.txt");
  //println(saveTxtPath_currentSong);
  //println(saveTxtPath_randomStart);
  //
  populationSetup();
  //
  musicLoad();
  //
  playList[ currentSong ].play(); //Auto Start Music Player
  //
} //End setup
//
