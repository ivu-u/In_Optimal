#include "instructions.h"
#include "states.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

void initIntructions() {
    hideSprites();
}

void updateInstructions() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {  
        enterState(GS_START);
    }
}

void drawInstructions() {

}