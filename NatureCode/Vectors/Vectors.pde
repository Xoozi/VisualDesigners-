Mover mover;
void setup(){
    size(640, 360);
    
    smooth();

    mover = new Mover();

    noCursor();
}

void draw(){

    fill(255, 1);
    rect(0, 0, width, height);

    mover.update();
    mover.display();

    fill(#FF0000);
    ellipse(mouseX, mouseY, 20, 20);
}

void keyReleased(){
    background(255);
}
