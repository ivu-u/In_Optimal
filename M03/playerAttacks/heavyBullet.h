#ifndef HEAVYBULLET_H
#define HEAVYBULLET_H

#include "bulletManager.h"

#define HB_HEIGHT 6
#define HB_WIDTH 6

#define HB_BASE_DMG 0

void initHeavyBullets();
void updateHeavyBullet(BULLET* hb);
void drawHeavyBullet(BULLET* hb);
void moveHeavyBullet(BULLET* hb);
void spawnHeavyBullet(int x, int y);

#endif