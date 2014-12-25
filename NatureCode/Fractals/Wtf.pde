class Wtf{
    
    void drawWtf(float x, float y, float len){

        if(len > 2){
            line(x-len, y, x+len, y);
            line(x-len, y-len, x-len, y+len);
            line(x+len, y-len, x+len, y+len);

            drawWtf(x-len, y-len, len/2);
            drawWtf(x-len, y+len, len/2);
            drawWtf(x+len, y-len, len/2);
            drawWtf(x+len, y+len, len/2);
        }
    }
}
