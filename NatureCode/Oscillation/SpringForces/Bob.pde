class Bob{
    PVector location;
    PVector velocity;
    PVector acceleration;

    float mass;

    Bob(float x, float y){
        location = new PVector(x, y);
        velocity = new PVector(0,0);
        acceleration = new PVector(0, 0);
        mass = random(0.5, 2);
    }

    void update(){

        velocity.add(acceleration);
        location.add(velocity);
       
        acceleration.mult(0);
    }

    void display(){


        stroke(0);
        fill(64);

        ellipse(location.x, location.y, mass * 10, mass * 10);
    }

    void applyForce(PVector force){
        PVector f = PVector.div(force, mass);
        acceleration.add(f);
    }

}
