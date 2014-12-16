class Particle{

    PVector location;
    PVector velocity;
    PVector acceleration;
    float lifespan;
    float mass;
    color _color;

    Particle(PVector l){
        acceleration = new PVector(0, 0.05);

        velocity = new PVector(random(-1, 1), random(-2, 0));
        location = l.get();
        lifespan = 255.0;
        mass = 1.0;
        _color = color(random(255), random(255), random(255));
    }

    void run(){
        if(!isDead()){
            update();
            display();
        }
    }

    void applyForce(PVector force){
        PVector f = force.get();
        f.div(mass);
        acceleration.add(f);
    }

    void update(){
        velocity.add(acceleration);
        location.add(velocity);
        acceleration.mult(0);
        lifespan -= 2.0;
    }

    void display(){
        stroke(0, lifespan);
        fill(_color, lifespan);
        ellipse(location.x, location.y, 8, 8);
    }

    boolean isDead(){
        if(lifespan <= 0.0){
            return true;
        }else{
            return false;
        }
    }
}
