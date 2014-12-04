final int   id_btn_select = 0;
final int   id_btn_reset = 1;
final int   id_btn_mode = 2;
final int   id_btn_undo = 3;
TextTools   tl;
HUD         hud; 
PointCloud  pc;
Button      btnSelect;
Button      btnReset;
Button      btnMode;
Button      btnUndo;
BtnListener btnListener;
void setup(){
    size(720, 720);
    smooth();

    tl = new TextTools(10);
    pc = new PointCloud(100, tl);
    hud = new HUD(width/2, 10, tl, pc);

    btnListener = new BtnListener();
    btnSelect = new Button(30, 20,
                            id_btn_select, 
                            "Next",
                            btnListener);
    btnMode  = new Button(70, 20,
                            id_btn_mode, 
                            "Mode",
                            btnListener);
    btnReset  = new Button(110, 20,
                            id_btn_reset, 
                            "Reset",
                            btnListener);
    btnUndo = new Button(150, 20,
                            id_btn_undo,
                            "Undo",
                            btnListener);
}

void draw(){

    background(64);
    
    pc.display();

    hud.display(mouseX, mouseY);

    btnSelect.display();
    btnMode.display();
    btnReset.display();
    btnUndo.display();
}


void mouseClicked(){
    
    if(LEFT == mouseButton){
        btnSelect.checkClick();
        btnMode.checkClick();
        btnReset.checkClick();
        btnUndo.checkClick();
    }

    if(RIGHT == mouseButton){
        pc.add(mouseX, mouseY);
    }
}

class BtnListener implements ClickListener{
    void onClick(int id){
        switch(id){
        case id_btn_select:
        pc.nextKind();
        break;

        case id_btn_reset:
        pc.reset();
        break;

        case id_btn_mode:
        pc.nextMode();
        break;

        case id_btn_undo:
        pc.undo();
        break;
        }
    }
}

