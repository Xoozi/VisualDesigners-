import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2d;
ArrayList<Ball> balls;
void setup(){
    size(1200, 700);

    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.setGravity(0,0);

    balls= new ArrayList<Ball>();
}

void draw(){

    background(0);

    box2d.step();
    
    int count = balls.size();
    for(int i = 0; i < count; i++){
        Ball cur = balls.get(i);

        for(int j = 0; j < (count - 1); j ++){
            int nextIndex = (i + j + 1) % count;
            Ball next= balls.get(nextIndex);
            Vec2 attraction= next.attract(cur);
            cur.applyForce(attraction);
        }

        cur.display();
    }
}

void mouseReleased(){
    
    if(LEFT == mouseButton){
        if(balls.size() < 3){
            balls.add(new Ball(mouseX, mouseY, random(5, 10)));
        }
    }
}

void keyReleased(){
    if('r' == key){
        balls.clear();
    }
}
