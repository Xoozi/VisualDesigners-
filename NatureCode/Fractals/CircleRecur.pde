class CircleRecur{

    void drawCircle(float x, float y, float radius){

        stroke(0);
        noFill();
        ellipse(x, y, radius, radius);

        if(radius > 8){
            drawCircle(x - radius/2, y, radius/2);
            drawCircle(x + radius/2, y, radius/2);
            drawCircle(x, y + radius/2, radius/2);
            drawCircle(x, y - radius/2, radius/2);
        }
    }
}
