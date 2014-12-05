float x = 50;
float y = 50;
float offsetX = 0;
float offsetY = 0;
float size = 50;

boolean capture = false;

void setup(){
    size(400, 400);
    background(0);
    cursor(HAND);
}

void draw(){

    background(0);
    rect(x, y, size, size);
}

void mousePressed(){
    if(_checkRect()){
        capture = true;
        offsetX = mouseX - x;
        offsetY = mouseY - y;
        cursor(MOVE);
    }
}

void mouseReleased(){
    if(capture){
        capture = false;
        cursor(HAND);
    }
}

void mouseDragged(){
    if(capture){
        x = mouseX - offsetX;
        y = mouseY - offsetY;
    }
}

boolean _checkRect(){
    if(x < mouseX && mouseX < (x + size)){
        if(y < mouseY && mouseY < (y + size)){
            return true;
        }
    }

    return false;
}
