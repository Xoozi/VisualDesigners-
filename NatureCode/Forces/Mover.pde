class Mover{
    PVector location;
    PVector velocity;
    PVector acceleration;

    color _color;
    float mass;
    float radius;

    Mover(float x, float v){
        location = new PVector(x+random(-width/10, width/10), height/2);
        velocity = new PVector(0, v);
        acceleration = new PVector(0, 0);
        mass = random(1.0, 10.0);
        radius = 2 * mass;
        _color = color(random(255), random(255), random(255));
    }

    void update(){

        velocity.add(acceleration);
        location.add(velocity);
        _constraint();

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

    void drag(Liquid l){
        float speed = velocity.mag();
        float dragMagnitude = l.c * speed * speed;

        PVector drag = velocity.get();
        drag.mult(-1);
        drag.normalize();
        drag.mult(dragMagnitude);

        applyForce(drag);
    }

    boolean isInside(Liquid l){
        if(location.x > l.x && location.x < (l.x + l.w) &&
            location.y > l.y && location.y < (l.y + l.h)){
            return true;
        }else{
            return false;
        }
    }

    void _constraint(){
    /*
        if(location.x > (width - radius/2)){
            location.x = width - radius/2;
            velocity.x *= -0.95;
        }else if(location.x < radius/2){
            location.x = radius/2;
            velocity.x *= -0.95;
        }

        if(location.y > (height - radius/2)){
            location.y = height - radius/2;
            velocity.y *= -0.95;
        }
        */
    }

    void _limit(float max){
        if(velocity.mag() > max){
            velocity.normalize();
            velocity.mult(max);
        }
    }

}
