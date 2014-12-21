class ShadowImage{

    PImage si;

    ShadowImage(int w, int h){
        si = createImage(w, h, ARGB);
    }

    void drawPixels(int x, int y, color c){
        if(x < 0 || x > (si.width-1) ||
            y < 0 || y > (si.height-1)){
            return ;
        }
        int pos = x + si.width * y;

        si.loadPixels();
        
        si.pixels[pos] = c;

        si.updatePixels();
    }

    void display(){
        image(si, 0, 0);
    }
}
