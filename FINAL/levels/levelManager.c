#include "levelManager.h"
#include "level1.h"
#include "levelArrow.h"

#include "../states/states.h"

// extern
LEVEL currLevel;
ROOMS currRoom;

/// @brief happens once when the game opens
void initLevelManager() {
    initArrowSprites();
    //arrowsOFF();

    //TEST
    arrowsOFF();
}

/// @brief Update for the current level
void runLevel() {
    // clear room bools first(?)

    switch(currLevel) {
        case LVL1:
            update_lvl1();
            break;
    }

    updateArrows();
}

void enterLevel(LEVEL newLevel) {
    switch(newLevel) {
        case LVL1:
            initLevel1();
            break;
    }
}

void enterRoom(ROOMS room, int x, int y) {
    arrowsOFF();
    switch(currLevel) {
        case LVL1:
            lvl1_enterROOM(room, x, y);
            break;
    }
}

/// @brief my ver of a BS event. notifies which level that all enemies have been killed.
/// The level can choose if they want to do anything with that
void allEnemiesCleared() {
    arrowsON();
    if (currRoom == LEFT2) {
        enterState(GS_WIN);
    }
}

/// @brief when you pause and need to redraw the specific room
void drawLevelMaps() {
    switch (currLevel) {
        case LVL1:
            drawMaps_lvl1();
            break;
    }
}