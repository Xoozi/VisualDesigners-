final int MAX_NECKHEIGHT = 70;
final int MIN_NECKHEIGHT = 16;
final int MAX_BODYHEIGHT = 160;
final int MIN_BODYHEIGHT = 90;
final int HEAD_RADIUS = 45;




void setup(){

    size(720, 480);

    smooth();
    strokeWeight(2);
    ellipseMode(RADIUS);
}

void draw(){


    background(204);

    _drawRobot(120, 420, 110, 140, true);
    _drawRobot(270, 450, 260, 95, false);
    _drawRobot(420, 310, 80, 10, false);
    _drawRobot(570, 390, 180, 40, true);
}

void _drawRobot(int x, int y, int bodyHeight, int neckHeight, boolean tight){

    float ny = y - bodyHeight - neckHeight - HEAD_RADIUS; //Neck Y


    //Neck 
    stroke(102);
    line(x + 2, y - bodyHeight, x + 2, ny);
    line(x + 12, y - bodyHeight, x + 12, ny);
    line(x + 22, y - bodyHeight, x + 22, ny);

    //Antennae
    line(x + 12, ny, x - 18, ny - 43);
    line(x + 12, ny, x + 42, ny - 99);
    line(x + 12, ny, x + 78, ny + 15);

    //Body
    noStroke();
    fill(102);
    ellipse(x, y - 33, 33, 33);                         //Antigravity orb
    fill(0);
    rect(x - 45, y - bodyHeight, 90, bodyHeight - 33);  //Main body
    if(tight){
        fill(240, 20, 20, 180);
    }else {
        fill(20, 240, 20, 180);
    }
    rect(x - 45, y - bodyHeight + 17, 90, 6);           //Gray stripe

    //Head
    fill(0);
    ellipse(x + 12, ny, HEAD_RADIUS, HEAD_RADIUS); //Head
    fill(255);
    ellipse(x + 24, ny - 6, 14, 14);    //Large eye
    fill(0);
    ellipse(x + 24, ny - 6, 3, 3);      //Pupil
    fill(153);
    ellipse(x, ny - 8, 5, 5);           //Small eye 1
    ellipse(x + 30, ny - 26, 4, 4);     //Small eye 2
    ellipse(x + 41, ny + 6, 3, 3);      //Small eye 3
}
