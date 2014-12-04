class Button{
    final int size = 20; 
    final int padding = 3;
    float _x;
    float _y;
    float _tw; 
    int _id;
    String _label;
    ClickListener   _listener;

    Button(float x, float y, int id, String label, ClickListener listener){
        _x = x;
        _y = y;
        _id = id;
        _label = label;
        _listener = listener;

        textSize(size);
    }


    void display(){
        fill(#066071);
        _tw = textWidth(_label);
        rect(_x, _y - size/2 - padding, _tw + 2 * padding, size/2+ 2* padding);
        fill(255);
        text(_label, _x + padding, _y);
    }

    void checkClick(){
        if(_inRect(mouseX, mouseY)){
            _listener.onClick(_id);
        }
    }
    
    boolean _inRect(float mx, float my){
        if(mx > _x && mx < (_x + _tw)){
            if(my > (_y - size) && my < (_y + (size/2)))
                return true;
        }

        return false;
    }
}
