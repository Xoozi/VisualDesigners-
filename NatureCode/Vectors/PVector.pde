class PVector{
    float   x;
    float   y;

    PVector(float x, float y){
        this.x = x;
        this.y = y;
    }

    void add(PVector v){
        x += v.x;
        y += v.y;
    }

    void sub(PVector v){
        x -= v.x;
        y -= v.y;
    }

    void mult(float n){
        x *= n;
        y *= n;
    }

    void div(float n){
        x /= n;
        y /= n;
    }

    float mag(){
        return sqrt(x*x + y*y);
    }

    void normalize(){
        float m = mag();

        if(0 != m){
            div(m);
        }
    }
}
