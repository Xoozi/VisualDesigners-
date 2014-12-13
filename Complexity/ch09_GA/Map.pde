class Map{
    static final int WIDTH = 10;
    static final int HEIGHT = 10;
    static final int TANK_COUNT = 50;
    static final int MAX_STEP = 200;

    static final int SCOPE_CENTER = 0;
    static final int SCOPE_NORTH = 1;
    static final int SCOPE_EAST = 2;
    static final int SCOPE_SOUTH = 3;
    static final int SCOPE_WEST = 4;

    static final byte ATTR_EMPTY = 0;
    static final byte ATTR_TANK = 1;
    static final byte ATTR_WALL = 2;
    
    int     _x;
    int     _y;
    int     _score;
    byte[]  _grid;
    int[]   _directionList;
    Robe    _robe;

    HashMap<String, Integer>    _index;

    Map(Robe robe, HashMap<String, Integer> index){
        _index = index;
        _robe = robe;
        _score = 0;
        int length = WIDTH * HEIGHT;
        _grid = new byte[length];

        for(int i = 0; i < length; i++){
            _grid[i] = ATTR_EMPTY;
        }

        int tankCount = TANK_COUNT;
        while(tankCount > 0){
            int pos = (int)random(length);
            if(ATTR_EMPTY == _grid[pos]){
                _grid[pos] = ATTR_TANK;
                tankCount --;
            }
        }
        
        _x = 0;
        _y = 0;

        _directionList = new int[4];
        _directionList[0] = Robe.ACTION_NORTH;
        _directionList[1] = Robe.ACTION_EAST;
        _directionList[2] = Robe.ACTION_SOUTH;
        _directionList[3] = Robe.ACTION_WEST;
    }

    void startWork(){
        int step = 0;

        while(step < MAX_STEP){
            Integer scope = _index.get(_getScope());
            if(null != scope){
                int index = scope;
                int action = _robe.getAction(index);

                _doAction(action);
            }

            step ++;
        }
    }

    int getScore(){
        return _score;
    }

    String _getScope(){
        int center = _grid[_x + _y * WIDTH];
        int north, east, south, west;
        if(0 == _y){
            north = ATTR_WALL;
        }else{
            north = _grid[_x + (_y - 1) * WIDTH];
        }

        if((WIDTH - 1) == _x){
            east = ATTR_WALL;
        }else{
            east = _grid[_x + 1 + _y * WIDTH];
        }

        if((HEIGHT - 1) == _y){
            south = ATTR_WALL;
        }else{
            south = _grid[_x + (_y + 1) * WIDTH];
        }

        if(0 == _x){
            west = ATTR_WALL;
        }else{
            west = _grid[(_x - 1) + _y * WIDTH];
        }

        String key = String.format("%d%d%d%d%d", 
            center, north, east, south, west);
        return key;
    }
    
    void _doAction(int action){
        
        switch(action){
            case Robe.ACTION_NULL:

            break;

            case Robe.ACTION_PICK:
                _pick();
            break;

            case Robe.ACTION_NORTH:
            case Robe.ACTION_EAST:
            case Robe.ACTION_SOUTH:
            case Robe.ACTION_WEST:
            case Robe.ACTION_RANDOM:
                _move(action);
            break;
        }
    }

    void _pick(){
        int pos = _x + WIDTH * _y;
        if(ATTR_TANK == _grid[pos]){
            _score += 10;
            _grid[pos] = ATTR_EMPTY;
        }else{
            _score -= 1;
        }
    }

    void _move(int action){
        if(Robe.ACTION_RANDOM == action){
            int pos = (int) random(3.99);
            action = _directionList[pos];
            _move(action);
        }

        if(Robe.ACTION_NORTH == action){
            if(_y > 0){
                _y -= 1;
            }else{
                _score -= 5;
            }
        }else if(Robe.ACTION_EAST == action){
            if(_x < (WIDTH - 1)){
                _x += 1;
            }else{
                _score -= 5;
            }
        }else if(Robe.ACTION_SOUTH == action){
            if(_y < (HEIGHT - 1)){
                _y += 1;
            }else{
                _score -= 5;
            }
        }else if(Robe.ACTION_WEST == action){
            if(_x > 0){
                _x -= 1;
            }else{
                _score -= 5;
            }
        }
    }
    
}
