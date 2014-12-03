class Robot{

    float   _x;
    float   _y;
    float   _angle;
    float   _yOffset = 0.0;
    PShape  _botShape;


    Robot(String svgName, float x, float y){

        _botShape   = loadShape(svgName);
        _x          = x;
        _y          = y;
    }

    void update(){

        _angle += 0.05;
        _yOffset = sin(_angle) * 20;
    } 

    void display(){

        shape(_botShape, _x, _y + _yOffset);
    }
}
