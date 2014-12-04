void setup(){
    size(700, 100);
    noStroke();

    fill(#FF0000);
    arc(50, 55, 50, 50, 0, HALF_PI);
    
    fill(#00FF00);
    arc(50, 55, 60, 60, HALF_PI, PI);

    fill(#0000FF);
    arc(50, 55, 70, 70, PI, TWO_PI - HALF_PI);

    fill(#FFFF00);
    arc(50, 55, 80, 80, TWO_PI - HALF_PI, TWO_PI);
}




