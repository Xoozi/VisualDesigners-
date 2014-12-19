class Windmill {
    
    RevoluteJoint rj;
    Box box1;
    Box box2;

    Windmill(float x, float y){
        box1 = new Box(x, y-20, 120, 10, false);
        box2 = new Box(x, y, 10, 40, true);

        RevoluteJointDef rjd = new RevoluteJointDef();

        rjd.initialize(box1.body, box2.body, box1.body.getWorldCenter());

        rjd.motorSpeed = PI * 2;
        rjd.maxMotorTorque = 1000.0;
        rjd.enableMotor = true;

        rj = (RevoluteJoint)box2d.world.createJoint(rjd);
    }

    void toggleMotor(){
        
        boolean motorStatus = rj.isMotorEnabled();
        println("toggleMotor:"+(!motorStatus));
        rj.enableMotor(!motorStatus);
    }

    void display(){
        box2.display();
        box1.display();

        Vec2 pos = box2d.getBodyPixelCoord(box1.body);
        stroke(64);
        fill(64);
        ellipse(pos.x, pos.y, 8, 8);
    }
}
