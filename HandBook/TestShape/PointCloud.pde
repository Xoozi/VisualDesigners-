class PointCloud{
    final int DEFAULT_KIND = -1;
    final int KIND_NUM = 8;
    final int MODE_VERTEX = 0;
    final int MODE_CURVE = 1;
    final int MODE_BEZIER = 2;

    TextTools _tl;
    Point[] _pa;
    int[]   _ka;
    int     _num;
    int     _cur;
    int     _shapeKind;
    int     _curMode;
    String  _shapeKindStr;

    StringBuilder _sb;

    PointCloud(int num, TextTools tl){
        _num = num;
        _cur = 0;
        _pa = new Point[_num];
        _ka = new int[KIND_NUM];
        _tl = tl;
        _sb = new StringBuilder();
        _shapeKind = 0;
        _ka[0] = DEFAULT_KIND;
        _ka[1] = POINTS;
        _ka[2] = LINES;
        _ka[3] = TRIANGLES;
        _ka[4] = TRIANGLE_FAN;
        _ka[5] = TRIANGLE_STRIP;
        _ka[6] = QUADS;
        _ka[7] = QUAD_STRIP;
        _shapeKindStr = _makeKindString(_ka[_shapeKind]);

        _curMode = MODE_VERTEX;
    }

    void add(float x, float y, float z){
        if(_cur < _num){
            _pa[_cur] = _makePoint(x, y, z);
            _cur ++;
        }
    }

    void add(float x, float y){
        add(x, y, 0.0);
    }

    void reset(){
        _cur = 0;
    }

    void undo(){
        if(_cur > 0)
            _cur -= 1;
    }

    void display(){
        noFill();
        if(DEFAULT_KIND == _ka[_shapeKind]){
            beginShape();
        }else{
            beginShape(_ka[_shapeKind]);
        }

        int step;
        for(int i = 0; i < _cur; ){
            step = 1;
            if(MODE_VERTEX == _pa[i].mode)
                vertex(_pa[i].x, _pa[i].y);
            else if(MODE_CURVE == _pa[i].mode)
                curveVertex(_pa[i].x, _pa[i].y);
            else if(MODE_BEZIER == _pa[i].mode)
                step = _drawBezierVertex(i);

            i += step;
        }
        endShape();

        for(int i = 0; i < _cur; i++){
            _vertexText(i, _pa[i]);
        }
    }


    String getKindString(){
        return _shapeKindStr;
    }

    char getModeChar(){
        if(MODE_CURVE == _curMode){
            return 'C';
        }else if(MODE_BEZIER == _curMode){
            return 'B';
        }

        return 'V';
    }


    void nextMode(){
        if(_curMode < MODE_BEZIER){
            _curMode ++;
        }else{
            _curMode = MODE_VERTEX;
        }
    }
        
    
    void nextKind(){
        _shapeKind ++;
        if(_shapeKind >= KIND_NUM)
            _shapeKind = 0;
        _shapeKindStr = _makeKindString(_ka[_shapeKind]);
    }


    int _drawBezierVertex(int index){

        //check next 3 point if not b mode, skip this
        int skip = 0;
        while(skip < 4){
            if((index + skip) >= _cur){
                break;
            }
            if(MODE_BEZIER != _pa[index+skip].mode){
                break;
            }else{
                skip ++;
            }
        }

        //gogogo
        if(4 == skip){
            vertex(_pa[index].x, _pa[index].y);
            bezierVertex(_pa[index+1].x, _pa[index+1].y,
                        _pa[index+2].x, _pa[index+2].y,
                        _pa[index+3].x, _pa[index+3].y);
        }else{//drop them
        }
        
        return skip;
    }

    String _makeKindString(int kind){
    
        String ret;
        switch(kind){
        case DEFAULT_KIND:
        ret = "Default";
        break;

        case POINTS:
        ret = "Point";
        break;

        case LINES:
        ret = "Lines";
        break;

        case TRIANGLES:
        ret = "Triangles";
        break;

        case TRIANGLE_FAN:
        ret = "Triangle_fan";
        break;

        case TRIANGLE_STRIP:
        ret = "Triangle_strip";
        break;

        case QUADS:
        ret = "Quads";
        break;

        case QUAD_STRIP:
        ret = "Quad_strip";
        break;

        default:
        ret = "Wtf";
        break;
        }


        return ret;
    }

    void _vertexText(int index,Point p){

        _sbClean();
        _sb.append("[");
        _sb.append(index);
        _sb.append("]-");

        if(MODE_CURVE == p.mode){
            _sb.append("c-");
        }else if(MODE_BEZIER == p.mode){
            _sb.append("b-");
        }else{
            _sb.append("v-");
        }
        
        _sb.append(p.x);
        _sb.append(",");
        _sb.append(p.y);
        _tl.textOut(_sb.toString(), (int)p.x, (int)p.y);
    }

    void _sbClean(){
        _sb.delete(0, _sb.length());
    }

    Point _makePoint(float x, float y, float z){
        Point p = new Point();
        p.x = x;
        p.y = y;
        p.z = z;
        p.mode = _curMode;
        return p;
    }


    class Point{
        int mode;
        float x;
        float y;
        float z;
    }
}
