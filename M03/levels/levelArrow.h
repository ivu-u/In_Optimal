#ifndef LEVELARROW_H
#define LEVELARROW_H

#include "../helpers/gba.h"
#include "../helpers/sprites.h"

typedef struct {
    int x, y;
    int direction;
    int overlappingPlayer;
    // which room it connects too;
    int shape;
    int size;

    // pos for firing bullets
    int fireX, fireY;

    u8 oamIndex;
} ARROW_DATA;

void initArrowSprites();
void updateArrows();
void arrowsON();
void arrowsOFF();
void setArrowPos(DIRECTION dir, int x, int y);
void drawArrow(ARROW_DATA* a);
void checkArrowCollision(ARROW_DATA* a);

#endif