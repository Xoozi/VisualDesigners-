class Spring{
    MouseJoint mj;

    Spring(){
        mj = null;
    }


    void update(float x, float y){
        if(null != mj){
            Vec2 mp = box2d.coordPixelsToWorld(x, y);
            mj.setTarget(mp);
        }
    }

    void display(){
        if(null == mj){
            return;
        }

        Vec2 v1 = new Vec2(0, 0);
        mj.getAnchorA(v1);
        Vec2 v2 = new Vec2(0, 0);
        mj.getAnchorB(v2);

        v1 = box2d.coordWorldToPixels(v1);
        v2 = box2d.coordWorldToPixels(v2);


        stroke(#FF0000);
        line(v1.x, v1.y, v2.x, v2.y);
    }

    void attach(float x, float y, Box box){
        
        MouseJointDef md = new MouseJointDef();

        md.bodyA = box2d.getGroundBody();
        md.bodyB = box.body;

        Vec2 mp = box2d.coordPixelsToWorld(x, y);
        md.target.set(mp);
        md.maxForce = 1000.0* box.body.m_mass;
        md.frequencyHz = 5.0;
        md.dampingRatio = 0.9;

        mj = (MouseJoint) box2d.world.createJoint(md);
    }


    void detach(){
        if(null != mj){
            box2d.world.destroyJoint(mj);
            mj = null;
        }
    }
}
