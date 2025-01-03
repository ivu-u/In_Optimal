#include "cutscene.h"
#include "states.h"

#include "../helpers/sprites.h"
#include "../helpers/mode0.h"

#include "../cutscenes/blackBorder.h"
#include "../cutscenes/lvl1_01.h"

void initCutscene() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // same palette for all bg
    DMANow(3, &lvl1_01Pal, BG_PALETTE, lvl1_01PalLen / 2);

    DMANow(3, &lvl1_01Tiles, &CHARBLOCK[0], lvl1_01TilesLen / 2);
    DMANow(3, &lvl1_01Map, &SCREENBLOCK[16], lvl1_01MapLen / 2);

    DMANow(3, &blackBorderTiles, &CHARBLOCK[1], blackBorderTilesLen / 2);
    DMANow(3, &blackBorderMap, &SCREENBLOCK[17], blackBorderMapLen / 2);
}

void updateCutscene() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_A)) {
        enterState(GS_START);
    }
}
