class GL{
    final float R = 8;
    PVector offset;
    int w;
    int h;
    int len;
    byte[] data1;
    byte[] data2;
    byte[] cur;
    byte[] next;
    byte[] tmp;
    NeighborOffset[] neighbors = new NeighborOffset[8];
    color off;
    color on;

    GL(PVector offset, int w, int h){
        this.offset = offset;
        this.w = w;
        this.h = h;
        len = w * h;
        data1 = new byte[len];
        data2 = new byte[len];
        cur  = data1;
        next = data2;

        off = color(19, 77, 8);
        on  = color(207, 245, 200);

        neighbors[0] = new NeighborOffset(0, -1);   //north
        neighbors[1] = new NeighborOffset(1, -1);   //north-east
        neighbors[2] = new NeighborOffset(1, 0);    //east
        neighbors[3] = new NeighborOffset(1, 1);    //south-east
        neighbors[4] = new NeighborOffset(0, 1);    //south
        neighbors[5] = new NeighborOffset(-1, 1);   //south-west
        neighbors[6] = new NeighborOffset(-1, 0);   //west
        neighbors[7] = new NeighborOffset(-1, -1);  //north-west
    }

    void display(){
        stroke(1);
        float xOffset, yOffest;
        for(int x = 0; x < w; x++){

            xOffset = offset.x + x * R;
            for(int y = 0; y < h; y++){

                yOffest = offset.y + y * R;
                if(0 == cur[x + y * w]){
                    fill(off);
                }else{
                    fill(on);
                }

                rect(xOffset, yOffest, R, R);
            }
        }

        noLoop();
    }

    void run(){
        generate(cur, next);

        tmp = cur;
        cur = next;
        next = tmp;

        loop();
    }

    void set(int x, int y){
        if(x > offset.x ||
            x < (offset.x + w * R) ||
            y > offset.y ||
            y < (offset.y + h * R)){
            int ix = (int)((x - offset.x) / R);
            int iy = (int)((y - offset.y) / R);
            int i = ix + iy * w;

            byte key = cur[i];
            if(1 == key){
                cur[i] = 0;
            }else{
                cur[i] = 1;
            }

            loop();
        }
    }

    void erase(int x, int y){
        if(x > offset.x ||
            x < (offset.x + w * R) ||
            y > offset.y ||
            y < (offset.y + h * R)){
            int ix = (int)((x - offset.x) / R);
            int iy = (int)((y - offset.y) / R);
            int i = ix + iy * w;

            cur[i] = 0;

            loop();
        }
    }

    void generate(byte[] c, byte[] n){
        int lives;
        byte key;
        for(int i = 0; i < len; i++){
            lives = getNeighborsLives(c, i);
            key = c[i];

            if(0 == key){
                if(3 == lives){
                    n[i] = 1;
                }else{
                    n[i] = 0;
                }
            }else if(1 == key){
                if(lives < 2 ||
                    lives > 3){
                    n[i] = 0;
                }else{
                    n[i] = 1;
                }
            }
        }
    }

    int getNeighborsLives(byte[] c, int pos){
        int lives = 0;
        int x = pos % w; 
        int y = pos / w;

        
        int offsetX;
        int offsetY;
        int index;
        for(int i = 0; i < 8; i++){
            offsetX = x + neighbors[i].x;
            offsetY = y + neighbors[i].y;
            if(offsetX < 0){
                offsetX = w - 1;
            }else if(offsetX > (w-1)){
                offsetX = 0;
            }

            if(offsetY < 0){
                offsetY = h - 1;
            }else if(offsetY > (h-1)){
                offsetY = 0;
            }

            index = offsetY * w + offsetX;
            if(1 == c[index]){
                lives += 1;
            }
        }

        return lives;
    }


    class NeighborOffset{
        int x;
        int y;

        NeighborOffset(int x, int y){
            this.x = x;
            this.y = y;
        }
    }

}
