#include "win.h"
#include "states.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"



void innitWin() {
    hideSprites();
}

void updateWin() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        enterState(GS_START);
    }
}

void drawWin() {
    
}