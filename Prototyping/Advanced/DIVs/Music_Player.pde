class MusicPlayer {
  //
  //Global Variables
  float[] divs;
  Boolean musicGUI=false;

  PImage[] images;
  SoundFile[] songs;
  int currentIndex = 0;

  //
  //Constructor & Multiple Constructors (different parameters)
  MusicPlayer() {
  }//End Constructor
  //
  MusicPlayer(int numberOfRectangles) {
    this.divs = new float[numberOfRectangles*4];
    divs();

    loadImages();
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
    String mainPath = "../../../../Dependencies/";
    String imagePath = mainPath + "Images/";
    String musicPath = mainPath + "Music/";

    File imagefolder = new File(dataPath(imagePath));
    File musicFolder = new File(dataPath(musicPath));
    File[] imageFiles = imagefolder.listFiles();
    File[] musicFiles = musicFolder.listFiles();

    images = new PImage[imageFiles.length];
    //SoundFile[] songs = new SoundFile[musicFiles.length];

    for (int i = 0; i < imageFiles.length; i++) {
      images[i] = loadImage(imagePath + imageFiles[i].getName());
    }
    println("Loaded " + images.length + " images");
  }



  void divs() {
    divs[0] = appWidth*1/4 ;
    divs[1] = appHeight*1/4 ;
    divs[2] = appWidth*1/2 ;
    divs[3] = appHeight*1/2 ;

    float referent = divs[2]/13;
    float column1 = divs[0] + referent;
    float row1 = divs[1] + referent;
    float column2 = column1 + referent;
    float column3 = column2 + referent;
    float column4 = column3 + referent;
    float column5 = column4 + referent;
    float column6 = column5 + referent*2;
    float textWidth = referent*5;
    float textHeight = referent*3;
    float row2 = row1 + referent + referent*1/2;
    float row3 = row2 + textHeight+ referent*1/2;
    float row4 = row3 + referent + referent*1/2;
    float testHeight = referent*2.5 + textHeight*2;
    float errorIncrease = referent*2;

    while (divs[3] < testHeight) {
      divs[1] -= errorIncrease;
      row1 = divs[1] + referent;
      row2 = row1  + referent + referent* 1/2;
      row3 = row2 + textHeight + referent*1/2;
      row4 = row3 + referent + referent*1/2;
      divs[3] += errorIncrease;
    }
    for (int i = 4; i < divs.length; i++) {
      // X Position
      if (i % 4 == 0 && int(i/4) == 1) {
        divs[i] = appWidth - referent;
      } else if (i % 4 == 0 && int(i/4) == 2) {
        divs[i] = appWidth*0;
      } else if (i % 4 == 0 && (int(i/4) >= 3 && int(i/4) <= 5 || int(i/4) == 10 )) {
        divs[i] = column1;
      } else if (i % 4 == 0 && (int(i/4) == 6 || int(i/4) == 11)) {
        divs[i] = column2;
      } else if (i % 4 == 0 && (int(i/4) == 7|| int(i/4) == 12)) {
        divs[i] = column3;
      } else if (i % 4 == 0 && (int(i/4) == 8|| int(i/4) == 13)) {
        divs[i] = column4;
      } else if (i % 4 == 0 && (int(i/4) == 9 || int(i/4) == 14 )) {
        divs[i] = column5;
      } else if (i % 4 == 0 && (int(i/4) == 15 || int(i/4) == 16)) {
        divs[i] = column6;
      } else {
        //Empty Else
      }
      // Y Position
      if (i % 4 == 1 && int(i/4) == 1) {
        divs[i] = appHeight*0;
      } else if (i % 4 == 1 && int(i/4) == 2) {
        divs[i] = appHeight - referent;
      } else if (i % 4 == 1 && (int(i/4) == 3 || int(i/4) == 15)) {
        divs[i] = row1;
      } else if (i % 4 == 1 && int(i/4) == 4) {
        divs[i] = row2;
      } else if (i % 4 == 1 && (int(i/4) >= 5 && int(i/4)<= 9)) {
        divs[i] = row3;
      } else if (i % 4 == 1 && (int(i/4) >= 10 && int(i/4) <= 14)) {
        divs[i] = row4;
      } else if (i % 4 == 1 && (int(i/4) == 16)) {
        divs[i] = row3 - referent *1/2;
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
  void seeQuitMusicButton() {
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
