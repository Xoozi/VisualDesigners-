class HUD{
    Blender   _blender;
    int       _x;
    int       _y;
    float     _size = 20.0;

    HUD(int x, int y, Blender blender){
        _x = x;
        _y = y;
        _blender = blender;
    }

    void display(float mx, float my){
        String str = String.format("(%03d,%03d) Mode:%s %s", (int)mx, (int)my, 
                                _blender.getModeName(), _blender.getSwitchStr());
        _textOut(str, _x, _y);
    }

    void _textOut(String out, float x, float y){
        float tw = textWidth(out);
        textSize(_size);
        rectMode(CENTER);
        fill(0, 102);
        noStroke();
        rect(x, y - _size/2.0, tw, _size *1.5);
        textAlign(CENTER);
        fill(204);
        text(out, x, y);
    }
}
