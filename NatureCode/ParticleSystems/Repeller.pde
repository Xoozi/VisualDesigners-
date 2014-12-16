class Repeller{
    final float G = 500;
    PVector location;
    float r;

    Repeller(float x, float y, float r){
        location = new PVector(x, y);
        this.r = r;
    }

    void display(){
        stroke(255);
        fill(255);
        ellipse(location.x, location.y, r * 2, r * 2);
    }

    PVector repel(Particle p){
        PVector dir = PVector.sub(location, p.location);

        float d = dir.mag();
        d = constrain(d, 5, 100);

        dir.normalize();

        float force = -1 * G / (d * d);

        dir.mult(force);

        return dir;
    }

}
