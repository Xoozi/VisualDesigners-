class Pin extends Box{
    float w;
    float h;
    Pin(float x, float y, float radius){
        super(x, y, radius);
        w = radius;
        h = 3*radius;
        BodyDef bd = new BodyDef();
        Vec2 center = box2d.coordPixelsToWorld(x, y);
        bd.type = BodyType.DYNAMIC;
        bd.position.set(center);
        bd.bullet = true;

        body = box2d.createBody(bd);
        body.setLinearVelocity(new Vec2(random(2.0), random(2.0)));
        body.setAngularVelocity(random(2.0));

        CircleShape cs = new CircleShape();
        Vec2 offset  = new Vec2(0, -h/2);
        offset = box2d.vectorPixelsToWorld(offset);
        cs.m_radius = box2d.scalarPixelsToWorld(radius);
        cs.m_p.set(offset.x, offset.y);


        FixtureDef fd = new FixtureDef();
        fd.shape = cs;
        fd.friction = 0.3;
        fd.restitution = 0.5;
        fd.density = 1.0;
        body.createFixture(fd);

        PolygonShape ps = new PolygonShape();
        float box2dW = box2d.scalarPixelsToWorld(w/2);
        float box2dH = box2d.scalarPixelsToWorld(h/2);
        ps.setAsBox(box2dW, box2dH);
        
        body.createFixture(ps, 1.0);
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
        rect(0, 0, w, h);

        ellipseMode(CENTER);
        fill(100);
        ellipse(0, -h/2, radius*2, radius*2);

        popMatrix();

        return true;
    }

}
