class Vehicle{
    PVector location;
    PVector velocity;
    PVector acceleration;

    color   _color;
    float mass;
    float r;
    float wandertheta;
    float n;
    float nstep = 0.01;
    float maxforce = 0.05;
    float maxspeed = 2;


    Vehicle(PVector loc, float ms, float mf){
        location = loc.get();
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);

        mass = 1.0;
        wandertheta = 0;
        r = 3.0;
        n = 0;
        _color = color(random(255), random(255), random(255));
        maxforce = mf;
        maxspeed = ms;
    }

    void run(){
        boundaries(50);
        update();
        display();
    }

    void update(){

        velocity.add(acceleration);
        velocity.limit(maxspeed);
        location.add(velocity);

        acceleration.mult(0);
    }

    void display(){
        float theta = velocity.heading() + PI/2;
        fill(_color);
        stroke(0);
        pushMatrix();

        translate(location.x, location.y);
        rotate(theta);

        beginShape();
        vertex(0, -r*2);
        vertex(-r, r*2);
        vertex(r, r*2);
        endShape(CLOSE);

        popMatrix();
    }

    void applyForce(PVector force){
        PVector f = PVector.div(force, mass);
        acceleration.add(f);
    }

    PVector seek(PVector target){
        
        PVector desired = PVector.sub(target, location);
        desired.normalize();
        desired.mult(maxspeed);

        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxforce);

        return steer;
    }


    void flee(PVector target){
        
        PVector desired = PVector.sub(target, location);
        desired.normalize();
        desired.mult(-maxspeed);

        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxforce);
        applyForce(steer);
    }


    void flock(ArrayList<Vehicle> vehicles, float neighbord){
    
        PVector sep = separate(vehicles, 30);
        PVector ali = align(vehicles, neighbord);
        PVector coh = cohesion(vehicles, neighbord);

        sep.mult(1.5);
        ali.mult(1.0);
        coh.mult(1.0);

        applyForce(sep);
        applyForce(ali);
        applyForce(coh);
    }

    PVector align(ArrayList<Vehicle> vehicles, float neighbord){
        PVector sum = new PVector(0, 0);
        
        int count = 0;
        float dist;
        for(Vehicle v: vehicles){
            dist = PVector.dist(location, v.location);

            if(dist > 0 && dist < neighbord){
                sum.add(v.velocity);
                count ++; 
            }
        }
        
        if(count > 0){

            sum.div(count);

            sum.mult(maxspeed);

            PVector steer = PVector.sub(sum, velocity);

            steer.limit(maxforce);

            return steer;
        }else{
            return new PVector(0, 0);
        }
    }


    PVector cohesion(ArrayList<Vehicle> vehicles, float neighbord){

        PVector sum = new PVector(0, 0);
        
        int count = 0;
        float dist;
        for(Vehicle v: vehicles){
            dist = PVector.dist(location, v.location);

            if(dist > 0 && dist < neighbord){
                sum.add(v.location);
                count ++; 
            }
        }
        
        if(count > 0){

            sum.div(count);

            return seek(sum);
        }else{
            return new PVector(0, 0);
        }
    }

    PVector arrive(PVector target){
        
        PVector desired = PVector.sub(target, location);
        float d = desired.mag();
        desired.normalize();
        if(d < 100){
            float m = map(d, 0, 100, 0, maxspeed);
            desired.mult(m);
        }else{
            desired.mult(maxspeed);
        }

        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxforce);
        return steer;
    }

    void wander(boolean trace){
        float wanderR = 25;
        float wanderD = 80;
        float change = 0.6;
        //wandertheta += random(-change, change);
        change = noise(n) * change - 0.3;
        wandertheta += change;
        n += nstep;

        PVector circleloc = velocity.get();
        circleloc.normalize();
        circleloc.mult(wanderD);
        circleloc.add(location);

        float h = velocity.heading();
        
        PVector circleOffset = new PVector(wanderR*cos(wandertheta+h), wanderR*sin(wandertheta+h));
        PVector target = PVector.add(circleloc, circleOffset);
        seek(target);

        if(trace){
            drawWanderStuff(location, circleloc, target, wanderR);
        }
    }

    PVector separate(ArrayList<Vehicle> vehicles, float separation){
        
        float dist;
        PVector diff;
        PVector sum = new PVector();
        int count = 0;
        for(Vehicle v: vehicles){
            dist = PVector.dist(location, v.location);

            if(dist > 0 && dist < separation){
                diff = PVector.sub(location, v.location);
                diff.normalize();

                sum.add(diff);
                count ++;
            }
        }
        
        if(count > 0){
            sum.div(count);
            sum.setMag(maxspeed);

            PVector steer = PVector.sub(sum, velocity);
            steer.limit(maxforce);
            
            return steer;
        }

        return new PVector(0, 0);
    }

    void boundaries(float d){
        /*
        PVector desired = null;

        if(location.x < d){
            desired = new PVector(maxspeed, velocity.y);
        }else if(location.x > width -d){
            desired = new PVector(-maxspeed, velocity.y);
        }

        if(location.y < d){
            desired = new PVector(velocity.x, maxspeed);
        }else if(location.y > height - d){
            desired = new PVector(velocity.x, -maxspeed);
        }

        if(null != desired){
            desired.normalize();
            desired.mult(maxspeed);
            PVector steer = PVector.sub(desired, velocity);
            steer.limit(maxforce);
            applyForce(steer);
        }*/
        if(location.x < -r)location.x = width+r;
        if(location.y < -r)location.y = height+r;
        if(location.x > width+r)location.x = -r;
        if(location.y > height+r)location.y = -r;
    }

    void applyBehaviors(ArrayList<Vehicle> vehicles, Path path, boolean trace){
        
        PVector f = follow(path, 30.0, trace);
        PVector s = separate(vehicles, 30);

        f.mult(3);
        s.mult(1);

        applyForce(f);
        applyForce(s);
    }

    void follow(FlowField field){
        PVector desired = field.lookup(location);

        desired.mult(maxspeed);

        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxforce);
        applyForce(steer);
    }

    boolean followP(Path path, float dist, boolean trace){
        
        PVector predict = velocity.get();
        predict.normalize();
        predict.mult(dist);
        PVector predictLoc = PVector.add(location, predict);

        PVector normal = null;
        PVector start = null;
        PVector end = null;
        float worldRecord = 10000000;
        int count = path.vertexList.size() - 1;
        for(int i = 0; i < count; i++){
            PVector a = path.vertexList.get(i);
            PVector b = path.vertexList.get(i+1);
            PVector normalPoint = getNormalPoint(predictLoc, a, b);

            if(normalPoint.x < a.x || normalPoint.x > b.x){
                normalPoint = b.get();
            }

            float distance = PVector.dist(predictLoc, normalPoint);

            if(distance < worldRecord){
                worldRecord = distance;

                normal = normalPoint;

                start = a;
                end = b;
            }
        }

        PVector dir = PVector.sub(end, start);
        dir.normalize();
        dir.mult(10);
        PVector target = PVector.add(normal, dir);

        if(worldRecord > path.radius){
            seek(target);
            if(trace){
                drawFollowPath(predictLoc, normal, target, true);
            }

            return true;
        }else{
            if(trace){
                drawFollowPath(predictLoc, normal, target, false);
            }

            return false;
        }
    }
    
    PVector follow(Path path, float dist, boolean trace){
        PVector predict = velocity.get();
        predict.normalize();
        predict.mult(dist);
        PVector predictLoc = PVector.add(location, predict);

        PVector normal = null;
        PVector start = null;
        PVector end = null;
        float worldRecord = 10000000;
        int count = path.vertexList.size() - 1;
        for(int i = 0; i < count; i++){
            PVector a = path.vertexList.get(i);
            PVector b = path.vertexList.get(i+1);
            PVector normalPoint = getNormalPoint(predictLoc, a, b);

            if(normalPoint.x < min(a.x, b.x) ||
                normalPoint.x > max(a.x, b.x) ||
                normalPoint.y < min(a.y, b.y) ||
                normalPoint.y > max(a.y, b.y)){
                normalPoint = b.get();

                a = path.vertexList.get((i+1)%count);
                b = path.vertexList.get((i+2)%count);
            }

            float distance = PVector.dist(predictLoc, normalPoint);

            if(distance < worldRecord){
                worldRecord = distance;

                normal = normalPoint;

                start = a;
                end = b;
            }
        }

        PVector dir = PVector.sub(end, start);
        dir.normalize();
        dir.mult(10);
        PVector target = PVector.add(normal, dir);

        if(worldRecord > path.radius){
            if(trace){
                drawFollowPath(predictLoc, normal, target, true);
            }

            return seek(target);
        }else{
            if(trace){
                drawFollowPath(predictLoc, normal, target, false);
            }

            return new PVector(0, 0);
        }
    }

    Line findNearestLine(Path path, PVector predirLoc){
        Line line = new Line();
        float miniDist = 1000000;
        float dist;
        PVector prev =  null;
        PVector normalPoint;
        boolean out;
        boolean outMini = true;

        for(PVector p:path.vertexList){
            if(null != prev){
                normalPoint = getNormalPoint(predirLoc, prev, p);

                dist = PVector.dist(normalPoint, predirLoc);

                if(normalPoint.x < prev.x ||
                    normalPoint.x > p.x){

                    out = true;

                    normalPoint = p.get();
                }else{
                    out = false;
                }

                if(dist < miniDist){
                    if(outMini == out || out == false){
                        miniDist = dist;
                        line.start = prev;
                        line.end = p;
                        line.normalPoint = normalPoint;
                        outMini = out;
                    }
                }
            }
            prev = p;
        }

        line.start = line.start.get();
        line.end = line.end.get();
        return line;
    }
    

    void drawFollowPath(PVector predictLoc, PVector normalPoint, PVector target, boolean seek){
        stroke(0);
        fill(0);
        line(location.x, location.y, predictLoc.x, predictLoc.y);
        line(predictLoc.x, predictLoc.y, normalPoint.x, normalPoint.y);
        ellipse(predictLoc.x, predictLoc.y, 5, 5);
        ellipse(normalPoint.x, normalPoint.y, 5, 5);

        if(seek){  
            fill(_color);
            ellipse(target.x, target.y, 5, 5);
        }
    }


    PVector getNormalPoint(PVector p, PVector a, PVector b){
        PVector ap = PVector.sub(p, a);
        PVector ab = PVector.sub(b, a);

        ab.normalize();
        ab.mult(ap.dot(ab));
        
        return PVector.add(a, ab);
    }

    void drawWanderStuff(PVector location, PVector circle, PVector target, float rad){
        stroke(0);
        noFill();
        ellipseMode(CENTER);
        ellipse(circle.x, circle.y, rad*2, rad*2);
        stroke(#FF0000);
        ellipse(target.x, target.y, 4, 4);
        stroke(#00FF00);
        line(location.x, location.y, circle.x, circle.y);
        stroke(#0000FF);
        line(circle.x, circle.y, target.x, target.y);
    }


    class Line{
        PVector start;
        PVector end;
        PVector normalPoint;
    }

}
