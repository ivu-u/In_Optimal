#include <stdlib.h> 
#include "helpers/gba.h"
#include "helpers/mode0.h"
#include "helpers/sprites.h"
#include "helpers/print.h"


#include "states/states.h"

void initialize();

// externs
int rSeed;
unsigned short buttons, oldButtons;
int hOff, vOff; // used in camera.c
OBJ_ATTR shadowOAM[128];

int main() {
    initialize();

    while(1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        runState();

        mgba_printf("%d", hOff);
        mgba_printf("%d", vOff);
    }
    return 0;
}

void initialize() { 
    mgba_open();

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_SMALL | BG_4BPP | 1; // scroll BG
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(17) | BG_SIZE_LARGE | BG_4BPP | 0;

    enterState(GS_CUTSCENE);
    rSeed = 0;
}