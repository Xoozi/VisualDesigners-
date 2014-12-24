class ElementaryCA{
    int rule;
    byte[] ruleDic = new byte[8];

    ElementaryCA(int r){
        rule = r; 
        for(int i = 0; i < 8; i++){
            ruleDic[i] = ((byte)((rule & ((byte)pow(2, i)))>>i));
            println("i:"+i+", rule:"+ruleDic[i]);
        }
    }

    byte lookup(byte left, byte mid, byte right){
        
        int index = (left << 2) | (mid << 1) | right;


        return ruleDic[index];
    }


    /** 
        make sure array size > 2
        to reduce 2 compare operation per loop
    */
    void generate(byte[] prev, byte[] next){
        int count = prev.length - 1;
        byte left, mid, right;
        
        left    = prev[count];
        mid     = prev[0];
        right   = prev[1];
        next[0] = lookup(left, mid, right);

        for(int i = 1; i < count; i++){
            left    = prev[i-1];    
            mid     = prev[i];
            right  = prev[i+1];
            next[i] = lookup(left, mid, right);
        }

        left    = prev[count-1];
        mid     = prev[count];
        right   = prev[0];
        next[count] = lookup(left, mid, right);
    }
}
