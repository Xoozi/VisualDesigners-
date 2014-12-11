class Mover{
    PVector _location;
    PVector _velocity;
    PVector _acceleration;

    float _topspeed;

    Mover(){
        _location = new PVector(random(width), random(height));
        _velocity = new PVector(0, 0);

        _topspeed = 10.0;
    }

    void update(){

        PVector mouse = new PVector(mouseX, mouseY);
        PVector dir = PVector.sub(mouse, _location);
        dir.normalize();
        dir.mult(0.5);
        _acceleration = dir;

        _velocity.add(_acceleration);
        _location.add(_velocity);
        _constraint();
    }

    void display(){
        stroke(0);
        fill(175);
        ellipse(_location.x, _location.y, 16, 16);
    }

    void _constraint(){
        if(_location.x > width){
            _location.x = 0;
        }else if(_location.x < 0){
            _location.x = width;
        }

        if(_location.y > height){
            _location.y = 0;
        }else if(_location.y < 0){
            _location.y = height;
        }

        _limit(_topspeed);
    }

    void _limit(float max){
        if(_velocity.mag() > max){
            _velocity.normalize();
            _velocity.mult(max);
        }
    }
}
