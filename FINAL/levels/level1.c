#include "level1.h"
#include "levelManager.h"
#include "levelArrow.h"

#include "../player/player.h"

#include "../enemies/enemyManager.h"

#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../states/game.h"

#include "../lvl1_Art/lvl1_tileset.h"
#include "../lvl1_Art/greenTest.h"
#include "../lvl1_Art/lvl1_pathway.h"
#include "../lvl1_Art/lvl1_tempFinal_.h"

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
            update_lvl1_room1();
            break;
        
        case ROOM2:
            update_lvl1_room2();
            break;

        case ROOM3:
            update_lvl1_room3();
            break;
        
        default:
            mgba_printf("no room");
            break;
    }
}

void lvl1_enterROOM(ROOMS room) {
    switch(room) {
        case ROOM1:
            init_lvl1_room1();
            break;

        case ROOM2:
            init_lvl1_room2();
            break;

        case ROOM3:
            init_lvl1_room3();
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

        case ROOM2:
            draw_lvl1_room2();
            break;

        case ROOM3:
            draw_lvl1_room3();
            break;
        
        default:
            break;
    }
}

void init_lvl1_room1() {
    draw_lvl1_room1();
    setMapDimensions(256, 256);
    setPlayerPos(112, 180);

    // TEST
    setArrowPos(UP, ROOM2, 120, 0);

    // initialize enemies (number, type, position)
    // enemy_manager.numBallers = 0;
    // enemy_manager.numStalkers = 4;
    // initEnemies();
    // m_setStalkerPos(40, 0);
    // m_setStalkerPos(144, 144);
    // m_setStalkerPos(10, 10);
    // m_setStalkerPos(100, 100);
}

void draw_lvl1_room1() { DMANow(3, greenTestMap ,&SCREENBLOCK[17], greenTestLen / 2); }

void update_lvl1_room1() {
    // check if the room has been cleared or not
    // something like initialize player position for this
    // also init enemy pos and the maps n stuff
}

void init_lvl1_room2() {
    draw_lvl1_room2();
    setMapDimensions(256, 256);
    setPlayerPos(112, 240);

    setArrowPos(UP, ROOM3, 120, 0);

    enemy_manager.numBallers = 0;
    enemy_manager.numStalkers = 4;
    initEnemies();
    m_setStalkerPos(40, 0);
    m_setStalkerPos(144, 144);
    m_setStalkerPos(10, 10);
    m_setStalkerPos(100, 100);
}

void draw_lvl1_room2() { DMANow(3, lvl1_pathwayMap, &SCREENBLOCK[17], lvl1_pathwayLen / 2); }

void update_lvl1_room2() {

}

void init_lvl1_room3() {
    draw_lvl1_room3();
    setMapDimensions(256, 256);
    setPlayerPos(112, 240);

    enemy_manager.numBallers = 0;
    enemy_manager.numStalkers = 4;
    initEnemies();
    m_setStalkerPos(40, 0);
    m_setStalkerPos(144, 144);
    m_setStalkerPos(10, 10);
    m_setStalkerPos(100, 100);
}

void draw_lvl1_room3() { DMANow(3, lvl1_tempFinal_Map, &SCREENBLOCK[17], lvl1_tempFinal_Len / 2); }

void update_lvl1_room3() {

}

void winLevel() { }
 