String word = "Flexibility";
PFont f;
char[] letters;
float angle = 0.0;

void setup(){
    size(100, 100);
    f = loadFont("data/FreeMono-24.vlw");
    textFont(f);
    letters = word.toCharArray();
    fill(0);
}

void draw(){

    background(204);

    translate(50, 33);
    for(int i = 0; i < letters.length; i++){
        float angle = PI / letters.length;
        rotate(angle);
        text(letters[i], 0, 0);
        translate(textWidth(letters[i]), 0);
    }
}

