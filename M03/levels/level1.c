#include "level1.h"
#include "levelArrow.h"

#include "../player/player.h"

#include "../enemies/enemyManager.h"

#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../states/game.h"

#include "../lvl1_Art/lvl1_tileset.h"
#include "../lvl1_Art/greenTest.h"

typedef enum {
    ROOM1,
} LEVEL1_ROOMS;

LEVEL1_ROOMS currRoom;

/// @brief Runs when you first enter level 1, only once
void initLevel1() {
    currRoom = ROOM1;
    DMANow(3, &lvl1_tilesetTiles, &CHARBLOCK[1], lvl1_tilesetTilesLen / 2);
    DMANow(3, &lvl1_tilesetPal, BG_PALETTE, lvl1_tilesetPalLen / 2);
    init_lvl1_room1();
}

void update_lvl1() {
    switch (currRoom) {
        case ROOM1:
            break;
        
        default:
            break;
    }
}

void drawMaps_lvl1() {
    switch (currRoom) {
        case ROOM1:
            draw_lvl1_room1();
            break;
        
        default:
            break;
    }
}

void init_lvl1_room1() {
    draw_lvl1_room1();
    setMapDimensions(256, 256);
    setPlayerPos(112, 112);

    // TEST
    setArrowPos(UP, 120, 0);
}

void draw_lvl1_room1() { DMANow(3, greenTestMap ,&SCREENBLOCK[17], greenTestLen / 2); }

void room1() {
    // check if the room has been cleared or not
    // something like initialize player position for this
    // also init enemy pos and the maps n stuff
}

void room2() {

}

void winLevel() { }
 