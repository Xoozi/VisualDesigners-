class Boundary{
    Body body;
    float x;
    float y;
    float w;
    float h;

    Boundary(float x, float y, float w, float h){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;

        BodyDef bd = new BodyDef();
        bd.position.set(box2d.coordPixelsToWorld(x, y));
        bd.type = BodyType.STATIC;

        body = box2d.createBody(bd);

        float box2Dw = box2d.scalarPixelsToWorld(w/2);
        float box2Dh = box2d.scalarPixelsToWorld(h/2);
        PolygonShape ps = new PolygonShape();
        ps.setAsBox(box2Dw, box2Dh);

        body.createFixture(ps, 1);
    }

    void display(){

        fill(0);
        stroke(0);
        rectMode(CENTER);
        rect(x, y, w, h);
    }

    void killBody(){
        box2d.destroyBody(body);
    }

}
