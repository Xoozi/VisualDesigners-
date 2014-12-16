ParticleSystem ps;
PVector gravity;
PImage img;
void setup(){
    size(640, 480);
    img = loadImage("text.psd");
    ps = new ParticleSystem(new PVector(width/2, 50), img);
    gravity = new PVector(0, 0.1);

}

void draw(){
    background(100);
    
    ps.applyForce(gravity);
    ps.addParticle();
    ps.run();

    image(img, mouseX, mouseY);
}
