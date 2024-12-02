#include "win.h"
#include "states.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../menuScreens/winScreen.h"

void innitWin() {
    hideSprites();
    waitForVBlank();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    DMANow(3, &winScreenTiles, &CHARBLOCK[1], winScreenTilesLen / 2);
    DMANow(3, &winScreenPal, BG_PALETTE, winScreenPalLen / 2);
    DMANow(3, &winScreenMap, &SCREENBLOCK[17], winScreenMapLen / 2);
}

void updateWin() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    if (BUTTON_PRESSED(BUTTON_START)) {
        enterState(GS_START);
    }
}

void drawWin() {
    
}