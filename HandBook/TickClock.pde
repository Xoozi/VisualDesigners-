void setup(){
    size(100, 100);
}

void draw(){
    background(0);

    float s = map(second(), 0, 60, 0, 100);
    float m = map(minute(), 0, 60, 0, 100);
    float h = map(hour(), 0, 24, 0, 100);

    stroke(255/2.0);
    line(width/2.0, 0, width/2.0, height);

    stroke(255/4.0);
    line(width/4.0, 0, width/4.0, height);
    line(3.0*width/4.0, 0, 3.0*width/4.0, height);

    stroke(255/8.0);
    line(width/8.0, 0, width/8.0, height);
    line(3.0*width/8.0, 0, 3.0*width/8.0, height);
    line(5.0*width/8.0, 0, 5.0*width/8.0, height);
    line(7.0*width/8.0, 0, 7.0*width/8.0, height);


    stroke(255);
    line(s, 0, s, 33);
    line(m, 34, m, 66);
    line(h, 67, h, 100);
}

