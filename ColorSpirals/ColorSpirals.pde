float angle = 0.0;
float ra = 0.0;
float ga = PI/2;
float ba = PI;
float aa = 0.0;

float dd = 2.0;

void setup(){
    size(480, 480);
    smooth();
    rectMode(CENTER);
    noStroke();
}

void draw(){
    randomSeed(millis());

    translate(240, 240);
    _fill();

    float x = cos(angle) * dd;
    float y = sin(angle) * dd;
    rect(x, y, 4, 4);

    angle += 0.05;
    dd += 0.05;
}

void _fill(){
    float red = map(sin(ra), -1.0, 1.0, 0.0, 255.0);
    float green = map(sin(ga), -1.0, 1.0, 0.0, 255.0);
    float blue = map(sin(ba), -1.0, 1.0, 0.0, 255.0);
    float alpha = map(sin(aa), -1.0, 1.0, 0.0, 255.0);

    fill(red, green, blue, alpha);
    

    ra += random(-0.1, 0.1);
    ga += random(-0.1, 0.1);
    ba += random(-0.1, 0.1);
    alpha += random(-0.1, 0.1);
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
