import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2d;
ArrayList<Box> boxes;
Boundary boundary1, boundary2;
void setup(){
    size(640, 480);

    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.setGravity(0, -10);
    
    boxes = new ArrayList<Box>();

    boundary1 = new Boundary(width/4, height - 10, 200, 10);
    boundary2 = new Boundary(width*3/4, height*3/4, 200, 10);
}

void draw(){

    background(107);

    box2d.step();
    
    if(mousePressed){
        boxes.add(new Box(mouseX, mouseY));
    }

    for(int i = 0; i < boxes.size(); i++){
        if(!boxes.get(i).display()){
            boxes.remove(i);
        }
    }

    boundary1.display();
    boundary2.display();
}
