class Mover{
    PVector location;
    PVector velocity;
    PVector acceleration;

    color _color;
    float mass;
    float angle = 0.0;
    float aVelocity = 0.0;
    float aAcceleration = 0.0;

    Mover(){
        location = new PVector(width, height/2);
        velocity = new PVector(0,0);
        acceleration = new PVector(0, 0);
        mass = random(0.5, 2);
        _color = color(random(255), random(255), random(255));
    }

    void update(){

        velocity.add(acceleration);
        location.add(velocity);
        _constraint();
       
        aAcceleration = acceleration.x / 10.0;
        aVelocity += aAcceleration;
        aVelocity = constrain(aVelocity, -0.1, 0.1);
        angle += aVelocity;

        acceleration.mult(0);
    }

    void display(){

        float aa = atan2(velocity.y, velocity.x);

        stroke(0);
        fill(175, 200);
        rectMode(CENTER);

        pushMatrix();
        translate(location.x, location.y);
        rotate(aa);
        rect(0, 0, mass*32, mass*16);
        popMatrix();
    }

    void applyForce(PVector force){
        PVector f = PVector.div(force, mass);
        acceleration.add(f);
    }


    void _constraint(){
    
        if(location.x > width){
            location.x = 0;
        }else if(location.x < 0){
            location.x = width;
        }

        if(location.y > height){
            location.y = 0;
        }else if(location.y < 0){
            location.y = height;
        }
    }

}
