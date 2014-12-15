ParticleSystem ps;

void setup(){
    size(640, 480);
    ps = new ParticleSystem(new PVector(width/2, 50));
}

void draw(){
    background(255);

    ps.run();
}
