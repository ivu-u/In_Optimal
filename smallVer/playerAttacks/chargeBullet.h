#ifndef CHARGEBULLET_H
#define CHARGEBULLET_H

#include "bulletManager.h"

#define CB_HEIGHT 6
#define CB_WIDTH 6

#define CB_BASE_DMG 0

void initChargeBullets();
void updateChargeBullet(BULLET* cb);
void drawChargeBullet(BULLET* cb);
void moveChargeBullet(BULLET* cb);
void spawnChargeBullet(int x, int y);
void chargeBullet();

#endif