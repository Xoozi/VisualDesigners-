class Blender{
    final int   MODE_NUM = 14;
    final String ON = "ON";
    final String OFF= "OFF";
    boolean     _capture = false;
    boolean     _switch = false;
    boolean     _imageGet = false;
    int         _modeIndex = 0;
    int[]       _modeList;
    String[]    _modeNames;

    int         _xStart = 0;
    int         _yStart = 0;
    int         _xEnd   = 0;
    int         _yEnd   = 0;

    int         _xBlend = 0;
    int         _yBlend = 0;
    int         _blendWidth = 0;
    int         _blendHeight= 0;

    PImage      _imageBack;
    PImage      _imageCapture;

    Blender(PImage imageBack){
        _initModeList();
        _imageBack = imageBack;
    }

    void display(){
        if(_capture){
            rectMode(CORNER);
            noFill();
            stroke(#FF0000);
            rect(_xStart, _yStart, _xEnd-_xStart, _yEnd-_yStart);
        }

        if(_switch && _imageGet){
            blend(_imageCapture, 1, 1, _blendWidth - 1, _blendHeight - 1,
                    _xBlend + 1, _yBlend + 1, _blendWidth - 1, _blendHeight - 1, 
                    _modeList[_modeIndex]);
        }
    }

    String getModeName(){
        return _modeNames[_modeIndex];
    }

    void blendSwitch(){
        _switch = !_switch;
    }


    boolean getSwitch(){
        return _switch;
    }
    String getSwitchStr(){
        if(_switch){
            return ON;
        }else{
            return OFF;
        }
    }

    void nextMode(){
        _modeIndex ++;
        if(_modeIndex >= MODE_NUM){
            _modeIndex = 0;
        }
    }

    void prevMode(){
        _modeIndex --;
        if(_modeIndex < 0){
            _modeIndex = MODE_NUM - 1;
        }
    }

    void startCapture(int x, int y){
        _capture = false;
        _imageGet = false;
        _xStart = x;
        _yStart = y;
        _xBlend = x;
        _yBlend = y;
    }

    void dragCapture(int x, int y){
        _capture = true;
        _xEnd = x;
        _yEnd = y;
    }

    void releaseCapture(int x, int y){
        _blendWidth = _xEnd - _xStart;
        _blendHeight = _yEnd - _yStart;
        
        if(_blendWidth > 0 && _blendHeight > 0){
            _imageCapture = _imageBack.get(_xStart, _yStart, _blendWidth, _blendHeight);
            _imageGet = true;
        }else{
            _imageGet = false;
            _capture = false;
        }
    }

    void keyMoveCapture(int x, int y){

        if(_imageGet && _capture){
            _xStart += x;
            _yStart += y;
            _xEnd   += x;
            _yEnd   += y;
            _xBlend += x;
            _yBlend += y;
        }
    }

    void _initModeList(){

        _modeList = new int[14];
        _modeNames = new String[14];

        _modeList[0] = BLEND;
        _modeList[1] = ADD;
        _modeList[2] = SUBTRACT;
        _modeList[3] = DARKEST;
        _modeList[4] = LIGHTEST;
        _modeList[5] = DIFFERENCE;
        _modeList[6] = EXCLUSION;
        _modeList[7] = MULTIPLY;
        _modeList[8] = SCREEN;
        _modeList[9] = OVERLAY;
        _modeList[10]= HARD_LIGHT;
        _modeList[11]= SOFT_LIGHT;
        _modeList[12]= DODGE;
        _modeList[13]= BURN;

        _modeNames[0] = "BLEND";
        _modeNames[1] = "ADD";
        _modeNames[2] = "SUBTRACT";
        _modeNames[3] = "DARKEST";
        _modeNames[4] = "LIGHTEST";
        _modeNames[5] = "DIFFERENCE";
        _modeNames[6] = "EXCLUSION";
        _modeNames[7] = "MULTIPLY";
        _modeNames[8] = "SCREEN";
        _modeNames[9] = "OVERLAY";
        _modeNames[10]= "HARD_LIGHT";
        _modeNames[11]= "SOFT_LIGHT";
        _modeNames[12]= "DODGE";
        _modeNames[13]= "BURN";
    }

}
