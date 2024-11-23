#ifndef BALLER_H
#define BALLER_H

#define BALLER_WIDTH 12
#define BALLER_HEIGHT 12

#include "enemyManager.h"

void initBaller();
void updateBallers();
void drawBaller(ENEMY_DATA* e);

void moveBaller(ENEMY_DATA* e);
void randomizeDirection(ENEMY_DATA* e);
void setBallerPos(int x, int y);
void checkBallerCollision(ENEMY_DATA* e);
void eraseBaller(ENEMY_DATA* e);

#endif