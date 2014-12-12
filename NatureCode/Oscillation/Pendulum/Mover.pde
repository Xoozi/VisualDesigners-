class Mover{
    PVector location;
    PVector velocity;
    PVector acceleration;

    color _color;
    float arm;
    float startAngle; 
    float curAngle;
    float mass;
    float angle = 0.0;
    float aVelocity = 0.0;
    float aAcceleration = 0.0;

    Mover(float arm, float startAngle){
        this.arm = arm;
        this.startAngle = startAngle;
        curAngle = startAngle;
        location = new PVector(0,0);
        location.x = width/2 + sin(this.startAngle) * arm;
        location.y = cos(this.startAngle) * arm;
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

        curAngle = atan2(location.x - width/2, location.y);

        acceleration.mult(0);
    }

    void display(){

        float aa = atan2(velocity.y, velocity.x);
        stroke(0);
        fill(_color);
        rectMode(CENTER);
        pushMatrix();
        translate(location.x, location.y);
        rotate(aa);
        rect(0, 0, mass*32, mass*16);
        popMatrix();

        line(location.x, location.y, width/2, 0);
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
