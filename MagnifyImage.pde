/*

Author: Danielle Kelly

***** This program uses the left and right arrows to control magnification*****

Magnify a section of an image
Control magnification level using the left and right arrows
Control magnified region size using up and down arrows
   
*/

PImage img, magImg;
int regionSize = 200;
final int REGIONDEFAULT = 200;
final int REGIONDELTA = 10;  //Increment for changing regionSize
final int MINREGION = 50, MAXREGION = 300;
float magFactor = 2.0;
final float MAGDEFAULT = 2.0;
final float MAGDELTA = 0.1;  //Modification factor for changing magFactor
final float MAGMIN = 1.5, MAGMAX = 5.0;  //Range for magFactor
String[] fnames = {"us_texas-1839_small.jpg", "maps_future_small.jpg"};
float translateX= 0.0, translateY = 0.0;

void setup() {
  size(600, 600);
  surface.setResizable(true);
  img = loadImage(fnames[0]);
  surface.setSize(img.width, img.height); //set canvas size to image size
  background(0);
  imageMode(CENTER);
}

void draw() {
  image(img, img.width/2, img.height/2);
  noStroke();
  translate(translateX, translateY); 
  magImg = img.get(mouseX, mouseY, regionSize, regionSize);
  magImg.resize(int(magImg.width * magFactor), int(magImg.height * magFactor));
  image(magImg, 0, 0);
}

void mouseMoved() {
  translateX += mouseX - pmouseX;
  translateY += mouseY - pmouseY;
}

void keyPressed() {
  if (key == 'r')
  {
    regionSize = REGIONDEFAULT;
    magFactor = MAGDEFAULT;
  }
  else if (key == CODED) {
    if (keyCode == UP && regionSize <= MAXREGION) {
      regionSize = regionSize += REGIONDELTA; //increase regionSize
    }else if (keyCode == DOWN && regionSize >= MINREGION) {
      regionSize = regionSize  -= REGIONDELTA; //decrease regionSize
    }else if (keyCode == RIGHT && magFactor <= MAGMAX) {
      magFactor = magFactor += MAGDELTA; //increase magnification
    }else if (keyCode == LEFT && magFactor >= MAGMIN) {
      magFactor = magFactor -= MAGDELTA; //decrease magnification
    }  
  } 
}
