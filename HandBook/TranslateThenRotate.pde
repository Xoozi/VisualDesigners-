//show the detail of translate then rotate 
void setup(){
    size(100, 100);

    smooth();
    
    _drawCoordinate(#FF0000, 5);
    rect(10, 20, 50, 5);
    
    translate(10, 30);
    _drawCoordinate(#00FF00, 5);
    rect(10, 20, 50, 5);

    rotate(PI/8);
    _drawCoordinate(#0000FF, 5);
    rect(10, 20, 50, 5);
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


