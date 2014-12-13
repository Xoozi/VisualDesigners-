class Robe{
    static final int ACTION_NULL = 0;
    static final int ACTION_PICK = 1;
    static final int ACTION_NORTH = 2;
    static final int ACTION_EAST = 3;
    static final int ACTION_SOUTH = 4;
    static final int ACTION_WEST = 5;
    static final int ACTION_RANDOM = 6;
    static final int GENE_COUNT = 243;
    static final int MUTATION_COUNT_MAX = 9;
    static final int MUTATION_CHECK = GENE_COUNT - MUTATION_COUNT_MAX;

    int                         _mutationCount;
    int                         _score;
    byte[]                      _dna;
    
    Robe(){

        _dna = new byte[GENE_COUNT];
        for(int i = 0; i < GENE_COUNT; i++){
            _dna[i] = (byte)random(6.999);
        }

        _score = 0;
    }


    Robe(Robe father, Robe mother, int split){
        split = split % GENE_COUNT;
        _mutationCount = 0;
        _dna = new byte[GENE_COUNT];
        int i;
        for(i = 0; i < split; i++){
            _dna[i] = _transcribe(father._dna[i]);
        }
        for(;i < GENE_COUNT; i++){
            _dna[i] = _transcribe(mother._dna[i]);
        }
        _score = 0;
    }

    String getGeneStr(){
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < GENE_COUNT; i++){
            sb.append(_dna[i]);
        }
        return sb.toString();
    }

    int getAction(int index){
        return _dna[index];
    }

    int getScore(){
        return _score;
    }

    void setScore(int score){
        _score = score;
    }

    
    boolean _mutationCheck(){ 
        float mutationFlag = random(GENE_COUNT);

        if(mutationFlag > MUTATION_CHECK){
            return true;
        }else{
            return false;
        }
    }

    byte _transcribe(byte gene){
         
        if(_mutationCheck() && 
           _mutationCount < MUTATION_COUNT_MAX){
            _mutationCount ++;
            return (byte)random(6.999);
        }else{
            return gene;
        }
    }


}
