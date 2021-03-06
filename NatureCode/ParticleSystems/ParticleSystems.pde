ParticleSystem ps;
PVector gravity;

void setup(){
    size(640, 480);
    ps = new ParticleSystem(new PVector(width/2, 50));
    gravity = new PVector(0, 0.1);
}

void draw(){
    background(100);
    
    ps.applyForce(gravity);
    ps.addParticle();
    ps.run();
}
