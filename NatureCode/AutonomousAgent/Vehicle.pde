class Vehicle{
    PVector location;
    PVector velocity;
    PVector acceleration;

    color   _color;
    float mass;
    float r;
    float wandertheta;
    float n;
    float nstep = 0.01;
    float maxforce = 0.05;
    float maxspeed = 2;


    Vehicle(PVector loc, float ms, float mf){
        location = loc.get();
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);

        mass = 1.0;
        wandertheta = 0;
        r = 3.0;
        n = 0;
        _color = color(random(255), random(255), random(255));
        maxforce = mf;
        maxspeed = ms;
    }

    void run(){
        boundaries(50);
        update();
        display();
    }

    void update(){

        velocity.add(acceleration);
        velocity.limit(maxspeed);
        location.add(velocity);

        acceleration.mult(0);
    }

    void display(){
        float theta = velocity.heading() + PI/2;
        fill(_color);
        stroke(0);
        pushMatrix();

        translate(location.x, location.y);
        rotate(theta);

        beginShape();
        vertex(0, -r*2);
        vertex(-r, r*2);
        vertex(r, r*2);
        endShape(CLOSE);

        popMatrix();
    }

    void applyForce(PVector force){
        PVector f = PVector.div(force, mass);
        acceleration.add(f);
    }

    void seek(PVector target){
        
        PVector desired = PVector.sub(target, location);
        desired.normalize();
        desired.mult(maxspeed);

        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxforce);
        applyForce(steer);
    }

    void flee(PVector target){
        
        PVector desired = PVector.sub(target, location);
        desired.normalize();
        desired.mult(-maxspeed);

        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxforce);
        applyForce(steer);
    }

    void arrive(PVector target){
        
        PVector desired = PVector.sub(target, location);
        float d = desired.mag();
        desired.normalize();
        if(d < 100){
            float m = map(d, 0, 100, 0, maxspeed);
            desired.mult(m);
        }else{
            desired.mult(maxspeed);
        }

        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxforce);
        applyForce(steer);
    }

    void wander(){
        float wanderR = 25;
        float wanderD = 80;
        float change = 0.6;
        //wandertheta += random(-change, change);
        change = noise(n) * change - 0.3;
        wandertheta += change;
        n += nstep;

        PVector circleloc = velocity.get();
        circleloc.normalize();
        circleloc.mult(wanderD);
        circleloc.add(location);

        float h = velocity.heading();
        
        PVector circleOffset = new PVector(wanderR*cos(wandertheta+h), wanderR*sin(wandertheta+h));
        PVector target = PVector.add(circleloc, circleOffset);
        seek(target);
        drawWanderStuff(location, circleloc, target, wanderR);
    }

    void boundaries(float d){
        /*
        PVector desired = null;

        if(location.x < d){
            desired = new PVector(maxspeed, velocity.y);
        }else if(location.x > width -d){
            desired = new PVector(-maxspeed, velocity.y);
        }

        if(location.y < d){
            desired = new PVector(velocity.x, maxspeed);
        }else if(location.y > height - d){
            desired = new PVector(velocity.x, -maxspeed);
        }

        if(null != desired){
            desired.normalize();
            desired.mult(maxspeed);
            PVector steer = PVector.sub(desired, velocity);
            steer.limit(maxforce);
            applyForce(steer);
        }*/
        if(location.x < -r)location.x = width+r;
        if(location.y < -r)location.y = height+r;
        if(location.x > width+r)location.x = -r;
        if(location.y > height+r)location.y = -r;
    }

    void follow(FlowField field){
        PVector desired = field.lookup(location);

        desired.mult(maxspeed);

        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxforce);
        applyForce(steer);
    }

    void drawWanderStuff(PVector location, PVector circle, PVector target, float rad){
        stroke(0);
        noFill();
        ellipseMode(CENTER);
        ellipse(circle.x, circle.y, rad*2, rad*2);
        stroke(#FF0000);
        ellipse(target.x, target.y, 4, 4);
        stroke(#00FF00);
        line(location.x, location.y, circle.x, circle.y);
        stroke(#0000FF);
        line(circle.x, circle.y, target.x, target.y);
    }

}
