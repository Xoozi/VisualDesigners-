class Ball extends Box{

    Ball(float x, float y, float radius){
        super(x, y, radius);
        this.radius = radius;
        BodyDef bd = new BodyDef();
        Vec2 center = box2d.coordPixelsToWorld(x, y);
        bd.type = BodyType.DYNAMIC;
        bd.position.set(center);
        bd.bullet = true;

        body = box2d.createBody(bd);
        body.setLinearVelocity(new Vec2(random(2.0), random(2.0)));
        body.setAngularVelocity(random(2.0));

        CircleShape cs = new CircleShape();
        cs.m_radius = box2d.scalarPixelsToWorld(radius);

        FixtureDef fd = new FixtureDef();
        fd.shape = cs;
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
        
        ellipseMode(CENTER);
        ellipse(0, 0, radius*2, radius*2);
        line(0, 0, radius, 0);

        popMatrix();

        return true;
    }

}
