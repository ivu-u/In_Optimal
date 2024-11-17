#include "pause.h"
#include "states.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../menuScreens/pauseBG.h"


void innitPause() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    DMANow(3, &pauseBGMap, &SCREENBLOCK[8], pauseBGLen / 2);
}

void updatePause() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    if (BUTTON_PRESSED(BUTTON_START)) {
        resumeState(GS_GAME);
    }
}

void drawPause() {
    
}