class MusicPlayer {
  //
  //Global Variables
  PApplet app;
  Minim minim;
  float[] divs;
  Boolean musicGUI=false;

  PImage[] images;
  AudioPlayer[] songs;
  AudioMetaData[] songsMetaData;
  int currentIndex = 0;
  String[] songName;

  //
  //Constructor & Multiple Constructors (different parameters)
  MusicPlayer() {
  }
  //End Constructor
  //
  MusicPlayer(int numberOfRectangles) {
    this.divs = new float[numberOfRectangles*4];
    divs();
    loadImages();
  }//End Constructor
  //
  MusicPlayer(int numberOfRectangles, PApplet sketch) {
    this.divs = new float[numberOfRectangles*4];
    app = sketch;
    minim = new Minim(app);
    divs();
    loadImages();
    playCurrentSong();
  }//End Constructor
  //
  void draw() {
    //ERRORCheck("Hello World");
    seeMusicGUI();
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
    if (key == 'I' || key == 'i') {
      currentIndex = (currentIndex + 1) % images.length;
      playCurrentSong();
    }
  }//End Key Pressed
  //
  Boolean varSwitch(Boolean variable) {
    if ( variable==true ) {
      return variable=false;
    } else {
      return variable=true;
    }
  }//End Boolean Variable Switch
  //
  //Functions or Behaivours

  void loadImages() {
    String upArrow = "../";
    String musicFolder = "Music/";
    String imageFolder = "Images/";
    String dependencies = "Dependencies/";
    String musicDirectory = upArrow + upArrow + upArrow + dependencies + musicFolder;
    String imageDirectory = upArrow + upArrow + upArrow + dependencies + imageFolder;

    File imagefolder = new File(sketchPath(imageDirectory));
    File musicfolder = new File(sketchPath(musicDirectory));
    File[] imageFiles = imagefolder.listFiles();
    File[] musicFiles = musicfolder.listFiles();

    images = new PImage[imageFiles.length];
    songs = new AudioPlayer[musicFiles.length];
    songsMetaData = new AudioMetaData[musicFiles.length];
    songName = new String[musicFiles.length];

    if (imageFiles.length != musicFiles.length) {
      ERRORCheck("ERROR: Image and Music count don't match!");
      ERRORCheck("Images:", imageFiles.length);
      ERRORCheck("Songs:", musicFiles.length);
      exit();
    } else {
      for (int i = 0; i < imageFiles.length; i++) {
        images[i] = loadImage(imageDirectory + imageFiles[i].getName());
        songs[i] = minim.loadFile( musicDirectory + musicFiles[i].getName());
        songsMetaData[i] = songs[i].getMetaData();
        songName[i] = musicFiles[i].getName();
      }
      println("Loaded: " + images.length + " images");
      println("Loaded: " + songs.length + " songs");
      println("Loaded: " + songName.length + " song names");
    }//End Load Images
  }

  void stopAllSongs() {
    for (int i = 0; i< songs.length; i++) {
      songs[i].pause();
      songs[i].rewind();
    }
  }//End StopAllSongs
  //
  void playCurrentSong() {
    stopAllSongs();
    songs[currentIndex].play();
  }//End playCurrentSong

  String inspectMetaData() {
    AudioMetaData meta = songsMetaData[currentIndex];
    return
      "File Name: " + meta.fileName() + "\n"+
      "Length (in milliseconds): " + meta.length() + "\n"+
      "Title: " + meta.title() +"\n"+
      "Author: " + meta.author() +"\n"+
      "Album: " + meta.album() +"\n"+
      "Date: " + meta.date() +"\n"+
      "Comment: " + meta.comment() +"\n"+
      "Lyrics: " + meta.lyrics() +"\n"+
      "Track: " + meta.track()+"\n"+
      "Genre: " + meta.genre() +"\n"+
      "Copyright: " + meta.copyright() +"\n"+
      "Disc: " + meta.disc() +"\n"+
      "Composer: " + meta.composer() +"\n"+
      "Orchestra: " + meta.orchestra() +"\n"+
      "Publisher: " + meta.publisher() +"\n"+
      "Encoded: " + meta.encoded() ;
  }//End inspect meta data

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

  void drawImage() {
    //Aspect ratio Images
    int imageNum = 16;
    if (images != null && images.length > 0) {
      float imgWidth = divs[imageNum+2];
      float imgHeight = imgWidth * images[currentIndex].height / images[currentIndex].width;

      if (imgHeight > divs[imageNum+3]) {
        imgHeight = divs[imageNum+3];
        imgWidth = imgHeight * images[currentIndex].width / images[currentIndex].height;
      }
      image(images[currentIndex], divs[imageNum], divs[imageNum+1], imgWidth, imgHeight);
    }
  }//End draw Image

  void drawText() {
    //Fonts Aspect Ratio Images
    int box = 12;
    float[] fontSize = new float[7];
    PFont font;
    String georgia = "Georgia";
    int iWhile=0;

    fontSize[1] = divs[box+3];
    font = createFont(georgia, fontSize[1]);
    textFont(font, fontSize[1]);

    while ( textWidth(songName[currentIndex]) > divs[box+2]) {
      iWhile++;
      if ( iWhile>10000 ) {
        ERRORCheck("Infninte WHILE Loop");
        exit();
      }
      fontSize[1] *= 0.99;
      textFont(font, fontSize[1]);
    }
    fill(0);
    textAlign(CENTER, CENTER);
    text(songName[currentIndex], divs[box], divs[box+1], divs[box+2], divs[box+3]);
    //
    //song meta data
    int metaData = 60;
    fontSize[2] = divs[metaData+3];
    while (textWidth(inspectMetaData()) > divs[metaData+2]) {
      iWhile++;
      if ( iWhile>10000 ) {
        ERRORCheck("Infninte WHILE Loop");
        exit();
      }
      fontSize[2] *= 0.99;
      textFont(font, fontSize[2]);
    }
    textAlign(LEFT, CENTER);
    String meta = "MetaData: " + "\n";
    text(meta + inspectMetaData(), divs[metaData], divs[metaData+1], divs[metaData+2], divs[metaData+3]);
  }//End draww song title


  //
  void seeQuitMusicButton() {
    fill(255);
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
    drawImage();//images
    drawText();//song title + meta data
    //
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
