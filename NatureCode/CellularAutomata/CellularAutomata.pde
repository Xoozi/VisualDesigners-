ElementaryCA eca;
final int DATA_COUNT = 200;

int runtime;
byte[] data1;
byte[] data2;
byte[] prev;
byte[] next;
byte[] tmp;


color off;
color on;

int rule = 225;

void setup(){
    size(800, 800);
    eca = new ElementaryCA(rule);
    data1= new byte[DATA_COUNT];
    data2= new byte[DATA_COUNT];
    prev = data1;
    next = data2;

    float flag;
    for(int i = 0; i < DATA_COUNT; i++){
        flag = random(100); 
        if(flag > 50){
            prev[i] = 1;
        }else{
            prev[i] = 0;
        }
    }

    runtime = 0;

    off = color(19, 77, 8);
    on  = color(207, 245, 200);

    background(255);
}


void draw(){

    runCA();
}

void runCA(){
    if(runtime < DATA_COUNT){
        
        drawData(runtime, 4, prev);

        eca.generate(prev, next);
        
        tmp = prev;
        prev = next;
        next = tmp;

        runtime ++;
    }else{
        noLoop();
    }
}

void drawData(int runtime, int r, byte[] data){
    int offset = runtime * r; 
    
    stroke(1);
    for(int i = 0; i < DATA_COUNT; i++){
        if(0 == data[i]){
            fill(off);
        }else{
            fill(on);
        }

        rect(i * r, offset, r, r);
    }
}

void keyReleased(){

    if('r' == key){
        background(255);
        eca = new ElementaryCA(rule);
        prev = data1;
        next = data2;
        float flag;
        for(int i = 0; i < DATA_COUNT; i++){
            flag = random(100); 
            if(flag > 50){
                prev[i] = 1;
            }else{
                prev[i] = 0;
            }
        }

        runtime = 0;
        rule += 1;
        if(rule > 255){
            rule = 0;
        }
        println("rule = " + rule);
        loop();
    }
}
