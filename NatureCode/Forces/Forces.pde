final float C = 0.001;
Mover[] moverArray;
//Liquid  liquid;
Attractor attractor;
int count = 0;
PVector windEast;
PVector windWest;

float v = -0.1;
float x = width/4;

void setup(){
    size(1200, 700);
    smooth();
    ellipseMode(CENTER);

    x = width / 4;
    moverArray = new Mover[100];
    count = 50;
    for(int i = 0; i < count; i++){
        
        moverArray[i] = new Mover(x, v);
    }

    windEast= new PVector(-0.01, 0);
    windWest= new PVector(0.01, 0);

    attractor = new Attractor(width/2, height/2, 20);


    //liquid = new Liquid(0, height/4, width, height/4, 0.2, color(32, 32, 255, 64));
}

void draw(){
    fill(0, 16);
    rect(0, 0, width, height);
    
    attractor.display();

    for(int i = 0; i < count; i++){
        
        /*PVector gravity  = new PVector(0, 0.1 * moverArray[i].mass);
        PVector friction = moverArray[i].velocity.get();
        friction.mult(-1);
        friction.normalize();
        friction.mult(C);
        moverArray[i].applyForce(friction);
        moverArray[i].applyForce(gravity);
        

        if(moverArray[i].isInside(liquid)){
            moverArray[i].drag(liquid);
        }
        */

        PVector attraction = attractor.attract(moverArray[i]);

        moverArray[i].applyForce(attraction);

        moverArray[i].update();
        moverArray[i].display();
    }
}

void keyPressed(){
    if(CODED == key){
        if(LEFT == keyCode){
            x -= 1;
        }else if(RIGHT == keyCode){
            x += 1;
        }

        if(UP == keyCode){
            v -= 0.1;
        }else if(DOWN == keyCode){
            v += 0.1;
        }

        println("x:"+x+", v:"+v);
    }

    if('r' == key){
        
        for(int i = 0; i < count; i++){
            
            moverArray[i] = new Mover(x, v);
        }
    }
}
