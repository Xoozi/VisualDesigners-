final float G = 0.1;
Bob bob;
Spring spring;
PVector gravity;
float rest;
float k;
float rate;
void setup(){
    size(640, 480);
    smooth();
    
    rest = height/2;
    k = 0.1;
    rate = 0.5;
    bob = new Bob(width * 0.75, height/2);
    spring = new Spring(rest, k, rate);

    gravity = new PVector(0, G * bob.mass);
}


void draw(){
    background(200);

    bob.applyForce(gravity);

    spring.connect(bob);
    spring.constrainLength(bob);

    bob.update();
    spring.display();
    spring.displayLine(bob);
    bob.display();
}

void keyReleased(){

    if('r' == key){

        bob = new Bob(width * 0.75, height/2);
        spring = new Spring(rest, k, rate);

        return;
    }

    if(CODED == key){
        if(UP == keyCode){
            rest -= 10;
        }else if(DOWN == keyCode){
            rest += 10;
        }


        if(LEFT == keyCode){
            if(k > 0.2){
                k -= 0.1; 
            }
        }else if(RIGHT == keyCode){
            k += 0.1;
        }

    }

    if('w' == key){
        if(rate > 0.11)
            rate -= 0.1;
    }else if('s' == key){
        rate += 0.1;
    }

    println("rest:"+rest+", k:"+k+", rate:"+rate);
}
