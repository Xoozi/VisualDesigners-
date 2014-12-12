Mover mover;
Oscillator oscillator;
PVector eastWind;
PVector westWind;
PVector northWind;
PVector southWind;

void setup(){
    size(1200, 700);
    smooth();

    mover = new Mover();

    eastWind = new PVector(-0.5, 0);
    westWind = new PVector(0.5, 0);
    northWind= new PVector(0, 0.5);
    southWind= new PVector(0, -0.5);

    oscillator = new Oscillator();
}

void draw(){
    fill(255, 16);
    rectMode(CORNER);
    rect(0, 0, width, height);
    
    mover.update();
    mover.display();

    oscillator.oscillate();
    oscillator.display();
}

void keyPressed(){
    if(CODED == key){
        if(LEFT == keyCode){
            mover.applyForce(eastWind);
        }else if(RIGHT == keyCode){
            mover.applyForce(westWind);
        }
        
        if(UP == keyCode){
            mover.applyForce(southWind);
        }else if(DOWN == keyCode){
            mover.applyForce(northWind);
        }
    }

    if('r' == key){
        mover = new Mover();
        oscillator = new Oscillator();
    }
}
