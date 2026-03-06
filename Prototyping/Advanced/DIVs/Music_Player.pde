class MusicPlayer {
  //
  //Global Variables
  float[] divs;
  Boolean musicGUI=false;
  //
  //Constructor & Multiple Constructors (different parameters)
  MusicPlayer() {
  }//End Constructor
  //
  MusicPlayer(int numberOfRectangles) {
    this.divs = new float[numberOfRectangles*4];
    divs();
  }//End Constructor
  //
  void draw() {
    //ERRORCheck("Hello World");
    seeMusicGUI();
  }//End Draw
  void mousePressed() {
    //ERROR Check NUM below
    //int num=8; //ERROR Check i%4=0, int(i/4)=3, num=8
    //println(divs[num], divs[num+1], divs[num+2], divs[num+3]);
    //
    //mouseX>divs[num] && mouseX<divs[num]+divs[num+2] && mouseY>divs[num+1] && mouseY<divs[num+1]+divs[num+3]
    //CAUTION: IF Statements will execute each time
    //Note: easily used with COPY & PASTE
    int num=4;
    if ( mouseX>divs[num] && mouseX<divs[num]+divs[num+2] && mouseY>divs[num+1] && mouseY<divs[num+1]+divs[num+3] ) exit();
    num=8;
    if ( mouseX>divs[num] && mouseX<divs[num]+divs[num+2] && mouseY>divs[num+1] && mouseY<divs[num+1]+divs[num+3] ) musicGUI = varSwitch(musicGUI);
  }// End Mouse Pressed
  void keyPressed() {
    //key=='CAP' || key=='LOWER' //Note" Caps Lock
    //key==CODED || keyCode==ESC //Special Keys
    if (key==CODED || keyCode==ESC) exit();
    if (key=='Q' || key=='q') exit();
    if (key=='M' || key=='m') musicGUI = varSwitch(musicGUI);
  }//End Key Pressed
  Boolean varSwitch(Boolean variable) {
    if ( variable==true ) {
      return variable=false;
    } else {
      return variable=true;
    }
  }//End Boolean Variable Switch
  //
  //Functions or Behaivours
  void divs() {

    divs[0] = appWidth*1/4 ;
    divs[1] = appHeight*1/4 ;
    divs[2] = appWidth*1/2 ;
    divs[3] = appHeight*1/2 ;

    float referent = divs[2]/13;
    float column1 = divs[0] + referent;
    float row1 = divs[1] + referent;
    float textWidth = referent*5;
    float textHeight = referent*3;
    float column2 = column1 + referent;
    float column3 = column2 + referent;
    float column4 = column3 + referent;
    float column5 = column4 + referent;
    float column6 = column5 + referent*2;

    float row2 = row1 + textHeight + referent*1/2;
    float row3 = row2 + referent + referent*1/2;
    float row4 = row3 + referent + referent*1/2;
    float row5 = row4 + referent + referent*1/2;

    
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
