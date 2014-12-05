void setup(){
    size(400, 400);
    frameRate(15);
    fill(0);


    noCursor();
}

void draw(){

    float angle = atan2(mouseY, mouseX);
    float deg = degrees(angle);

    background(204);
    ellipse(mouseX, mouseY, 8, 8);
    _textOut(""+deg, mouseX + 15, mouseY, 15);


    rotate(angle);
    line(0, 0, 150, 0);

}

void _textOut(String out, float x, float y, float size){
    float tw = textWidth(out);
    textSize(size);
    fill(0, 102);
    rect(x, y - size, tw, size *1.5);
    fill(204);
    text(out, x, y);
}
