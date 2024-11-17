#include "levelManager.h"
#include "level1.h"

// extern
LEVEL currLevel;

/// @brief Update for the current level
void runLevel() {
    switch(currLevel) {
        case LVL1:
            update_lvl1();
            break;
    }
}

void enterLevel(LEVEL newLevel) {
    switch(currLevel) {
        case LVL1:
            initLevel1();
            break;
    }
}

/// @brief my ver of a BS event. notifies which level that all enemies have been killed.
/// The level can choose if they want to do anything with that
void allEnemiesCleared() {
    
}