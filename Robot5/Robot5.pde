final int MAX_NECKHEIGHT = 70;
final int MIN_NECKHEIGHT = 16;
final int MAX_BODYHEIGHT = 160;
final int MIN_BODYHEIGHT = 90;

int x = 60;             //x-position
int y = 440;            //y-position
int bodyHeight = 160;   //Body Heidht
int neckHeight = 70;   //Neck Height
int radius = 45;        //Head Radius
float easing = 0.01;

boolean tight = false;
boolean loose = true;


void setup(){

    size(360, 480);

    smooth();
    strokeWeight(2);
    ellipseMode(RADIUS);
}

void draw(){

    x += random(-4, 4);
    x += random(-1, 1);

    if(mousePressed){
        if(neckHeight > MIN_NECKHEIGHT)
            neckHeight --;
        if(bodyHeight > MIN_BODYHEIGHT){
            bodyHeight --;
            tight = false;
            loose = false;
        }else{
            tight = true;
        }
    }else{
        if(neckHeight < MAX_NECKHEIGHT)
            neckHeight ++;
        if(bodyHeight < MAX_BODYHEIGHT){
            bodyHeight ++;
            loose = false;
            tight = false;
        }else{
            loose = true;
        }
    }

    float ny = y - bodyHeight - neckHeight - radius; //Neck Y

    background(204);

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
    }else if(loose){
        fill(20, 240, 20, 180);
    }else{
        fill(102);
    }
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

}
