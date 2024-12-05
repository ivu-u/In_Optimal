#include "level1.h"
#include "levelManager.h"
#include "levelArrow.h"

#include "../player/player.h"

#include "../enemies/enemyManager.h"

#include "../helpers/mode0.h"
#include "../helpers/sprites.h"

#include "../states/game.h"

#include "../lvl1_Art/lvl1_tileset.h"
#include "../lvl1_Art/lvl1_startingRoom.h"
#include "../lvl1_Art/lvl1_left1.h"
#include "../lvl1_Art/lvl1_left2.h"
#include "../lvl1_Art/lvl1_leftBoss.h"

/// @brief Runs when you first enter level 1, only once
void initLevel1() {
    currRoom = ROOM1;
    DMANow(3, &lvl1_tilesetTiles, &CHARBLOCK[1], lvl1_tilesetTilesLen / 2);
    DMANow(3, &lvl1_tilesetPal, BG_PALETTE, lvl1_tilesetPalLen / 2);
    init_lvl1_startingRoom();
}

void update_lvl1() {
    switch (currRoom) {
        case ROOM1:
            update_lvl1_startingRoom();
            break;
        
        case ROOM2:
            update_lvl1_leftRoom1();
            break;

        case ROOM3:
            update_lvl1_leftRoom2();
            break;
        
        default:
            mgba_printf("no room");
            break;
    }
}

void lvl1_enterROOM(ROOMS room) {
    switch(room) {
        case ROOM1:
            init_lvl1_startingRoom();
            break;

        case ROOM2:
            init_lvl1_leftRoom1();
            break;

        case ROOM3:
            init_lvl1_leftRoom2();
            break;
        
        default:
            break;
    }
}

void drawMaps_lvl1() {
    switch (currRoom) {
        case ROOM1:
            draw_lvl1_startingRoom();
            break;

        case ROOM2:
            draw_lvl1_leftRoom1();
            break;

        case ROOM3:
            draw_lvl1_leftRoom2();
            break;
        
        default:
            break;
    }
}

void init_lvl1_startingRoom() {
    draw_lvl1_startingRoom();
    setMapDimensions(512, 512);
    setPlayerPos(232, 232);

    // TEST
    setArrowPos(UP, ROOM2, 120, 0);

    // initialize enemies (number, type, position)
    // enemy_manager.numBallers = 0;
    // enemy_manager.numStalkers = 1;
    // initEnemies();
    // m_setStalkerPos(40, 0);
    // m_setStalkerPos(144, 144);
    // m_setStalkerPos(10, 10);
    // m_setStalkerPos(100, 100);
}

void draw_lvl1_startingRoom() { DMANow(3, lvl1_startingRoomMap ,&SCREENBLOCK[17], lvl1_startingRoomLen / 2); }

void update_lvl1_startingRoom() {
    // check if the room has been cleared or not
    // something like initialize player position for this
    // also init enemy pos and the maps n stuff
}

void init_lvl1_leftRoom1() {
    draw_lvl1_leftRoom1();
    setMapDimensions(256, 256);
    setPlayerPos(112, 240);

    setArrowPos(UP, ROOM3, 120, 0);

    
}

void draw_lvl1_leftRoom1() {  }

void update_lvl1_leftRoom1() {

}

void init_lvl1_leftRoom2() {
    draw_lvl1_leftRoom2();
    setMapDimensions(256, 256);
    setPlayerPos(112, 240);

    
}

void draw_lvl1_leftRoom2() { }

void update_lvl1_leftRoom2() {

}

void init_lvl1_leftRoomFinal() {

}

void draw_lvl1_leftRoomFinal() {

}

void update_lvl1_leftRoomFinal() {

}

void winLevel() { }
 