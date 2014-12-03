float angle = 0.0;
float angleDirection = 1;
float speed = 0.005;

void setup(){
    size(120, 120);
    smooth();
}

void draw(){
    background(204);
    
    translate(20, 25);
    rotate(angle);
    strokeWeight(12);
    line(0, 0, 40, 0);

    translate(40, 0);
    rotate(angle * 2.0);
    strokeWeight(6);
    line(0, 0, 30, 0);

    translate(30, 0);
    rotate(angle * 2.5);
    strokeWeight(3);
    line(0, 0, 20, 0);

    angle += speed * angleDirection;

    if(angle > QUARTER_PI || angle < 0){
        angleDirection = -angleDirection;
    }
}


void textOut(String out, float x, float y){
    textOut(out, x, y, 24);
}

void textOut(String out, float x, float y, float size){
    float tw = textWidth(out);
    textSize(size);
    fill(0);
    rect(x, y - size, tw, size *1.5);
    fill(204);
    text(out, x, y);
}
