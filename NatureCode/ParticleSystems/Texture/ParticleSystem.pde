import java.util.Iterator;

class ParticleSystem{
    ArrayList<Particle> particles;
    PVector origin;
    PVector force;
    PImage img;

    ParticleSystem(PVector location, PImage img){
        particles = new ArrayList<Particle>();
        origin = location.get();
        force = new PVector(0.0, 0.0);
        this.img = img;
    }

    void addParticle(){
        particles.add(new Particle(origin));
    }

    //I think my way is better than the book
    void applyForce(PVector f){
        force.add(f); 
    }

    void run(){


        Iterator<Particle> it = particles.iterator();
        while(it.hasNext()){
            Particle p = it.next();
            p.applyForce(force);
            p.run(img);
            if(p.isDead()){
                it.remove();
            }
        }

        force.mult(0);
    }
}


