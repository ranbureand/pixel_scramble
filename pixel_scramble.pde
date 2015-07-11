PImage input; // input image
int counter = 0;
String fileName; // image file name

void setup() {
  size(displayWidth, displayHeight);
  selectInput("Select an image file (.png, .jpg, .gif) to process:", "selectFile");
}

void draw() {
  background(255);
  if(input != null) {
    image(input, (displayWidth/2 - input.width/2), (displayHeight/2 - input.height/2));
  }
}

/*
 * Select an image.
 */

void selectFile(File selection) {
  if (selection == null) {
    println("No image file has been selected.");
  } else {
    input = loadImage(selection.getAbsolutePath());
    println(selection.getAbsolutePath() + " has been selected.");
  }
}

/*
 * Generate a new image scrambling the pixels of the selected one.
 */

void mouseClicked() {
  image(input, (displayWidth/2 - input.width/2), (displayHeight/2 - input.height/2));
  input.loadPixels();
  
  for (int area = input.height*input.width; area > 1; area--) {
    int random = int(random(area));
    int h = input.pixels[random];
    
    input.pixels[random] = input.pixels[area-1];
    input.pixels[area-1] = h;
  }
  
  input.updatePixels();
}

/*
 * Save the new image as a .png.
 */

void keyPressed() {
  if(key == RETURN || key == ENTER) {
    fileName= "image_" + counter;
    input.save("outputs/" + fileName + ".png");
    println(fileName + " has been saved successfully.");
    counter++;
  }
}

/*
 * Go full screen.
 */

boolean sketchFullScreen() {
  return true;
}
