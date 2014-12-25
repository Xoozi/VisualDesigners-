class KochCurve{
    
    void drawKC(PVector start, PVector end){
        
        stroke(0);
        strokeWeight(1);
        line(start.x, start.y, end.x, end.y);

        float dist = PVector.dist(start, end);
        if(dist < 3){
            return ; 
        }
        
        PVector v1, v2,v3;
        v1 = PVector.sub(end, start);
        v2 = v1.get();
        v1.div(3.0);
        v2.mult(2/3.0);
        v3 = v1.get();
        v1 = PVector.add(start, v1);
        v2 = PVector.add(start, v2);
        v3.rotate(-radians(60));
        v3 = PVector.add(v1, v3);
    
        stroke(255); 
        strokeWeight(2);
        line(v1.x, v1.y, v2.x, v2.y);
        
        stroke(0);
        strokeWeight(1);
        line(v1.x, v1.y, v3.x, v3.y);
        line(v2.x, v2.y, v3.x, v3.y);

        drawKC(start, v1);
        drawKC(v1, v3);
        drawKC(v3, v2);
        drawKC(v2, end);
    }

    void drawSnowFlake(PVector center, float radius){
        float step = TWO_PI / 3; 
        float theta = 0.0;
        PVector[] vertexes = new PVector[3];

        for(int i = 0; i < 3; i++){
            float x = center.x + cos(theta) * radius;
            float y = center.y + sin(theta) * radius;
            vertexes[i] = new PVector(x, y);
            theta += step;
        }

        drawKC(vertexes[0], vertexes[1]);
        drawKC(vertexes[1], vertexes[2]);
        drawKC(vertexes[2], vertexes[0]);
    }
}
