class Attractor{
    final float G = 100.0;
    Ball    ball;
    

    Attractor(float x, float y){
        ball = new Ball(x, y, 50.0, true);
    }

    Vec2 attract(Box box){
        Vec2 pos = ball.body.getWorldCenter();
        Vec2 boxPos = box.body.getWorldCenter();

        Vec2 force = pos.sub(boxPos);
        float dist = force.length();
        dist = constrain(dist, 1, 5);
        force.normalize();

        float strength = (G * 1 * box.body.m_mass) / (dist * dist);
        force.mulLocal(strength);

        return force;
    }

    void display(){
        ball.display();
    }
}
