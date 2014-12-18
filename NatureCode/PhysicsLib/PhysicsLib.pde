import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2d;
ArrayList<Box> boxes;
Bridge bridge;
//Surface surface;
//Boundary boundary;
void setup(){
    size(640, 480);

    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.setGravity(0, -20);
    
    boxes = new ArrayList<Box>();


    bridge = new Bridge(10, height/4, width-10, height/3, 1.0, 10);

    /*surface = new Surface();
    noiseSeed(millis());
    float a = height/4;
    float offset = height/2;
    float v = 0.0;
    float inc = 0.1;
    for(int i = 0; i < width/2; i += 5){
        float theta = map(i, 0, width/2, 0, TWO_PI);
        surface.addVertex(i, (sin(theta)+noise(v)) * a + offset);
        v += inc;
    }
    surface.endVertex();

    boundary = new Boundary(width*3/4, height*3/4, 200, 10);
    */
}

void draw(){

    background(107);

    box2d.step();
    
    if(mousePressed){
        if(RIGHT == mouseButton){
            boxes.add(new Box(mouseX, mouseY, 10));
        }else if(LEFT == mouseButton){
            boxes.add(new Pair(mouseX, mouseY, 10));
        }
    }

    for(int i = 0; i < boxes.size(); i++){
        if(!boxes.get(i).display()){
            boxes.remove(i);
        }
    }
    
    //surface.display();

    //boundary.display();

    bridge.display();
}
