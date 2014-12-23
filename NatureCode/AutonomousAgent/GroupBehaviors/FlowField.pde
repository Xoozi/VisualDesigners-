class FlowField{
    final float arrowSize = 4;
    final int resolution = 20;
    PVector[][] field;
    int cols, rows;

    FlowField(int type){
        cols = width/resolution;
        rows = height/resolution;

        field = new PVector[cols][rows];

        switch(type){
        case TYPE_ONE:

            for(int i = 0; i < cols; i++){
                for(int j = 0; j < rows; j++){
                    field[i][j] = new PVector(1, 0);
                }
            }
        break;


        case TYPE_RANDOM:
            for(int i = 0; i < cols; i++){
                for(int j = 0; j < rows; j++){
                    field[i][j] = PVector.random2D();
                }
            }
        break;

        case TYPE_NOISE:
            float xoff = 0;
            for(int i = 0; i < cols; i++){
                float yoff = 0;
                for(int j = 0; j < rows; j++){
                    float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
                    field[i][j] = new PVector(cos(theta), sin(theta));
                    yoff += 0.1;
                }
                xoff += 0.1;
            }
        break;

        case TYPE_CENTER:
            PVector center = new PVector(width/2, height/2);
            for(int i = 0; i < cols; i++){
                for(int j = 0; j < rows; j++){
                    PVector v = new PVector(i*resolution, j*resolution);
                    v = PVector.sub(center, v);
                    v.normalize();
                    field[i][j] = v;
                }
            }
        break;
        }
    }

    void display(){
        stroke(0, 107);
        for(int i = 0; i < cols; i++){
            for(int j = 0; j < rows; j++){
                drawVector(field[i][j], i*resolution, j*resolution, resolution-2);
            }
        }
    }


    PVector lookup(PVector lookup){
        int column = (int)constrain(lookup.x/resolution, 0, cols-1);
        int row = (int)constrain(lookup.y/resolution, 0, rows-1);
        return field[column][row].get();
    }

    void drawVector(PVector v, float x, float y, float scayl){
        pushMatrix();
      
        translate(x, y);

        rotate(v.heading());

        float len = v.mag() * scayl;

        line(0, 0, len, 0);
        line(len, 0, len-arrowSize, arrowSize/2);
        line(len, 0, len-arrowSize, -arrowSize/2);

        popMatrix();
    }
}
