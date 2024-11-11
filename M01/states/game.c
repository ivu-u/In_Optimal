#include <stdio.h>
#include "game.h"
#include "states.h"

#include "../player/player.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../menuScreens/gameBG.h"

#include "../art/spritesheet.h"

// text buffer
char buffer[41];

void initGame() {
    // set up game background
    DMANow(3, &gameBGMap, &SCREENBLOCK[8], gameBGLen / 2);

    // spritesheet
    DMANow(3, &spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, &spritesheetPal, SPRITE_PAL, spritesheetPalLen / 2);

    hideSprites();

    //DMA shadowOAM into OAM during vBlank
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

    otherInits();
}

void otherInits() {
    initPlayer();
}

// main game loop
void updateGame() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        enterState(GS_PAUSE);
    }

    updatePlayer();

    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}

void drawGame() {

}

void win() {
    enterState(GS_WIN);
}

void drawMap() {

}

void resumeGame() {
    DMANow(3, &gameBGMap, &SCREENBLOCK[8], gameBGLen / 2);
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}
