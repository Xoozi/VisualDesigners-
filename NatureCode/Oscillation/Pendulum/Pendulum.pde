/* I thing my way is better than the book's code
   because I use the intergration of forces effect
   to work out the velocity */
final float G = 0.1;
final float size = 20.0;
Mover p;
void setup(){
    
    size(640, 480);
    p = new Mover(200, PI/4);
}

void draw(){
    background(255);

    PVector gravity  = new PVector(0, G * p.mass);
    PVector tForce   = _t(p);
    p.applyForce(gravity);
    p.applyForce(tForce);
    p.update(); 
    p.display();
    
    _textOut(80, 20);
}

/* Here use a approximate formula:
    Pendulum's arm length:L
    Ball's mass:m
    Start angle:Q
    Current angle:a
    current velocity'mag:v
    Tension = m * G * cos(a) + m * v * v / L
    
    Derived from Conservative law of mechanical engergy:
    m * v * v / 2 = m * G * L (1 - cosQ)
    */
PVector _t(Mover p){
    float v = p.velocity.mag();
    float t = p.mass * G * cos(p.curAngle) + p.mass * v * v / p.arm;
    PVector tForce = PVector.sub(new PVector(width/2, 0), p.location);
    tForce.normalize();
    tForce.mult(t);
    return tForce;
}
void _textOut(float x, float y){
    String out = String.format("angle:%04.4f, v:%04.4f", degrees(p.curAngle), p.velocity.mag());
    textSize(size);
    float tw = textWidth(out);
    rectMode(CENTER);
    fill(0, 102);
    noStroke();
    rect(x, y - size/2.0, tw, size*1.5);
    textAlign(CENTER);
    fill(204);
    text(out, x, y);
}
