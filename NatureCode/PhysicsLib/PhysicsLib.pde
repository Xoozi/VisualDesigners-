import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<Box> boxes;
//Windmill windmill;
//Bridge bridge;
//Surface surface;
//Car car;
//Boundary boundary;
//Box box;
//Spring spring;
Attractor attractor;
void setup(){
    size(640, 480);

    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.listenForCollisions();
    box2d.setGravity(0, 0);
    
    boxes = new ArrayList<Box>();

    attractor = new Attractor(width/2, height/2);

    //windmill = new Windmill(width/2, height/2);

    //bridge = new Bridge(10, height/4, width-10, height/3, 1.0, 10);
    /*car = new Car(width/2, height/2);

    surface = new Surface();
    noiseSeed(millis());
    float a = height/32;
    float offset = (height*3)/4;
    float v = 0.0;
    float inc = 0.1;
    for(int i = 0; i < width; i += 5){
        float theta = map(i, 0, width, 0, TWO_PI);
        surface.addVertex(i, (sin(theta)+noise(v)) * a + offset);
        v += inc;
    }
    surface.endVertex();
    */

    //boundary = new Boundary(width*3/4, height*3/4, 200, 10);

    //box = new Box(width/2, height/2, 20);
    //spring = new Spring();
}

void draw(){

    background(107);

    box2d.step();
    
    if(mousePressed){
        if(RIGHT == mouseButton){
            boxes.add(new Box(mouseX, mouseY, 10));
        }else if(LEFT == mouseButton){
            boxes.add(new Ball(mouseX, mouseY, 10));
        }
        //spring.update(mouseX, mouseY);
    }

    for(int i = 0; i < boxes.size(); i++){
        Box box = boxes.get(i); 
        Vec2 force = attractor.attract(box);
        box.applyForce(force);
        if(!box.display()){
            boxes.remove(i);
        }
    }

    attractor.display();
    
    //surface.display();

    //car.display();
    //boundary.display();

    //bridge.display();
    //windmill.display();

    /*spring.display();
    if(null != box){
        if(!box.display()){
            box = null;
        }
    }*/
}

void beginContact(Contact cp){
    Fixture f1 = cp.getFixtureA();
    Fixture f2 = cp.getFixtureB();

    Body b1 = f1.getBody();
    Body b2 = f2.getBody();

    Box box1 = (Box) b1.getUserData();
    Box box2 = (Box) b2.getUserData();

    box1.change();
    box2.change();
}
void endContact(Contact cp){

}

void mousePressed(){
    /*
    if(null == box){
        return ;
    }

    if(box.contains(mouseX, mouseY)){
        spring.attach(mouseX, mouseY, box);
    }*/
}

void mouseReleased(){
    //spring.detach();
}

void keyReleased(){
    if('r' == key){
        //windmill.toggleMotor();
    }
}
