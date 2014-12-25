class Tree{
    float theta;
    float rate;
    float am;

    Tree(float rate, float theta){
        this.rate = rate;
        this.theta = theta;

    }

    void drawTree2(PVector root, PVector branch){
        
        line(root.x, root.y, branch.x, branch.y);

        PVector vm, vl, vr;
        vm = PVector.sub(branch, root);
        if(vm.mag() < 1){
            return;
        }
        vl = vm.get();
        vr = vm.get();
        vm.div(rate*1.2);
        vl.div(rate);
        vr.div(rate);

    
        vm.rotate(theta/4);
        vl.rotate(-theta);
        vr.rotate(theta);

        vm = PVector.add(branch, vm);
        vl = PVector.add(branch, vl);
        vr = PVector.add(branch, vr);

        drawTree2(branch, vm);
        drawTree2(branch, vl);
        drawTree2(branch, vr);
    }

    void drawTree(PVector root, PVector branch){
        
        line(root.x, root.y, branch.x, branch.y);

        PVector vl, vr;
        vl = PVector.sub(branch, root);
        if(vl.mag() < 1){
            return;
        }
        vl.div(rate);
        vr = vl.get();
        vl.rotate(-random(0, theta));
        vr.rotate(random(0, theta));

        vl = PVector.add(branch, vl);
        vr = PVector.add(branch, vr);

        drawTree(branch, vl);
        drawTree(branch, vr);
    }
}
