
class JitterBug{
    
    float   _x;
    float   _y;
    int     _diameter;
    float   _speed = 2.5;

    JitterBug(float x, float y, int diameter){
        _x = x;
        _y = y;
        _diameter = diameter;
          
    }

    void move(){
        _x += random(-_speed, _speed);
        _y += random(-_speed, _speed);
    }
    
    void display(){

        ellipse(_x, _y, _diameter, _diameter);
    }
}
