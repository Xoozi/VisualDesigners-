class Liquid{
    float x;
    float y;
    float w;
    float h;
    float c;
    color _color;

    Liquid(float x, float y, float w, float h, float c, color rgb){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.c = c;

        _color = rgb;
    }

    void display(){
        noStroke();
        fill(_color);
        rect(x, y, w, h);
    }
}
