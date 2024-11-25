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
        arrow_data[i].oamIndex = LEVEL_ARROW_OAM + i;
    }
}

void updateArrows() {
    if (!(arrowsActive)) { return; }

    for (int i = 0; i < 4; ++i) {
        ARROW_DATA* a = &arrow_data[i];

        drawArrow(a);
    }
}

void arrowsON() { arrowsActive = 1; }

void arrowsOFF() { arrowsActive = 0; }

void setArrowPos(DIRECTION dir, int x, int y) {
    arrow_data[dir].direction = dir;
    arrow_data[dir].x = x;
    arrow_data[dir].y = y;
}

void drawArrow(ARROW_DATA* a) {
    shadowOAM[a->oamIndex].attr0 = ATTR0_Y(a->y - vOff) | ATTR0_4BPP | a->shape;
    shadowOAM[a->oamIndex].attr1 = ATTR1_X(a->x - hOff) | a->size;
    shadowOAM[a->oamIndex].attr2 = ATTR2_PALROW(0);

    int tileX = 0;
    if (a->overlappingPlayer) { tileX = 2; }

    int tileY = 26;
    if (a->direction == RIGHT) { shadowOAM[a->oamIndex].attr1 |= ATTR1_HFLIP;}
    else if (a->direction == UP || DOWN) { tileY = 28; }
    if (a->direction == DOWN) { shadowOAM[a->oamIndex].attr1 |= ATTR1_VFLIP; }

    shadowOAM[a->oamIndex].attr2 = ATTR2_TILEID(tileX, tileY);
}