int numLines = 500;
MovingLine[] lines = new MovingLine[numLines];
int cur = 0;

void setup(){
    size(400, 400);
    smooth();
    frameRate(24);
    for(int i = 0; i < numLines; i++){
        lines[i] = new MovingLine();
    }
}


void draw(){
    background(204);
    for(int i = 0; i < cur; i++){
        lines[i].display(); 
    }
}

void mouseDragged(){
    lines[cur].setPoint(mouseX, mouseY,
                        pmouseX, pmouseY);
    if(cur < (numLines - 1)){
        cur ++;
    }
}

class MovingLine{
    float _x, _y, _px, _py;

    void setPoint(int x, int y, int px, int py){
        _x = x;
        _y = y;
        _px= px;
        _py= py;
    }

    void display(){
        _x += random(-0.5, 0.5);
        _y += random(-0.5, 0.5);
        _px+= random(-0.5, 0.5);
        _py+= random(-0.5, 0.5);

        line(_x, _y, _px, _py);
    }
}
