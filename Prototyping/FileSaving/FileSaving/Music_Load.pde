minim = new Minim(this);

  String upArrow = "../";
  String musicFolder = "Music/";
  String soundEffectsFolder = "Sound Effects/";
  String dependencies = "Dependencies/";

  //
  String[] songName = new String[numberOfSongs] ;

  //
  String soundEffect1 = "nomagician-ui-button-sound-cancel-back-exit-continue-467877.mp3";
  String fileExtension_mp3 = ".mp3";
  //
  //Directory/Pathway
  String musicDirectory = upArrow + upArrow + upArrow + dependencies + musicFolder;
  String soundEffectDirectory = upArrow + upArrow + upArrow + dependencies + soundEffectsFolder;
  //
  String pathway; // COME BACK
  for (String name : songName) {
    pathway = musicDirectory + name + fileExtension_mp3;
    playList[ currentSong ] = minim.loadFile( pathway );
    playListMetaData[currentSong] = playList[ currentSong ].getMetaData();
    playListMetaData[currentSong] = playList[ currentSong ].fileName();
    currentSong++;
  }
  currentSong = resetDefault(currentSong);
  //
  pathway = soundEffectDirectory + soundEffect1 + fileExtension_mp3;
  soundEffects[currentSong] = minim.loadFile( pathway ); //ERROR: Verify Spelling & Library installed, Sketch / Import Library
  //
  //ERROR Check Music and Sound Effect Variables
  //Thrown by commenting out FILE, playList[] or soundEffects[]
  for ( AudioPlayer song : playList ) {
    if ( song == null ) { //ERROR, play list is NULL
      //See FILE or minim.loadFile
      println("The Play List did not load properly");
      printArray(playList);
      exit();
    }
  }//End Play List ERROR Check
  //
  if ( soundEffects[currentSong]==null ) { //ERROR, play list is NULL
    //See FILE or minim.loadFile
    println("The Sound Effects did not load properly");
    printArray(soundEffects);
    exit();
  }
  //
  //playList[currentSong].play();
  //soundEffects[currentSong].play();
  //
  inspectMetaData( playListMetaData );
  //
}//End Setup
