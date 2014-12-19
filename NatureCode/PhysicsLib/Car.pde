class Car{
    
    Box box;
    Ball wheel1;
    Ball wheel2;

    Car(float x, float y){
       
        box = new Box(x, y, 64, 20, false);
        wheel1 = new Ball(x-28, y + 10, 15);
        wheel2 = new Ball(x+28, y + 10, 15);

        joint(box.body, wheel1.body);
        joint(box.body, wheel2.body);
    }

    void joint(Body b1, Body b2){
        RevoluteJointDef rjd = new RevoluteJointDef();
        rjd.initialize(b1, b2, b2.getWorldCenter());
        rjd.motorSpeed = - PI * 2;
        rjd.maxMotorTorque = 1000.0;
        rjd.enableMotor = true;
        box2d.world.createJoint(rjd);
    }

    void display(){
        box.display();
        wheel1.display();
        wheel2.display();
    }
}
