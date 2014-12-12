float angle = 0;
float aVelocity = 0.2;
float amplitude = 100;

void setup(){
    size(400, 200);
}


void draw(){
    background(255);

    angle = 0;

    stroke(0);
    fill(0, 50);
    for(int x = 0; x <= width; x +=4){
        float y = map(sin(angle), -1, 1, 0, height);
        float offset = noise(x) * height / 4;
        ellipse(x, y + offset, 48, 48);    
        angle += aVelocity;
    }
}

