import java.util.Iterator;

class ParticleSystem{
    ArrayList<Particle> particles;
    PVector origin;
    PVector force;
    Repeller repeller;

    ParticleSystem(PVector location){
        particles = new ArrayList<Particle>();
        origin = location.get();
        force = new PVector(0.0, 0.0);

        repeller = new Repeller(location.x, location.y + 100, 30);
    }

    void addParticle(){
        float flag = random(1.0);
        Particle p;
        if(flag < 0.5){
            p = new Particle(origin);
        }else{
            p = new Confetti(origin);
        }
        particles.add(p);
    }

    //I think my way is better than the book
    void applyForce(PVector f){
        force.add(f); 
    }

    void run(){

        repeller.display();

        Iterator<Particle> it = particles.iterator();
        while(it.hasNext()){
            Particle p = it.next();
            p.applyForce(force);
            p.applyForce(repeller.repel(p));
            p.run();
            if(p.isDead()){
                it.remove();
            }
        }

        force.mult(0);
    }
}


