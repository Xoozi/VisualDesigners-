final int TYPE_ONE = 0;
final int TYPE_RANDOM = 1;
final int TYPE_NOISE = 2;
final int TYPE_CENTER = 3;

ArrayList<Vehicle> vehicles;
ShadowImage shadow;
FlowField field;
void setup(){
    size(640, 480);

    vehicles = new ArrayList<Vehicle>(); 
    for(int i = 0; i < 120; i++){
        vehicles.add(new Vehicle(new PVector(random(width), random(height)), 
                                 random(2, 5),
                                 random(0.1, 0.5)));
    }
    
    shadow = new ShadowImage(width, height);

    field = new FlowField(TYPE_NOISE);
    noCursor();
}


void draw(){
    
    background(255);
    shadow.display();
    field.display();
    if(mousePressed){
        /*fill(107);
        stroke(0);
        ellipse(mouseX, mouseY, 20, 20);
        if(LEFT == mouseButton){
            vehicle.arrive(new PVector(mouseX, mouseY));
        }else if(RIGHT == mouseButton){
            vehicle.wander();
        }*/
    }else{
        drawCross();
    }

    for(Vehicle vehicle: vehicles){

        vehicle.follow(field);
        vehicle.run();
        shadow.drawPixels((int)vehicle.location.x, (int)vehicle.location.y, vehicle._color);
    }
}


void drawCross(){
    stroke(#FF0000);
    line(mouseX - 5, mouseY, mouseX + 5, mouseY);
    line(mouseX, mouseY-5, mouseX, mouseY + 5);
}
