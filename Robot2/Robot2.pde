void setup(){

    int x = 60;             //x-position
    int y = 420;            //y-position
    int bodyHeight = 110;   //Body Heidht
    int neckHeight = 140;   //Neck Height
    int radius = 45;        //Head Radius
    int ny = y - bodyHeight - neckHeight - radius; //Neck Y

    size(170, 480);

    smooth();
    strokeWeight(2);
    background(204);
    ellipseMode(RADIUS);

    //Neck 
    stroke(102);
    line(x + 2, y - bodyHeight, x + 2, 162);
    line(x + 12, y - bodyHeight, x + 12, 162);
    line(x + 22, y - bodyHeight, x + 22, 162);

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
    fill(102);
    rect(x - 45, y - bodyHeight + 17, 90, 6);           //Gray stripe

    //Head
    fill(0);
    ellipse(x + 12, ny, radius, radius);//Head
    fill(255);
    ellipse(x + 24, ny - 6, 14, 14);    //Large eye
    fill(0);
    ellipse(x + 24, ny - 6, 3, 3);      //Pupil
    fill(153);
    ellipse(x, ny - 8, 5, 5);           //Small eye 1
    ellipse(x + 30, ny - 26, 4, 4);     //Small eye 2
    ellipse(x + 41, ny + 6, 3, 3);      //Small eye 3

    fill(255, 0, 0);
    ellipse(x, y, 20, 20);
}
