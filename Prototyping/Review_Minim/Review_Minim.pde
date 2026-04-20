//Review Minim
/* Library Notes
 - File / Sketch / Import Library / Manage Libraries
 - We use Minim for Sound and Sound Effects
 - Able to Google-search libraries to make your project easier
 - Documentation: https://code.compartmental.net/minim/
 - Specific Class: https://code.compartmental.net/minim/audioplayer_class_audioplayer.html
 - Specific Class: https://code.compartmental.net/minim/audiometadata_class_audiometadata.html
 
 ** You are now able to research any Processing-Java Library ... or Any Java Library from the internet **
 - Processing-Java Libraries must be installed into the IDE
 - Java Libraries simply require the 'import' declaration
 
 - Note: Hard Drive Registery or address
 
 - Library will not execute since not using full compiler
 
 */
//Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global variables
Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
int numberOfSoundEffects = 1; //Best Practice
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects];
int currentSong = numberOfSongs - numberOfSongs; //ZERO, Math Property
//
//Display
void setup() {
  fullScreen();
  int appHeight = height;
  int appWidth = width;
  //
  //Folders/ MusicLoading
  minim = new Minim(this);
  String upArrow = "../";
  String dependencies = "/Dependencies/";
  String musicFolder = "Music/";
  String soundEffectsFolder = "Sound Effects/";
  String songName1 = "Song1.mp3";
  String soundEffect1 = "nomagician-ui-button-sound-cancel-back-exit-continue-467877.mp3";

  String musicDirectory = upArrow + upArrow + upArrow + dependencies + musicFolder;
  String soundEffectDirectory = upArrow + upArrow + upArrow + dependencies + soundEffectsFolder;
  String pathway = musicDirectory + songName1;
  playList[ currentSong ] = minim.loadFile( pathway );
  pathway = soundEffectDirectory + soundEffect1;
  soundEffects[currentSong] = minim.loadFile( pathway ); //ERROR: Verify Spelling & Library installed, Sketch / Import Library


  //
  //ERROR Check Music and Sound Effect Variables
  //Thrown by commenting out FILE, playList[] or soundEffects[]
  if ( playList[currentSong]==null || soundEffects[currentSong]==null) { //ERROR, play list is NULL
    //See FILE or minim.loadFile
    println("The Play List or Sound Effects did not load properly");
    printArray(playList);
    printArray(soundEffects);
    /*
  println("Music Pathway", musicDirectory);
     println("Full Music File Pathway", file);
     */
  } else {
    //playList[currentSong].play();
    soundEffects[currentSong].play();
    //
    printArray(playList);
    printArray(soundEffects);
  }
}//End Setup
//
void draw() {
}//End Draw
//
