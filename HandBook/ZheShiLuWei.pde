float inc = 0.0;

void setup(){
    size(100, 100);
    stroke(255, 204);
    smooth();
}

void draw(){

    background(0);

    inc += 0.01;

    float angle = sin(inc)/10.0 + sin(inc*1.2)/20.0;

    _tail(18, 9, angle/1.3);
    _tail(33, 12, angle);
    _tail(44, 10, angle/1.3);
    _tail(62, 5, angle);
    _tail(88, 7, angle*2);
}

void _tail(int x, int units, float angle){
   
    pushMatrix();

    translate(x, 100);
    for(int i = units; i > 0; i--){
        strokeWeight(i);
        line(0, 0, 0, -8);
        translate(0, -8);
        rotate(angle);
    }

    popMatrix();
}
