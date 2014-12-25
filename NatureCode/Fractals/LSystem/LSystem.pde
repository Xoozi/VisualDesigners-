LS ls;
Turtle turtle;
int counter = 0;

void setup(){
    size(600, 600);
    
    //ls = new LS("F");
    //ls.addRule(new Rule('F', "FF+[+F-F-F]-[-F+F+F]"));
    ls = new LS("W");
    ls.addRule(new Rule('W', "WFX[+++++WFW][-----WFW]"));
    ls.addRule(new Rule('X', "F-XF"));

    
    turtle = new Turtle(ls.getSentence(), height/4, radians(5)); 
}

void draw(){

    background(255);
    fill(0);

    translate(width/3, height/2);
    rotate(-PI/2);
    turtle.render();
    noLoop();
}

void keyReleased(){
    
    if('r' == key && counter < 5){
        pushMatrix();
        
        ls.generate();

        turtle.setToDo(ls.getSentence());
        turtle.changeLen(0.5);

        popMatrix();
        redraw();
    
        counter++;
    }
}
