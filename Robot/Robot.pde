void setup(){

    size(720, 480);

    smooth();
    strokeWeight(2);
    background(204);
    ellipseMode(RADIUS);

    //Neck 
    stroke(102);
    line(266, 257, 266, 162);
    line(276, 257, 276, 162);
    line(286, 257, 286, 162);

    //Antennae
    line(276, 155, 246, 112);
    line(276, 155, 306, 56);
    line(276, 155, 342, 170);

    //Body
    noStroke();
    fill(102);
    ellipse(264, 377, 33, 33);  //Antigravity orb
    fill(0);
    rect(219, 257, 90, 120);    //Main body
    fill(102);
    rect(219, 274, 90, 6);      //Gray stripe

    //Head
    fill(0);
    ellipse(276, 155, 45, 45);  //Head
    fill(255);
    ellipse(288, 150, 14, 14);  //Large eye
    fill(0);
    ellipse(288, 150, 3, 3);    //Pupil
    fill(153);
    ellipse(263, 148, 5, 5);    //Small eye 1
    ellipse(296, 130, 4, 4);    //Small eye 2
    ellipse(305, 162, 3, 3);    //Small eye 3
}
