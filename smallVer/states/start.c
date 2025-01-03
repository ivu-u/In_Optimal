#include <stdlib.h> 
#include "start.h"
#include "states.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../menuScreens/uiTiles.h"
#include "../menuScreens/mainMenuBG.h"


void initStart() {
    hideSprites();

    // set up game background
    DMANow(3, &mainMenuBGTiles, &CHARBLOCK[1], mainMenuBGTilesLen / 2);
    DMANow(3, &mainMenuBGPal, BG_PALETTE, mainMenuBGPalLen / 2);
    DMANow(3, &mainMenuBGMap, &SCREENBLOCK[17], mainMenuBGMapLen / 2);
}

void updateStart() {
    rSeed++;

    if (BUTTON_PRESSED(BUTTON_B)) {
        enterState(GS_INSTRUCT);
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        srand(rSeed);
        enterState(GS_GAME);
    }
}