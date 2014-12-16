class Particle{

    PVector location;
    PVector velocity;
    PVector acceleration;
    float lifespan;
    float mass;

    Particle(PVector l){
        acceleration = new PVector(0, 0.05);

        velocity = new PVector(random(-1, 1), random(-2, 0));
        location = l.get();
        lifespan = 255.0;
        mass = 1.0;
    }

    void run(PImage img){
        if(!isDead()){
            update();
            display(img);
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

    void display(PImage img){
        float aa = atan2(velocity.y, velocity.x);

        pushMatrix();
        translate(location.x, location.y);
        rotate(aa);
        imageMode(CENTER);
        tint(255, lifespan);
        image(img, 0, 0);
        popMatrix();
    }

    boolean isDead(){
        if(lifespan <= 0.0){
            return true;
        }else{
            return false;
        }
    }
}
