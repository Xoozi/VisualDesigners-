class Turtle{
    
    String todo;
    float len;
    float theta;

    Turtle(String todo, float len, float theta){
        this.todo = todo;
        this.len = len;
        this.theta = theta;
    }

    void render(){
        
        stroke(0, 175);

        int count = todo.length();
        for(int i = 0; i < count; i++){
            
            char c = todo.charAt(i);

            if('F' == c){

                line(0, 0, len, 0);
                translate(len, 0);
            }else if('G' == c){

                translate(len, 0);
            }else if('+' == c){
                
                rotate(-theta);
            }else if('-' == c){
                
                rotate(theta);
            }else if('[' == c){

                pushMatrix();
            }else if(']' == c){
                
                popMatrix();
            }
        }
    }

    void setLen(float len){
        this.len = len;
    }

    void changeLen(float percent){
        len *= percent;
    }

    void setToDo(String todo){
        this.todo = todo;
    }
}
