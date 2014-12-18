class Box{
    Body body;
    float radius;
    boolean deaded;

    Box(float x, float y, float radius){

        deaded = false;
        this.radius = radius;
        BodyDef bd = new BodyDef();
        Vec2 center = box2d.coordPixelsToWorld(x, y);
        bd.type = BodyType.DYNAMIC;
        bd.position.set(center);
        bd.bullet = true;

        body = box2d.createBody(bd);
        body.setLinearVelocity(new Vec2(random(2.0), random(2.0)));
        body.setAngularVelocity(random(2.0));

        PolygonShape ps = new PolygonShape();
        float box2Dw = box2d.scalarPixelsToWorld(radius/2);
        float box2Dh = box2d.scalarPixelsToWorld(radius/2);
        ps.setAsBox(box2Dw, box2Dh);

        FixtureDef fd = new FixtureDef();
        fd.shape = ps;
        fd.friction = 0.3;
        fd.restitution = 0.5;
        fd.density = 1.0;

        body.createFixture(fd);
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

        fill(175);
        stroke(0);
        rectMode(CENTER);
        rect(0, 0, radius, radius);
        popMatrix();

        return true;
    }


    void killBody(){
        box2d.destroyBody(body);
        deaded = true;
    }

}
