HUD         hud; 
Blender     blender;
PImage      backImage;
void setup(){
    
    backImage = loadImage("alpine.png");

    size(backImage.width, backImage.height);
     
    blender = new Blender(backImage);
    hud = new HUD(width/2, 20, blender);

    noCursor();
}

void draw(){
    background(backImage);

    hud.display(mouseX, mouseY);
    blender.display();


    _drawCursor();
}

void keyReleased(){
    if(CODED == key){

        if(RIGHT == keyCode){
            blender.nextMode();
        }else if(LEFT == keyCode){
            blender.prevMode();
        }else if(UP == keyCode || DOWN == keyCode){
            blender.blendSwitch();
        }
    }
}

void keyPressed(){
    if(CODED != key){
        
        int x = 0;
        int y = 0;
        if('w' == key){
            y -= 1;
        }
        if('s' == key){
            y += 1;
        }
        if('a' == key){
            x -= 1;
        }
        if('d' == key){
            x += 1;
        }

        blender.keyMoveCapture(x, y);
    }
}

void mousePressed(){
    if(LEFT == mouseButton){
        blender.startCapture(mouseX, mouseY);
    }
}

void mouseDragged(){
    if(LEFT == mouseButton){
        blender.dragCapture(mouseX, mouseY);
    }
}

void mouseReleased(){
    
    if(LEFT == mouseButton){
        blender.releaseCapture(mouseX, mouseY);
    }
}


void _drawCursor(){
    stroke(#FF0000);
    line(mouseX, mouseY - 10, mouseX, mouseY + 10);
    line(mouseX - 10, mouseY, mouseX + 10, mouseY);
}
