#include "levelManager.h"
#include "level1.h"
#include "levelArrow.h"

// extern
LEVEL currLevel;

/// @brief happens once when the game opens
void initLevelManager() {
    initArrowSprites();
    //arrowsOFF();

    //TEST
    arrowsON();
}

/// @brief Update for the current level
void runLevel() {
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

/// @brief my ver of a BS event. notifies which level that all enemies have been killed.
/// The level can choose if they want to do anything with that
void allEnemiesCleared() {
    
}

/// @brief when you pause and need to redraw the specific room
void drawLevelMaps() {
    switch (currLevel) {
        case LVL1:
            drawMaps_lvl1();
            break;
    }
}