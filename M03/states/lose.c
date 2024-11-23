#include "lose.h"
#include "states.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../menuScreens/loseBG.h"

void innitLose() {
    hideSprites();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    DMANow(3, &loseBGTiles, &CHARBLOCK[0], loseBGTilesLen / 2);
    DMANow(3, &loseBGPal, BG_PALETTE, loseBGPalLen / 2);
    DMANow(3, &loseBGMap, &SCREENBLOCK[8], loseBGMapLen / 2);
}

void updateLose() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        enterState(GS_START);
    }
}

void drawLose() {
    
}