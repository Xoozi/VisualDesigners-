class HUD{
    TextTools   _tl;
    PointCloud  _pc;
    int       _x;
    int       _y;

    HUD(int x, int y, TextTools tl, PointCloud pc){
        _x = x;
        _y = y;
        _tl = tl;
        _pc = pc;
    }

    void display(float mx, float my){
        StringBuilder sb = new StringBuilder();
        sb.append(pc.getKindString());
        sb.append("  mode:");
        sb.append(pc.getModeChar());
        sb.append("--x:");
        sb.append(mx);
        sb.append(", y:");
        sb.append(my);
        
        _tl.textOut(sb.toString(), _x, _y);
    }
}
