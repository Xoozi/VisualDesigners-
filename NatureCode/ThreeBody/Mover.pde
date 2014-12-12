class Mover{
    final float G = 10;
    PVector location;
    PVector velocity;
    PVector acceleration;

    color _color;
    float mass;
    float radius;

    Mover(float loc, float v){
        location = new PVector(random(loc), random(loc));
        velocity = new PVector(random(-v, v), random(-v, v));
        acceleration = new PVector(0, 0);
        mass = random(4.0, 10.0);
        radius = 2 * mass;
        _color = color(random(255), random(255), random(255));
    }

    void update(){

        velocity.add(acceleration);
        location.add(velocity);

        acceleration.mult(0);
    }

    void display(){
        fill(_color);
        ellipse(location.x, location.y, radius, radius);
    }

    void applyForce(PVector force){
        PVector f = PVector.div(force, mass);
        acceleration.add(f);
    }


    PVector attract(Mover m){
        PVector force = PVector.sub(location, m.location);
        float distance = force.mag();
        float strenth = (G * mass * m.mass) / (distance * distance);
        force.normalize();
        force.mult(strenth);

        return force;
    }
}
