class Spring{
    PVector ancher;
    float restLength;
    float k;
    float maxLength;
    float minLength;

    Spring(float rest, float k, float stretchRate){
        ancher = new PVector(width/2, 0);
        restLength = rest;
        this.k = k;
        maxLength = restLength * (1.0 + stretchRate);
        minLength = restLength * (1.0 - stretchRate);
    }

    void connect(Bob b){
        PVector force = PVector.sub(b.location, ancher);

        float d = force.mag();
        float stretch = d - restLength;

        force.normalize();
        force.mult(-1 * k * stretch);

        b.applyForce(force);
    }

    void constrainLength(Bob b){
        PVector dir = PVector.sub(b.location, ancher);
        float d = dir.mag();

        if(d < minLength){
            dir.normalize();
            dir.mult(minLength);
            
            //this is a hack
            b.location = PVector.add(ancher, dir);

            //this means a shock stop the bob
            b.velocity.mult(0);
        }else if(d > maxLength){
            dir.normalize();
            dir.mult(maxLength);
            b.location = PVector.add(ancher, dir);
            b.velocity.mult(0);
        }
    }

    void display(){
        fill(100);
        rectMode(CENTER);
        rect(ancher.x, ancher.y, 10, 10);
    }

    void displayLine(Bob b){
        stroke(255);
        line(ancher.x, ancher.y, b.location.x, b.location.y);
    }

}
