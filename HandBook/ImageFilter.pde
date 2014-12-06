
void setup(){
    size(100, 100);

    smooth();

    line(0, 0, width, height);
    line(0, height, width, 0);

    PImage p = get();

    p.filter(INVERT);
    PImage right = p.get(50, 0, 50, 100);

    image(right, 50, 0);
}

void draw(){

}

