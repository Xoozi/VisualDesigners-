class TextTools{
    int _textSize;
    TextTools(int textSize){
        _textSize = textSize;
    }

    void textOut(String out, float x, float y){
        textOut(out, x, y, _textSize);
    }

    void textOut(String out, float x, float y, float size){
        float tw = textWidth(out);
        textSize(size);
        fill(0, 102);
        rect(x, y - size, tw, size *1.5);
        fill(204);
        text(out, x, y);
    }
}
