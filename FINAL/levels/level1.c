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

// locals
int roomIsCleared[NUM_ROOMS];
int spawnX = 240;   // initial spawn point
int spawnY = 232;

/// @brief Runs when you first enter level 1, only once
void initLevel1() {
    currRoom = STARTROOM;
    DMANow(3, &lvl1_tilesetTiles, &CHARBLOCK[1], lvl1_tilesetTilesLen / 2);
    DMANow(3, &lvl1_tilesetPal, BG_PALETTE, lvl1_tilesetPalLen / 2);
    init_lvl1_startingRoom();

    for (int i = 0; i < NUM_ROOMS; ++i) { roomIsCleared[i] = 0; }
}

void update_lvl1() {
    switch (currRoom) {
        case STARTROOM:
            update_lvl1_startingRoom();
            break;
        
        case LEFT1:
            update_lvl1_leftRoom1();
            break;

        case LEFT2:
            update_lvl1_leftRoom2();
            break;
        
        default:
            mgba_printf("no room");
            break;
    }
}

void lvl1_enterROOM(ROOMS room, int x, int y) {
    int spawnX = x;
    int spawnY = y;

    switch(room) {
        case STARTROOM:
            init_lvl1_startingRoom();
            break;

        case LEFT1:
            init_lvl1_leftRoom1();
            break;

        case LEFT2:
            init_lvl1_leftRoom2();
            break;
        
        default:
            break;
    }
}

void drawMaps_lvl1() {
    switch (currRoom) {
        case STARTROOM:
            draw_lvl1_startingRoom();
            break;

        case LEFT1:
            draw_lvl1_leftRoom1();
            break;

        case LEFT2:
            draw_lvl1_leftRoom2();
            break;
        
        default:
            break;
    }
}

void init_lvl1_startingRoom() {
    arrowsON();

    draw_lvl1_startingRoom();
    setMapDimensions(512, 512);
    setPlayerPos(spawnX, spawnY);

    // TEST
    setArrowPos(RIGHT, LEFT1, 385, 235);

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

    setArrowPos(UP, LEFT2, 120, 0);

    
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
 