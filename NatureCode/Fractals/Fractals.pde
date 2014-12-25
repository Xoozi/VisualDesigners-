//CircleRecur cr;
//CantorSet cs;

/*Wtf wtf;
float x,y,len;
float theta;
float step;*/

//KochCurve kc;
Tree tree;
float rate = 2.0;
float theta = PI/6;
void setup(){
    
    size(640, 480);
    
    //cr = new CircleRecur();
    //cs = new CantorSet();
    /*wtf = new Wtf();
    x = width/2;
    y = height/2;
    len = (width+height)/4;
    theta = 0.0;
    step = 0.01;*/

    //kc = new KochCurve();

    tree = new Tree(rate, theta);
}

void draw(){
    background(255);

    //cr.drawCircle(width/2, height/2, 300);

    /*strokeWeight(10);
    stroke(0);
    strokeCap(SQUARE);
    cs.cantor(50, 50, 540);*/

    /*stroke(0);
    strokeWeight(1);
    strokeCap(SQUARE);

    wtf.drawWtf(x, y, len + noise(theta) * 10);
    theta+=step;*/

    //kc.drawKC(new PVector(0, height/2), new PVector(width, height/2)); 
    //kc.drawSnowFlake(new PVector(width/2, height/2), height/2);

    stroke(0);
    tree.drawTree2(new PVector(width/2, height), new PVector(width/2, height/3 * 2));

    noLoop();
}


void keyPressed(){
    if('w' == key){
        rate += 0.01;
    }else if('s' == key){
        rate -= 0.01;
    }


    if('a' == key){
        theta -= 0.01;
    }else if('d' == key){
        theta += 0.01;
    }
    tree = new Tree(rate, theta);
    loop();
    println("rate:"+rate+", theta:"+theta);
}
