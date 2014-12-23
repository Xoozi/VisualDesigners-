final int TYPE_ONE = 0;
final int TYPE_RANDOM = 1;
final int TYPE_NOISE = 2;
final int TYPE_CENTER = 3;

ArrayList<Vehicle> vehicles;
Path path;

void setup(){
    size(640, 480);

    vehicles = new ArrayList<Vehicle>(); 
    for(int i = 0; i < 100; i++){
        vehicles.add(new Vehicle(new PVector(random(width), random(height)), 
                                 random(2, 5),
                                 random(0.1, 0.5)));
    }

    path = new Path(30);

    path.add(50, 50);
    path.add(width-50, 50);
    path.add(width-50, height-50);
    path.add(width/2, height-100);
    path.add(50, height-50);
    path.add(50, 50);
    
    noCursor();
}


void draw(){
    
    background(255);

    //path.display();

    if(mousePressed){
        fill(107);
        stroke(0);
        ellipse(mouseX, mouseY, 10, 10);

        if(LEFT == mouseButton){
            PVector mp = new PVector(mouseX, mouseY);
            for(Vehicle vehicle: vehicles){
                
                PVector sep = vehicle.separate(vehicles, 30);
                PVector seek = vehicle.seek(mp);
                vehicle.applyForce(sep);
                vehicle.applyForce(seek);
                vehicle.run();
            }
        }else if(RIGHT == mouseButton){
            
            for(Vehicle vehicle: vehicles){
                vehicle.flock(vehicles, 50);
                vehicle.run();
            }
        }
    }else{
        drawCross();

        for(Vehicle vehicle: vehicles){
            
            vehicle.applyBehaviors(vehicles, path, false);
            vehicle.run();
        }
    }

}


void drawCross(){
    stroke(#FF0000);
    line(mouseX - 5, mouseY, mouseX + 5, mouseY);
    line(mouseX, mouseY-5, mouseX, mouseY + 5);
}
