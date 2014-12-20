import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
//SoftStringPendulum ssp;

//Grid grid;
//VerletParticle2D p = null;

ArrayList<Cluster> clusters;

void setup(){
    size(640, 480);

    physics = new VerletPhysics2D();
    physics.setWorldBounds(new Rect(0, 0, width, height));
    //physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));

    /*grid = new Grid(10, 0.5, 30, 30);
    grid.lock(0, 0, 200, 0);
    grid.lock(29, 0, 450, 0);*/

    //ssp = new SoftStringPendulum(width/2, 0, 1.0, 0.9, 100);

    clusters = new ArrayList<Cluster>();
}

void draw(){
    background(170);
    physics.update();
    //ssp.display();    
    //grid.display();

    for(Cluster c:clusters){
        c.display();
    }
}

void mousePressed(){
    //ssp.startDrag(mouseX, mouseY); 

    /*p = grid.checkContact(mouseX, mouseY); 

    if(null != p){
        p.lock();
        p.x = mouseX;
        p.y = mouseY;
    }*/
}

void mouseDragged(){
    //ssp.moveDrag(mouseX, mouseY);
    /*if(null != p){
        p.x = mouseX;
        p.y = mouseY;
    }*/
}

void mouseReleased(){
    //ssp.endDrag();
    /*if(null != p){
        p.unlock();
        p = null;
    }*/

    clusters.add(makeRandom(mouseX, mouseY));
}

void keyReleased(){

    if('r' == key){
        clusters.clear();
    }
}

Cluster makeRandom(float x, float y){
    return new Cluster((int)random(3,30), random(30, 100), new Vec2D(x, y));
}
