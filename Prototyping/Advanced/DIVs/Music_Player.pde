class MusicPlayer {
  //
  //Global Variables
  PApplet app;
  Minim minim;
  float[] divs;
  Boolean musicGUI=false;
  Boolean shuffleOn = false;

  PImage[] images;
  AudioPlayer[] songs;
  AudioMetaData[] songsMetaData;
  int currentIndex = 0;
  String[] songName;
  int playState = 0;
  int loopState = 0;
  int clickCount = 0;
  int lastClickTime = 0;
  int doubleClickDelay = 300; // milliseconds
  color red = #c64239;
  color pink = #f6c2db;
  color purple = #C3B1E1;
  color blue = #aad4dd;
  color green = #8bdaa8;
  color yellow = #FDFD96;
  color orange = #FAC898;
  color grey = #D3D3D3;

  //
  //Constructor & Multiple Constructors (different parameters)
  MusicPlayer() {
  }
  //End Constructor
  //
  MusicPlayer(int numberOfRectangles) {
    this.divs = new float[numberOfRectangles*4];
    divs();
    loadFiles();
  }//End Constructor
  //
  MusicPlayer(int numberOfRectangles, PApplet sketch) {
    this.divs = new float[numberOfRectangles*4];
    app = sketch;
    minim = new Minim(app);
    divs();
    loadFiles();
    loadSettings();
    playCurrentSong();
    setupBoxes();
  }//End Constructor
  //
  void draw() {
    //ERRORCheck("Hello World");
    seeMusicGUI();
    drawButtons();
    autoNextSong();
  }//End Draw
  //
  void mousePressed() {
    int num=4;
    if ( mouseX>divs[num] && mouseX<divs[num]+divs[num+2] && mouseY>divs[num+1] && mouseY<divs[num+1]+divs[num+3] ) exit();
    num=8;
    if ( mouseX>divs[num] && mouseX<divs[num]+divs[num+2] && mouseY>divs[num+1] && mouseY<divs[num+1]+divs[num+3] ) musicGUI = varSwitch(musicGUI);

    for (int i = 0; i < boxes.length; i++) {
      int index = boxes[i];
      if ( mouseX>divs[index] && mouseX<divs[index]+divs[index+2] && mouseY>divs[index+1] && mouseY<divs[index+1]+divs[index+3] ) {
        buttonPressed(i);
      }
    }
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
  int boxIndex(int i) {
    return 20 + (i * 4);
  }//end boxIndex
  //
  //Functions or Behaivours

  void loadFiles() {
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
    for (int i = 0; i < songs.length; i++) {
      songs[i].pause();
      songs[i].rewind();
    }
  }//End StopAllSongs
  //
  void playCurrentSong() {
    stopAllSongs();

    if (playState == 0) {
      songs[currentIndex].play();
    } else if (playState == 1) {
      songs[currentIndex].play();
      songs[currentIndex].pause();
    } else if (playState == 2) {
      songs[currentIndex].pause();
      songs[currentIndex].rewind();
    }
  }//end playcurrentsong

  void autoNextSong() {
    if (songs[currentIndex].position() >= songs[currentIndex].length() - 200) {

      songs[currentIndex].pause();
      songs[currentIndex].rewind();

      currentIndex = (currentIndex + 1) % songs.length;

      songs[currentIndex].play();
      playState = 0;

      saveSettings();
    }
  }//end autoNextSong


  String inspectMetaData() {
    AudioMetaData meta = songsMetaData[currentIndex];
    return
      "Length (in milliseconds): " + meta.length() + "\n"+
      "Author: " + meta.author() +"\n"+
      "Album: " + meta.album() +"\n"+
      "Date: " + meta.date() +"\n"+
      "Comment: " + meta.comment() +"\n"+
      "Lyrics: " + meta.lyrics() +"\n"+
      "Track: " + meta.track()+"\n"+
      "Genre: " + meta.genre() +"\n"+
      "Publisher: " + meta.publisher() +"\n"+
      "Encoded: " + meta.encoded() ;
  }//End inspect meta data
  //

  color getButtonColor(int i) {

    int index = boxIndex(i);

    float x = divs[index];
    float y = divs[index + 1];
    float w = divs[index + 2];
    float h = divs[index + 3];

    boolean hover = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
    boolean pressed = hover && mousePressed;

    if (i == 2) {
      if (playState == 1) return yellow;
      if (playState == 2) return red;
    }

    if (i == 6) {
      if (loopState == 1) return green;
      if (loopState == 2) return red;
    }

    if (pressed) return green;
    if (hover) return blue;

    return grey;
  }
  //
  //
  int[] boxes = new int[10];
  void setupBoxes() {
    for (int i = 0; i < boxes.length; i++) {
      boxes[i] = boxIndex(i);
      ;
    }
  }//end setupboxes

  void buttonPressed(int i) {
    if (i == 0) { // skip back
      songs[currentIndex].skip(-10000);
    }

    if (i == 1) { // rewind
      int now = millis();
      if (now - lastClickTime > doubleClickDelay) {
        clickCount = 0;
      }
      clickCount++;
      lastClickTime = now;
      if (clickCount == 1) {
        songs[currentIndex].rewind();
      } else if (clickCount == 2) {
        currentIndex--;
        if (currentIndex < 0) {
          currentIndex = songs.length - 1;
        }
        saveSettings();
        playCurrentSong();
        clickCount = 0;
      }
    }

    if (i == 2) { // play / pause / stop
      int now = millis();
      if (now - lastClickTime > doubleClickDelay) {
        clickCount = 0;
      }
      clickCount++;
      lastClickTime = now;
      if (clickCount == 1) {
        if (songs[currentIndex].isPlaying()) {
          songs[currentIndex].pause();
          playState = 1;
        } else {
          songs[currentIndex].play();
          playState = 0;
        }
        saveSettings();
      }
      if (clickCount == 2) {//double click
        songs[currentIndex].pause();
        songs[currentIndex].rewind();
        playState = 2;
        clickCount = 0; // reset
      }
      saveSettings();
    }

    if (i == 3) { // next song
      currentIndex = (currentIndex + 1) % songs.length;
      saveSettings();
      playCurrentSong();
    }

    if (i == 4) { // skip forward
      songs[currentIndex].skip(10000);
    }

    if (i == 5) { // mute
      if (songs[currentIndex].isMuted()) {
        songs[currentIndex].unmute();
      } else {
        songs[currentIndex].mute();
      }
    }

    if (i == 6) {// loop
      loopState++;
      if (loopState > 2) {
        loopState = 0;
      }
      saveSettings();
      if (loopState == 0) {
      }
      if (loopState == 1) {
        songs[currentIndex].loop(1); // loop once
      }
      if (loopState == 2) {
        songs[currentIndex].loop(); // infinite loop
      }
    }

    if (i == 7) { // shuffle
      shuffleOn = !shuffleOn;
      if (shuffleOn) {
        currentIndex = int(random(songs.length));
      }
      saveSettings();
      playCurrentSong();
    }

    if (i == 8) {
      println("Playlist button (not set yet)");
    }

    if (i == 9) { // random song
      currentIndex = int(random(songs.length));
      saveSettings();
      playCurrentSong();
    }
  }//end button input
  //
  void saveSettings() {
    String[] settings = {
      str(shuffleOn),
      str(loopState),
      str(currentIndex),
      str(playState)
    };
    saveStrings("setting.txt", settings);
  }//end saveSettings
  //
  void loadSettings() {
    try {
      String[] settings = loadStrings("setting.txt");

      if (settings == null || settings.length < 4) return;

      shuffleOn = settings[0].equals("true");
      loopState = int(settings[1]);
      currentIndex = int(settings[2]);
      playState = int(settings[3]);
    }
    catch (Exception e) {
      println("load failed");
      shuffleOn = false;
      loopState = 0;
      currentIndex = 0;
      playState = 0;
    }
  }//end loadSettings
  //
  //------BUTTON SYMBOLS------//
  void rightTriangle(float x, float y, float w, float h) {
    triangle(x, y, x+w, y+h/2, x, y+h);
  }

  void leftTriangle(float x, float y, float w, float h) {
    triangle(x+w, y, x, y+h/2, x+w, y+h);
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
    rightTriangle(x, y, w, h);
  }//End drawPlayButton

  // PAUSE BUTTON - Two rectangles
  void drawPauseButton(float x, float y, float w, float h) {

    float barW = w * 0.25;
    float gap = w * 0.50;

    basicRect(x, y, barW, h);
    basicRect(x + barW + gap, y, barW, h);
  }//End drawPauseButton

  // REWIND BUTTON - Triangle pointing left with rectangle
  void drawRewindButton(float x, float y, float w, float h) {

    leftTriangle(x + w*0.15, y, w*0.7, h);

    basicRect(x, y, w*0.15, h);
  }

  // BACKWARD BUTTON - Two triangles pointing left
  void drawBackwardButton(float x, float y, float w, float h) {

    leftTriangle(x, y, w/2, h);
    leftTriangle(x + w/2, y, w/2, h);
  }//End drawBackwardButton

  // FORWARD BUTTON - Triangle pointing right with rectangle
  void drawForwardButton(float x, float y, float w, float h) {

    rightTriangle(x, y, w*0.7, h);

    basicRect( x + w*0.72, y, w*0.15, h);
  }//End drawForwardButton

  // SKIP BUTTON - Two triangles pointing right
  void drawSkipButton(float x, float y, float w, float h) {

    rightTriangle(x, y, w/2, h);
    rightTriangle(x + w/2, y, w/2, h);
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

    rightTriangle(x + w*0.75, y + h*0.75, w*0.35, h*0.35);

    fill(0);

    textAlign(CENTER, CENTER);

    if (loopState == 1) {
      text("1", x + w/2, y + h/2);
    } else if (loopState == 2) {
      text("∞", x + w/2, y + h/2);
    }
  }//End drawLoopButton

  // SHUFFLE BUTTON - X with triangles at the ends
  void drawShuffleButton(float x, float y, float w, float h) {

    float a = w * 0.25;
    xShape(x, y, w, h);
    rightTriangle(x+w-a/2, y-a/2, a, a);
    rightTriangle(x+w-a/2, y+h-a/2, a, a);
  }//end shuffle

  // ADD TO QUEUE BUTTON - Four lines with plus sign in corner
  void drawAddToQueueButton(float x, float y, float w, float h) {

    // queue lines
    line(x, y+h*0.2, x+w*0.5, y+h*0.2);
    line(x, y+h*0.4, x+w*0.5, y+h*0.4);

    line(x, y+h*0.6, x+w*0.7, y+h*0.6);
    line(x, y+h*0.8, x+w*0.7, y+h*0.8);

    // plus sign
    float px = x + w*0.75;
    float py = y + h*0.25;

    float s = w*0.15;

    line(px, py-s, px, py+s);
    line(px-s, py, px+s, py);
  }

  // RANDOM SONG BUTTON - Star or Random symbol (dice)
  void drawRandomSongButton(float x, float y, float w, float h) {

    float s = w * 0.12;

    circle(x+w*0.2, y+h*0.2, s);
    circle(x+w*0.8, y+h*0.2, s);

    circle(x+w*0.5, y+h*0.5, s);

    circle(x+w*0.2, y+h*0.8, s);
    circle(x+w*0.8, y+h*0.8, s);
  }

  void drawButtons() {
    int[] boxes = new int[10];
    for (int i = 0; i < boxes.length; i++) {
      boxes[i] = boxIndex(i);
    }
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

      fill(getButtonColor(i));
      rect(boxX, boxY, boxW, boxH);
      fill(255);

      drawSymbol(i, x, y, iconW, iconH);
    }
  }//end drawButtons

  void drawSymbol(int i, float x, float y, float w, float h) {

    if (i == 0) drawBackwardButton(x, y, w, h);
    if (i == 1) drawRewindButton(x, y, w, h);
    if (i == 2) {
      if (playState == 0) {
        drawPlayButton(x, y, w, h);
      } else if (playState == 1) {
        drawPauseButton(x, y, w, h);
      } else if (playState == 2) {
        drawStopButton(x, y, w, h);
      }
    }
    if (i == 3) drawForwardButton(x, y, w, h);
    if (i == 4) drawSkipButton(x, y, w, h);
    if (i == 5) drawMuteButton(x, y, w, h);
    if (i == 6) drawLoopButton(x, y, w, h);
    if (i == 7) {
      if (shuffleOn) {
        fill(green);
      } else {
        fill(255);
      }
      drawShuffleButton(x, y, w, h);
    }
    if (i == 8) drawAddToQueueButton(x, y, w, h);
    if (i == 9) drawRandomSongButton(x, y, w, h);
  }//end drawsymbol

  float smallerDivDimension(float divDimension) {
    return divDimension * 1/2;
  }//end smallerDivDimension


  //End button symbols

  //
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
  
  void fitText(String words, float x, float y, float w, float h){}//end fitText
  
  
  
  
  
  
  
  //
  void drawText() {
    //Fonts Aspect Ratio Images
    float[] fontSize = new float[7];
    PFont font;
    String georgia = "Georgia";
    int box = 12;
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
      if (iWhile>10000) {
        ERRORCheck("Infninte WHILE Loop");
        exit();
      }
      fontSize[2] *= 0.99;
      textFont(font, fontSize[2]);
    }
    textAlign(LEFT, CENTER);
    text(inspectMetaData(), divs[metaData], divs[metaData+1], divs[metaData+2], divs[metaData+3]);
  }//End draww song title
  //
  void seeQuitMusicButton() {
    
    for ( int j=4; j<9; j+=4 ) {

      if (j==4) {
        fill(red);
      } else {
        fill(grey);
      }

      rectDIV(divs[j], divs[j+1], divs[j+2], divs[j+3]);
      fill(255);

      if (j==4) {
        xShape(divs[j], divs[j+1], divs[j+2], divs[j+3]);
      }
      if (j==8) {
        fill(0);
        textAlign(CENTER, CENTER);
        text("Music", divs[j], divs[j+1], divs[j+2], divs[j+3]);
      }
      fill(255);
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
