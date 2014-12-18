class PolyBox extends Box{

    PolyBox(float x, float y, float radius){
        super(x, y, radius);


        PolygonShape ps = new PolygonShape();
        int count = (int)random(3, 8);
        Vec2[] vertices = new Vec2[count];
        float inc = TWO_PI / count;
        float theta = 0.0;
        float vx, vy;
        for(int i = 0; i < vertices.length; i++){
            vx = cos(theta) * radius;
            vy = sin(theta) * radius;
            vertices[i] = box2d.vectorPixelsToWorld(new Vec2(vx, vy));
            theta += inc;
        }
        ps.set(vertices, vertices.length);

        BodyDef bd = new BodyDef();
        bd.type = BodyType.DYNAMIC;
        Vec2 center = new Vec2(x, y);
        bd.position.set(box2d.coordPixelsToWorld(center));
        bd.bullet = true;

        body = box2d.createBody(bd);
        body.setLinearVelocity(new Vec2(random(2.0), random(2.0)));
        body.setAngularVelocity(random(2.0));

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
        Fixture f = body.getFixtureList();
        PolygonShape ps = (PolygonShape)f.getShape();

        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-a);

        fill(175);
        stroke(0);
        
        beginShape();
        int count = ps.getVertexCount();
        for(int i = 0; i < count; i++){
            Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
            vertex(v.x, v.y);
        }
        endShape(CLOSE);

        popMatrix();

        return true;
    }

}
