class SoftStringPendulum{
    
    ArrayList<VerletParticle2D> springList;
    VerletParticle2D ancher;
    Particle tail;

    SoftStringPendulum(float ancherX, float ancherY, 
            float len, float strength, int count){
        
        springList = new ArrayList<VerletParticle2D>();
       
        ancher = new VerletParticle2D(ancherX, ancherY);
        ancher.lock();
        physics.addParticle(ancher);

        VerletParticle2D pre = ancher; 
        for(int i = 0; i < count; i++){
            VerletParticle2D p = new VerletParticle2D(ancherX, ancherY + len * i);
            connectSpring(pre, p, len, strength);
            springList.add(p);
            physics.addParticle(p);
            pre = p;
        }

        tail = new Particle(new Vec2D(ancherX, ancherY + len * count));
        connectSpring(pre, tail, len, strength);
        physics.addParticle(tail);
        
    }

    void display(){
        stroke(0);

        noFill();

        beginShape();
        vertex(ancher.x, ancher.y);
        for(VerletParticle2D p : springList){
            vertex(p.x, p.y);
        }
        vertex(tail.x, tail.y);
        endShape();

        tail.display();
    }


    void startDrag(float x, float y){
        tail.lock();
        tail.x = x;
        tail.y = y;
    }

    void endDrag(){
        tail.unlock();
    }

    void moveDrag(float x, float y){
        tail.x = x;
        tail.y = y;
    }

    void connectSpring(VerletParticle2D p1, VerletParticle2D p2, float len, float strength){
        VerletSpring2D spring = new VerletSpring2D(p1, p2, len, strength);
        physics.addSpring(spring);
    }

}
