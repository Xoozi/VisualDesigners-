class LS{
    
    String sentence;
    ArrayList<Rule> ruleset;
    int generation;

    LS(String axiom){
        sentence = axiom;
        generation = 0;

        ruleset = new ArrayList<Rule>();
    }

    void addRule(Rule rule){
        ruleset.add(rule);
    }

    void generate(){
        StringBuffer nextgen = new StringBuffer();
        
        int count = sentence.length();
        int rules = ruleset.size();
        char a, c;
        Rule r;
        String replace;
        for(int i = 0; i < count; i++){

            c = sentence.charAt(i);
            replace = String.format("%c", c);

            for(int j = 0; j < rules; j++){
                r = ruleset.get(j);
                a = r.getA();

                if(a == c){
                    replace = r.getB();
                    break;
                }
            }

            nextgen.append(replace);
        }

        sentence = nextgen.toString();
        generation ++;
    }

    String getSentence(){
        return sentence;
    }


    int getGeneration(){
        return generation;
    }
}
