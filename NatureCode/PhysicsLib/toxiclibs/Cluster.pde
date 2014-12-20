class Cluster{
    
    ArrayList<Node> nodes;
    float diameter;

    Cluster(int n, float d, Vec2D center){
        nodes = new ArrayList<Node>();

        diameter = d;

        for(int i = 0; i < n; i++){
            nodes.add(new Node(center.add(Vec2D.randomVector())));
        }

        for(int i = 0; i < nodes.size() - 1; i++){
            VerletParticle2D ni = nodes.get(i);
            for(int j = i + 1; j < nodes.size(); j++){
                VerletParticle2D nj = nodes.get(j);
                physics.addSpring(new VerletSpring2D(ni, nj, diameter, 0.01));
            }
        }
    }
    

    void display(){
        for(int i = 0; i < nodes.size(); i++){
            nodes.get(i).display();
        }

        noFill();
        stroke(0, 100);
        for(int i = 0; i < nodes.size() - 1; i++){
            VerletParticle2D ni = nodes.get(i);
            for(int j = i + 1; j < nodes.size(); j++){
                VerletParticle2D nj = nodes.get(j);
                line(ni.x, ni.y, nj.x, nj.y);
            }
        }
    }
    
    class Node extends VerletParticle2D{
        
        Node(Vec2D pos){
            super(pos);
        }

        void display(){
            fill(0, 150);
            stroke(0);
            ellipse(x, y, 16, 16);
        }
    }
}
