int numFrames = 12;
PImage[] images = new PImage[numFrames];
int currentFrame = 0;

void setup(){
   size(240, 120);

    for(int i = 0; i < numFrames; i++){
        String imageName = "frame-" + nf(i, 4) + ".png";
        images[i] = loadImage(imageName);
    }

    frameRate(24);
}


void draw(){
    image(images[currentFrame], 0, 0);

    currentFrame ++;

    if(currentFrame >= numFrames)
        currentFrame = 0;
}
