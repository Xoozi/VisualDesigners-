class Pair extends Box{

    Ball b1;
    Ball b2;
    float len = 32;

    Pair(float x, float y, float radius){
        super(x, y, radius);

        b1 = new Ball(x, y, radius);
        b2 = new Ball(x + random(-1, 1), y + random(-1, 1), radius);
    
        DistanceJointDef djd = new DistanceJointDef();
        djd.bodyA = b1.body;
        djd.bodyB = b2.body;
        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 3;
        djd.dampingRatio= 0.5;

        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
    }

    boolean display(){

        if(deaded){
            return false;
        }
       
        boolean alive1 = b1.display();
        boolean alive2 = b2.display();
        if(alive1 && alive2){
            Vec2 pos1 = box2d.getBodyPixelCoord(b1.body);
            Vec2 pos2 = box2d.getBodyPixelCoord(b2.body);
            stroke(0);
            line(pos1.x, pos1.y, pos2.x, pos2.y);
        }else if(!alive1 && !alive2){
            deaded = true;
            return false;
        }

        return true;
    }

}
