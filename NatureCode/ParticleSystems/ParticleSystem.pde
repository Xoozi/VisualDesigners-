import java.util.Iterator;

class ParticleSystem{
    ArrayList<Particle> particles;
    PVector origin;

    ParticleSystem(PVector location){
        particles = new ArrayList<Particle>();
        origin = location.get();
    }

    void addParticle(){
        particles.add(new Particle(origin));
    }

    void run(){
        addParticle();

        Iterator<Particle> it = particles.iterator();
        while(it.hasNext()){
            Particle p = it.next();
            p.run();
            if(p.isDead()){
                it.remove();
            }
        }
    }
}


class Particle{

    PVector location;
    PVector velocity;
    PVector acceleration;
    float lifespan;
    color _color;

    Particle(PVector l){
        acceleration = new PVector(0, 0.05);

        velocity = new PVector(random(-1, 1), random(-2, 0));
        location = l.get();
        lifespan = 255.0;
        _color = color(random(255), random(255), random(255));
    }

    void run(){
        if(!isDead()){
            update();
            display();
        }
    }

    void update(){
        velocity.add(acceleration);
        location.add(velocity);
        lifespan -= 1.0;
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
