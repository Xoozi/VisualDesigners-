class Attractor{
    final float G = 10;
    PVector location;
    float mass;

    Attractor(float x, float y, float mass){
        location = new PVector(x, y);
        this.mass = mass;
    }

    void display(){
        stroke(0);
        fill(#FF0000);
        ellipse(location.x, location.y, mass*2, mass*2);
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
