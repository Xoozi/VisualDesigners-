float x0 = 0.201;
float r = 2.0;

void setup(){
    size(400, 200);

    noLoop();
}

void draw(){
    background(255);
    float y = x0;
    for(int i = 0; i < width; i++){
        y = _logistic(y);
        point(i, height * (1.0 - y));
    }
}

void keyReleased(){
    if(CODED == key){

        if(UP == keyCode){
            r += 0.05;
        }else if(DOWN == keyCode){
            r -= 0.05;
        }

        if(LEFT == keyCode){
            if(x0 >0.01)
                x0 -= 0.01;
        }else if(RIGHT == keyCode){
            if(x0 < 0.99)
                x0 += 0.01;
        }
    }

    redraw();
    println("R="+r+", x0="+x0);
}

float _logistic(float x){

    return r * x * (1.0 - x);
}
