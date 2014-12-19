class Box{
    Body body;
    float radius;
    float w;
    float h;
    boolean deaded;
    boolean fixed;
    boolean change;

    Box(float x, float y, float radius){
        this(x, y, radius, radius, false);
    }

    Box(float x, float y, float radius, boolean fixed){
        this(x, y, radius, radius, fixed);
    }

    Box(float x, float y, float w, float h, boolean fixed){

        change = false;
        deaded = false;
        this.fixed = fixed;
        this.w = w;
        this.h = h;
        this.radius = w;
        BodyDef bd = new BodyDef();
        Vec2 center = box2d.coordPixelsToWorld(x, y);

        if(fixed){
            bd.type = BodyType.STATIC;
        }else{
            bd.type = BodyType.DYNAMIC;
            bd.bullet = true;
        }
        bd.position.set(center);

        body = box2d.createBody(bd);
        body.setLinearVelocity(new Vec2(random(2.0), random(2.0)));
        body.setAngularVelocity(random(2.0));

        PolygonShape ps = new PolygonShape();
        float box2Dw = box2d.scalarPixelsToWorld(w/2);
        float box2Dh = box2d.scalarPixelsToWorld(h/2);
        ps.setAsBox(box2Dw, box2Dh);

        FixtureDef fd = new FixtureDef();
        fd.shape = ps;
        fd.friction = 0.3;
        fd.restitution = 0.5;
        fd.density = 2.0;

        body.createFixture(fd);
        body.setUserData(this);
    }


    boolean display(){
        
        if(deaded){
            return false;
        }
        
        Vec2 pos = box2d.getBodyPixelCoord(body);

        if(pos.y > height + radius){
            
            killBody();
            return false;
        }

        float a = body.getAngle();

        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-a);

        if(change){
            fill(#FF0000);
        }else{
            fill(175);
        }
        stroke(0);
        rectMode(CENTER);
        rect(0, 0, w, h);
        popMatrix();

        return true;
    }


    void killBody(){
        box2d.destroyBody(body);
        deaded = true;
    }

    boolean contains(float x, float y){
        Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
        Fixture f = body.getFixtureList();
        return f.testPoint(worldPoint);
    }

    void change(){
        change = true;
    }

    void reset(){
        change = false;
    }

    void applyForce(Vec2 force){
        Vec2 pos = body.getWorldCenter();
        body.applyForce(force, pos);
    }

}
