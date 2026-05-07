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
  color blue = #aad4dd;
  color green = #8bdaa8;

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
    playCurrentSong();
    setupBoxes();
  }//End Constructor
  //
  void draw() {
    //ERRORCheck("Hello World");
    seeMusicGUI();
    buttonHovering();
    drawButtons();
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

  void buttonHovering() {
    int[] button = new int[10];

    for (int i = 0; i < button.length; i++) {
      button[i] = 20 + (i * 4);
      if (isHovering(button[i])) {
        fill(pink);
      } else {
        fill(255);
      }
      rect(divs[button[i]], divs[button[i]+1], divs[button[i]+2], divs[button[i]+3]);
    }
  }//End hovering
  //
  boolean isHovering(int num) {
    return ( mouseX>divs[num] && mouseX<divs[num]+divs[num+2] && mouseY>divs[num+1] && mouseY<divs[num+1]+divs[num+3] );
  }//End isHovering
  //
  int[] boxes = new int[10];
  void setupBoxes() {
    for (int i = 0; i < boxes.length; i++) {
      boxes[i] = 20 + (i * 4);
    }
  }//end setupboxes

  void buttonPressed(int i) {
    if (i == 0) { // skip back
      songs[currentIndex].skip(-10000);
    }
    if (i == 1) { // rewind
      songs[currentIndex].rewind();
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
      }
      if (clickCount == 2) {
        songs[currentIndex].pause();
        songs[currentIndex].rewind();
        clickCount = 0; // reset
        playState = 2;
      }
    }
    if (i == 3) { // next song
      currentIndex = (currentIndex + 1) % songs.length;
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
    if (i == 6) {
      loopState++;
      if (loopState > 2) {
        loopState = 0;
      }
      if (loopState == 0) {
        songs[currentIndex].pause();
        songs[currentIndex].rewind();
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
      if (shuffleOn == true) {
        currentIndex = int(random(songs.length));
      } else {
        currentIndex = (currentIndex + 1) % images.length;
      }
      playCurrentSong();
    }
    if (i == 8) {
      println("Playlist button (not set yet)");
    }
    if (i == 9) { // random song
      currentIndex = int(random(songs.length));
      playCurrentSong();
    }
  }
  //BUTTON SYMBOLS


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
    rect(x, y, d, d);
    float s = d * 0.35;  // size of triangle
    float o = d * 0.15; // overlap amount
    float bx = x + d + o;
    float by = y + d + o;
    triangle(bx - s, by - s, bx, by - s/2, bx - s, by);
    fill(0);
    if (loopState == 1) {
      textAlign(CENTER, CENTER);
      text("1", x + d/2, y + d/2);
    }
    if (loopState == 2) {
      textAlign(CENTER, CENTER);
      text("∞", x + d/2, y + d/2);
    }
  }//End drawLoopButton
  // SHUFFLE BUTTON - X with triangles at the ends
  void drawShuffleButton(float x, float y, float d) {
    // First line (top-left to bottom-right)
    line(x, y, x+d, y+d); // Triangle at bottom-right end (centered)
    triangle(x+d, y+d, x+d-d/5, y+d-d/5, x+d-d/5, y+d+d/5); // Second line (top-right to bottom-left)
    line(x+d, y, x, y+d); // Triangle at top-right end (centered)
    triangle(x+d, y, x+d-d/5, y-d/5, x+d-d/5, y+d/5);
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

  void drawButtons() {
    int[] boxes = new int[10];
    for (int i = 0; i < boxes.length; i++) {
      boxes[i] = 20 + (i * 4);
    }
    for (int i = 0; i < boxes.length; i ++) {
      int index = boxes[i];
      fill(255);
      float boxX = divs[index];
      float boxY = divs[index+1];
      float boxD= divs[index+2];

      float iconD = smallerDivDimension(boxD);
      float shift = (boxD - iconD)/2;
      float x =boxX + shift;
      float y =boxY + shift;

      drawSymbol(i, x, y, iconD);
    }
  }//end drawButtons

  void drawSymbol(int i, float x, float y, float d) {

    if (i == 0) drawBackwardButton(x, y, d);
    if (i == 1) drawRewindButton(x, y, d);
    if (i == 2) {
      if (playState == 0) {
        drawPlayButton(x, y, d);
      } else if (playState == 1) {
        drawPauseButton(x, y, d);
      } else if (playState == 2) {
        drawStopButton(x, y, d);
      }
    }
    if (i == 3) drawForwardButton(x, y, d);
    if (i == 4) drawSkipButton(x, y, d);
    if (i == 5) drawMuteButton(x, y, d);
    if (i == 6) drawLoopButton(x, y, d);
    if (i == 7) drawShuffleButton(x, y, d);
    if (i == 8) drawAddToQueueButton(x, y, d);
    if (i == 9) drawRandomSongButton(x, y, d);
  }//end drawsymbol
  float smallerDivDimension(float divDimension) {
    return divDimension = divDimension*1/2;
  }//div dimension


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
