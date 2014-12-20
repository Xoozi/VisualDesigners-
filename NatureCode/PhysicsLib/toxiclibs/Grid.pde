class Grid{
    int w;
    int h;
    float len;
    VerletParticle2D[][] grid;

    Grid(float len, float strength, int w, int h){
        
        float x;
        float y;
        this.len = len;
        this.w = w;
        this.h = h;
        grid = new VerletParticle2D[w][h];

        for(int i = 0; i < w; i++){
            
            for(int j = 0; j < h; j++){
                x =  i * len;
                y = j * len;
                VerletParticle2D p = new VerletParticle2D(new Vec2D(x, y));
                grid[i][j] = p;
                physics.addParticle(p);

                VerletParticle2D prev;
                if(i > 0){
                    prev = grid[i-1][j];
                    connectSpring(prev, p, len, strength);
                }
                if(j > 0){
                    prev = grid[i][j-1];
                    connectSpring(prev, p, len, strength);
                }
            }
        }
        
    }


    void display(){
        
        noFill();
        stroke(0);
        for(int i = 0; i < w; i++){
            for(int j = 0; j < h; j++){
                VerletParticle2D p = grid[i][j];            
                VerletParticle2D prev;
                if(i > 0){
                    prev = grid[i-1][j];
                    line(prev.x, prev.y, p.x, p.y);
                }
                if(j > 0){
                    prev = grid[i][j-1];
                    line(prev.x, prev.y, p.x, p.y);
                }
            }
        }
    }

    VerletParticle2D checkContact(float x, float y){
        Vec2D contact = new Vec2D(x, y);
        VerletParticle2D p;
        for(int i = 0; i < w; i++){
            for(int j = 0; j < h; j++){
                p = grid[i][j];
                if(p.distanceTo(contact) < len){
                    return p;
                }
            }
        }

        return null;
    }

    void lock(int gx, int gy, float x, float y){
        change(gx, gy, x, y, true);
    }

    void unlock(int gx, int gy){
        change(gx, gy, 0, 0, false);
    }

    void change(int gx, int gy, float x, float y, boolean lock){
        if((gx >= 0 && gx < w) && 
           (gy >= 0 && gy < h)){
            
            VerletParticle2D p = grid[gx][gy];
            if(lock){
                p.lock();
                p.x = x;
                p.y = y;
            }else{
                p.unlock();
            }
        }
    }

    void connectSpring(VerletParticle2D p1, VerletParticle2D p2, float len, float strength){
        VerletSpring2D spring = new VerletSpring2D(p1, p2, len, strength);
        physics.addSpring(spring);
    
    }
}
