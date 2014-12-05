//show the detail of translate then scale
void setup(){
    size(100, 100);
    background(255);

    noFill();
    smooth();
    
    _drawCoordinate(#0000FF, 5);
    ellipse(40, 40, 60, 60);
    
    translate(10, 30);
    _drawCoordinate(#00FF00, 5);
    ellipse(40, 40, 60, 60);

    scale(1.5);
    _drawCoordinate(#FF0000, 5);
    ellipse(40, 40, 60, 60);
}

void draw(){
}

void _drawCoordinate(color c, int step){

    stroke(c);
    for(int x = 0; x < width; x += step){
        line(x, 0, x, height);
    }

    for(int y = 0; y < height; y += step){
        line(0, y, width, y);
    }
}


