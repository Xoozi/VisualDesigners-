//use fill(0, 4) to make a trail' effect awesome
float angle = 0.0;
float speed = 0.05;

void setup(){
    size(100, 100);
    noStroke();
    smooth();
    fill(255, 180);
}

void draw(){

    background(0);
    _circlePhase(0.0);
    _circlePhase(QUARTER_PI);
    _circlePhase(HALF_PI);
    angle += speed;
}

void _circlePhase(float phase){
    float diameter = 65 + sin(angle + phase) * 45;

    ellipse(50, 50, diameter, diameter);
}
