#include <stdlib.h> 
#include "start.h"
#include "states.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../menuScreens/uiTiles.h"
#include "../menuScreens/startBG.h"


void initStart() {
    hideSprites();

    // set up game background
    DMANow(3, &uiTilesTiles, &CHARBLOCK[0], uiTilesTilesLen / 2);
    DMANow(3, &uiTilesPal, BG_PALETTE, uiTilesPalLen / 2);
    DMANow(3, &startBGMap, &SCREENBLOCK[8], startBGLen / 2);
    
    state = GS_START;
}

void updateStart() {
    rSeed++;

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        enterState(GS_INSTRUCT);
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed);
        enterState(GS_GAME);
    }
}