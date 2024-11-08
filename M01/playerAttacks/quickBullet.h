#ifndef QUICKBULLET_H
#define QUICKBULLET_H

#include "bulletManager.h"

#define QB_HEIGHT 2
#define QB_WIDTH 2

#define QB_BASE_DMG 0

void initQuickBullets();
void updateQuickBullets(BULLET* qb);
void drawQuickBullet(BULLET* qb);
void moveQuickBullet(BULLET* qb);
void spawnQuickBullet();

#endif