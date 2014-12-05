//use fill(0, 4) to make a trail' effect awesome
float angle = 0.0;
float speed = 0.01;

void setup(){
    size(100, 100);
    noStroke();
    smooth();
}

void draw(){

    background(0);
    angle += speed;

    ellipse(50 + sin(angle + PI) * 5, 25, 30, 30);
    ellipse(50 + sin(angle + HALF_PI) * 5, 55, 30, 30);
    ellipse(50 + sin(angle + QUARTER_PI) * 5, 85, 30, 30);
}

