class Surface{
    ArrayList<Vec2> surface;

    Surface(){
        surface = new ArrayList<Vec2>();
    }

    void addVertex(float x, float y){
        //surface.add(box2d.coordPixelsToWorld(x, y));  
        surface.add(new Vec2(x, y));
    }

    void endVertex(){

        BodyDef bd = new BodyDef();
        bd.type = BodyType.STATIC;
        Body body = box2d.createBody(bd);
    
        ChainShape chain = new ChainShape();
        Vec2[] vertices = new Vec2[surface.size()];
        for(int i = 0; i < surface.size(); i++){
            vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
        }
        chain.createChain(vertices, vertices.length);

        FixtureDef fd = new FixtureDef();
        fd.shape = chain;
        fd.density = 1;
        fd.friction= 0.3;
        fd.restitution=0.5;
        body.createFixture(fd);
    }

    void display(){

        noFill();
        stroke(0);

        beginShape();
        for(Vec2 v: surface){
            vertex(v.x, v.y);
        }
        endShape();
    }
}
