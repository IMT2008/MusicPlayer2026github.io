PImage[] images;
int currentIndex = 0;
float displayWidth = 200;

void setup() {
  size(800, 600);
  
  // Load all images from Dependencies/Images/
  images = new PImage[7];
  String[] imageNames = {"Dino.jpg", "DuckBlue.jpg", "DuckGreen.jpg", "DuckLedge.jpg", "DuckSpace.jpg", "DuckSunset.jpg", "Hedgehog.jpg"};
  
  for (int i = 0; i < imageNames.length; i++) {
    images[i] = loadImage("../../../../Dependencies/Images/" + imageNames[i]);
  }
}

void draw() {
  background(255);
  
  float displayHeight = displayWidth * images[currentIndex].height / images[currentIndex].width;
  image(images[currentIndex], 50, 50, displayWidth, displayHeight);
  
  fill(0);
  textSize(16);
  text("Image " + (currentIndex + 1) + " of " + images.length, 50, 250);
  text("Press 'M' to switch images", 50, 280);
}

void keyPressed() {
  if (key == 'm' || key == 'M') {
    currentIndex = (currentIndex + 1) % images.length;
  }
}
