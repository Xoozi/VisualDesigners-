GL  gl;

void setup(){
    size(640, 480);
    gl = new GL(new PVector(20, 20), 40, 40);
}

void draw(){
    gl.display();
}

void mousePressed(){
    if(LEFT == mouseButton){
        gl.set(mouseX, mouseY);
    }else if(RIGHT == mouseButton){
        gl.erase(mouseX, mouseY);
    }
}


void mouseDragged(){
    if(LEFT == mouseButton){
        gl.set(mouseX, mouseY);
    }else if(RIGHT == mouseButton){
        gl.erase(mouseX, mouseY);
    }
}

void keyReleased(){
    if('r' == key){
        gl.run();
    }
}
