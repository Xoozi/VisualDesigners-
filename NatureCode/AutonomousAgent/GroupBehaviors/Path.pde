class Path{
    ArrayList<PVector> vertexList;
    float radius;

    Path(float r){
        radius = r;
        vertexList = new ArrayList<PVector>();
    }


    void add(float x, float y){
        vertexList.add(new PVector(x, y));
    }

    void display(){
        noFill();
        strokeWeight(radius*2);
        stroke(0, 100);
        beginShape();
        for(PVector p:vertexList){
            vertex(p.x, p.y);
        }
        endShape(CLOSE);
        
        strokeWeight(1);
        stroke(0);
        beginShape();
        for(PVector p:vertexList){
            vertex(p.x, p.y);
        }
        endShape(CLOSE);
    }
}
