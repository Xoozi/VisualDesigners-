float inc = 0.06;
int density = 4;
float xn = 0.0;
float yn = 0.0;
float zn = 0.0;

void setup(){
    size(100, 100);
    noStroke();
}

void draw(){
    xn = 0.0;
    yn = 0.0;

    for(int y = 0; y < height; y +=density){
        for(int x = 0; x < width; x +=density){
            float n = noise(xn, yn, zn) * 256;
            fill(n);
            rect(y, x, density, density);
            xn += inc;
        }
        xn = 0;
        yn += inc;
    }

    zn += inc;
}

