final float C = 0.001;
Mover[] movers;
int count = 2;
int ggg = 2;
float loc;
float v;

void setup(){
    size(1200, 700);
    smooth();
    ellipseMode(CENTER);

    loc = width / 2;
    v = 0.0;

    movers= new Mover[count];
    for(int i = 0; i < count; i++){
        
        movers[i] = new Mover(loc, v);
    }
}

void draw(){
    fill(0, 16);
    rect(0, 0, width, height);
    

    for(int i = 0; i < count; i++){
        for(int j = 0; j < (count - 1); j ++){
            int next = (i + j + 1) % count;
            PVector attraction= movers[next].attract(movers[i]);
            movers[i].applyForce(attraction);
        }

        movers[i].update();
        movers[i].display();
    }
}

void keyReleased(){
    if('r' == key){
        
        count = ggg;
        movers= new Mover[count];
        for(int i = 0; i < count; i++){
            
            movers[i] = new Mover(loc, v);
        }
    }

    if(CODED == key){
        if(LEFT == keyCode){
            if(ggg > 1){
                ggg -= 1;
            }
        }else if(RIGHT == keyCode){
            ggg += 1;
        }

        if(UP == keyCode){
            v -= 0.1;
        }else if(DOWN == keyCode){
            v += 0.1;
        }

        println("ggg:"+ggg+", v:"+v);
    }

}

