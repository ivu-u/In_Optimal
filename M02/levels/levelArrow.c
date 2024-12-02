#include "levelArrow.h"

#include "../helpers/sprites.h"

// externs
ARROW_DATA arrow_data[4];

int arrowsActive = 0;

/// @brief only happens once at the start of the game
void initArrowSprites() {
    for (int i = 0; i < 4; ++i) {
        arrow_data[i].shape = ATTR0_SQUARE;
        arrow_data[i].size = ATTR1_SMALL;
        //arrow_data[i].oa 
    }
}