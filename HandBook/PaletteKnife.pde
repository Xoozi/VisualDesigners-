Blade diagonal;


void setup(){
    size(400, 400);
    diagonal = new Blade(30, 80);
}


void draw(){
    if(mousePressed)
        diagonal.grow();
}
void mousePressed(){
    diagonal.seed(mouseX, mouseY);
}
void mouseDragged(){

    diagonal.seed(mouseX, mouseY);
}

class Blade{
    float _x;
    float _y;

    Blade(int x, int y){

        _x = x;
        _y = y;
    }

    void seed(int x, int y){
        _x = x;
        _y = y;
    }

    void grow(){
        _x += 0.5;
        _y -= 1.0;
        point(_x, _y);
    }
}
