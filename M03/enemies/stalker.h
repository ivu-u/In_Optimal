#ifndef STALKER_H
#define STALKER_H

#define STALKER_WIDTH 16
#define STALKER_HEIGHT 16

#include "enemyManager.h"

void initStalkers();
void updateStalkers();
void drawStalker(ENEMY_DATA* e);
void moveStalker(ENEMY_DATA* e);
void setStalkerPos(int x, int y);
void checkStalkerCollision(ENEMY_DATA* e);
void eraseStalker(ENEMY_DATA* e);

#endif