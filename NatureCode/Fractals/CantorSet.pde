class CantorSet{
    
    void cantor(float x, float y, float len){
        if(len >= 1){
            line(x, y, x+len, y);

            y+=20;
            cantor(x, y, len/3);
            cantor(x + len*2/3, y, len/3);
        }
    }
}
