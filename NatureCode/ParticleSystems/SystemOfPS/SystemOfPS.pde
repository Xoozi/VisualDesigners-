ArrayList<ParticleSystem> systems;

void setup(){
    size(640, 480);
    systems = new ArrayList<ParticleSystem>();
}

void draw(){
    background(255);

    for(ParticleSystem ps: systems){
        ps.run();
    }
}

void mouseReleased(){
    systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}


