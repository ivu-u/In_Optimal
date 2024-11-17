#include "level1.h"

#include "../player/player.h"

#include "../enemies/enemyManager.h"

#include "../helpers/mode0.h"

#include "../states/game.h"

#include "../gameBgs/pathway.h"

typedef enum {
    ROOM1,
} LEVEL1_ROOMS;

LEVEL1_ROOMS currRoom;

/// @brief Runs when you first enter level 1, only once
void initLevel1() {
    currRoom = ROOM1;
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

void init_lvl1_room1() {
    // set up game background
    DMANow(3, &pathwayMap, &SCREENBLOCK[17], pathwayLen / 2);
    setMapDimensions(240, 256);
    setPlayerPos(112, 232);

    // initialize enemies (number, type, position)
    enemy_manager.numBallers = 4;
    initEnemies();
    m_setBallerPos(40, 0);
    m_setBallerPos(144, 144);
    m_setBallerPos(10, 10);
    m_setBallerPos(100, 100);
}

void room1() {
    // check if the room has been cleared or not
    // something like initialize player position for this
    // also init enemy pos and the maps n stuff
}

void room2() {

}

void winLevel() {
    // put win condition stuff here? --> activate the next level
}

void lvl1_enemiesCleared() {

}