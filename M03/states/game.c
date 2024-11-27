#include <stdio.h>
#include "game.h"
#include "states.h"

#include "../levels/levelManager.h"

#include "../player/player.h"
#include "../player/camera.h"
#include "../player/gui.h"

#include "../enemies/enemyManager.h"

#include "../helpers/gba.h"
#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../art/spritesheet.h"
#include "../gameBgs/gametileset.h"
#include "../gameBgs/redBG.h"

// externs
int MapWidth, MapHeight;

// // text buffer
// char buffer[41];

// Variables to track fractional offsets
int hOff_scroll, vOff_scroll = 0;
float hOffsetAccumulator = 0;
float vOffsetAccumulator = 0;
float scrollSpeed = 0.08; // Set this to any decimal value less than 1 to slow down

/// @brief Things that will only be initialized once
void initGame() {
    hideSprites();

    // load the first level
    drawMaps();
    initLevelManager();
    enterLevel(LVL1);

    //DMA shadowOAM into OAM during vBlank
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

    initPlayer();
    initCamera();
    initGui();

    initEnemies();
}

/// @brief main game loop
void updateGame() {
    if (BUTTON_PRESSED(BUTTON_START)) { enterState(GS_PAUSE); }

    runLevel();

    // TO-DO - figure out if you can keep these here or not
    updatePlayer();
    updateCamera();
    updateEnemies();

    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

    drawMovingBG();
    drawGui();
}

void resumeGame() {
    drawMaps();
    drawLevelMaps();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}

/****************
 * Other
****************/

void setMapDimensions(int mapWidth, int mapHeight) {
    MapWidth = mapWidth;
    MapHeight = mapHeight;
}

/// @brief DMA the correct tiles/pal/spritesheet
void drawMaps() {
    // DMANow(3, &gametilesetPal, BG_PALETTE, gametilesetPalLen / 2);
    // DMANow(3, &gametilesetTiles, &CHARBLOCK[1], gametilesetTilesLen / 2);

    // red bG scroll
    DMANow(3, &redBGTiles, &CHARBLOCK[0], redBGTilesLen / 2);
    DMANow(3, &redBGMap, &SCREENBLOCK[16], redBGMapLen / 2);

    // spritesheet
    DMANow(3, &spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, &spritesheetPal, SPRITE_PAL, spritesheetPalLen / 2);
}

void drawMovingBG() {
    // update for moving redBG
    // update for moving redBG with slower scrolling
    hOffsetAccumulator += scrollSpeed;
    vOffsetAccumulator += scrollSpeed;

    // Only increase hOff/vOff when accumulators reach a whole number
    if (hOffsetAccumulator >= 1) {
        hOff_scroll++;
        hOffsetAccumulator -= 1;
    }
    if (vOffsetAccumulator >= 1) {
        vOff_scroll++;
        vOffsetAccumulator -= 1;
    }
    REG_BG0HOFF = hOff_scroll;
    REG_BG0VOFF = vOff_scroll;
}

void gameOver() { }