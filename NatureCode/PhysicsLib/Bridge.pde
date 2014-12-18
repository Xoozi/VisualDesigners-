class Bridge{

    float xStart;
    float yStart;
    float xEnd;
    float yEnd;

    float restRate;
    float radius;

    Ancher ancherStart;
    Ancher ancherEnd;
    ArrayList<Section> sections;

    Bridge(float xStart, float yStart, float xEnd, float yEnd, float restRate, float radius){
        this.xStart = xStart;
        this.yStart = yStart;
        this.xEnd = xEnd;
        this.yEnd = yEnd;
        this.restRate = restRate;
        this.radius = radius;

        ancherStart = new Ancher(xStart, yStart, radius);
        ancherEnd = new Ancher(xEnd, yEnd, radius);

        sections = new ArrayList<Section>();
        
        Vec2 start = new Vec2(xStart, yStart);
        Vec2 end = new Vec2(xEnd, yEnd);
        Vec2 dis = end.sub(start);
        float distance = dis.length();
        distance *= restRate;
        int count = (int)(distance / (radius * 2));
        println("distance:"+distance+", radius:"+radius+", count:"+count);
        float djl = 2 * radius * restRate;
        float xrange = abs(xEnd - xStart);
        float xstep = xrange / count;
        Body bodyPre = ancherStart.body;
        for(int i = 0; i < count; i++){
            float x = xStart+ i * xstep;
            float y = yStart;
            Section section = new Section(x, y, radius);
            sections.add(section);
            connect(bodyPre, section.body, djl);

            bodyPre = section.body;
        }

        connect(bodyPre, ancherEnd.body, djl);
    }

    void connect(Body b1, Body b2, float len){

        DistanceJointDef djd = new DistanceJointDef();
        djd.bodyA = b1;
        djd.bodyB = b2;
        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 0;
        djd.dampingRatio= 0;

        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
    }

    void display(){
        ancherStart.display();
        ancherEnd.display();

        for(Section s: sections){
            s.display();
        }
    }


    class Section{

        Body body;
        float radius;

        Section(float x, float y, float radius){

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
    }


    class Ancher{
        
        Body body;
        float radius;

        Ancher(float x, float y, float radius){

            this.radius = radius;
            BodyDef bd = new BodyDef();
            Vec2 center = box2d.coordPixelsToWorld(x, y);
            bd.type = BodyType.STATIC;
            bd.position.set(center);

            body = box2d.createBody(bd);

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

        void display(){
            Vec2 pos = box2d.getBodyPixelCoord(body);

            fill(64);
            stroke(0);
            rectMode(CENTER);
            rect(pos.x, pos.y, radius, radius);
        }
    }
}
