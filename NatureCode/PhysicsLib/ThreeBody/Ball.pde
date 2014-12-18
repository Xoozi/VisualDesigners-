class Ball{
    Body body;
    float radius;

    Ball(float x, float y, float radius){

        this.radius = radius;
        BodyDef bd = new BodyDef();
        Vec2 center = box2d.coordPixelsToWorld(x, y);
        bd.type = BodyType.DYNAMIC;
        bd.position.set(center);
        bd.bullet = true;

        body = box2d.createBody(bd);
        body.setLinearVelocity(new Vec2(pmouseX - mouseX, pmouseY - mouseY));
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

    void display(){
        
        Vec2 pos = box2d.getBodyPixelCoord(body);

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
    }

    Vec2 attract(Ball target) {
        float G = 100; // Strength of force
        Vec2 pos = body.getWorldCenter();    
        Vec2 targetPos = target.body.getWorldCenter();

        Vec2 force = pos.sub(targetPos);
        float distance = force.length();

        distance = constrain(distance,1,5);
        force.normalize();
        float strength = (G * 1 * target.body.m_mass) / (distance * distance); 
        force.mulLocal(strength);         
        return force;
    }
    
    void applyForce(Vec2 v) {
        body.applyForce(v, body.getWorldCenter());
    }

}
