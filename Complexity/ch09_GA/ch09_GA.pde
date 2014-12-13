final int countPerGroup     = 200;
final int workTime          = 20;
int       generation;
HashMap<String, Integer>    index;
Robe[]                      group;
Robe[]                      nextGroup;

void setup(){
    size(70, 70);
    noLoop();

    int count = 0;
    index = new HashMap<String, Integer>();
    for(int center = Map.ATTR_EMPTY; center <= Map.ATTR_WALL; center++){
        for(int north = Map.ATTR_EMPTY; north <= Map.ATTR_WALL; north++){
            for(int east = Map.ATTR_EMPTY; east <= Map.ATTR_WALL; east++){
                for(int south = Map.ATTR_EMPTY; south <= Map.ATTR_WALL; south++){
                    for(int west = Map.ATTR_EMPTY; west <= Map.ATTR_WALL; west++){
                        String key = String.format("%d%d%d%d%d", 
                        center, north, east, south, west);
                        index.put(key, count++);
                    }
                }
            }
        }
    }

    generation = 0;
    group = new Robe[countPerGroup];
    for(int i = 0; i < countPerGroup; i++){
        group[i] = new Robe();
    }
    println("generation:"+generation+", gogogo");

    int hightScore = -1000;
    Robe hightRobe = null;

    int nextCount = 0;

    while(generation < 1000){
        nextGroup = new Robe[countPerGroup];
        nextCount = 0; 
        while(nextCount < countPerGroup){

            println(""+nextCount+"/"+countPerGroup);
            int first = -1000;
            int second = -1000;
            Robe father = null;
            Robe mother = null;

            for(int i = 0; i < countPerGroup; i++){

                int sumScore = 0;
                for(int j = 0; j < workTime; j++){

                    Map map = new Map(group[i], index);
                    map.startWork();
                    sumScore += map.getScore();
                }

                int avScore = sumScore / workTime;
                
                group[i].setScore(avScore);

                if(avScore > second){
                    if(avScore > first){
                        second = first;
                        first = avScore;
                        mother = father;
                        father = group[i]; 

                        if(avScore > hightScore){
                            hightScore = avScore;
                            hightRobe = group[i];
                        }
                    }
                    second = avScore;
                    mother = group[i];
                }
            }
            

            int split = (int)random(Robe.GENE_COUNT-1);
            Robe child = _reproduction(father, mother, split);
            nextGroup[nextCount++] = child;
            if(nextCount >= countPerGroup)
                break;
            child = _reproduction(mother, father,split);
            nextGroup[nextCount++] = child;
        }

        group = nextGroup;

        println("generation:"+generation+", hight score="+ hightScore);
        println("hight robe:"+hightRobe.getGeneStr());

        generation ++;
    }
}

void draw(){

}


Robe _reproduction(Robe father, Robe mother, int split){
    return new Robe(father, mother, split);
}



