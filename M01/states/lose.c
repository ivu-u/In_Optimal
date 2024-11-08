#include "lose.h"
#include "states.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

void innitLose() {
    hideSprites();
}

void updateLose() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        enterState(GS_START);
    }
}

void drawLose() {
    
}