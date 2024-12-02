#include "quickBullet.h"
#include "bulletManager.h"

#include "../helpers/sprites.h"

#include "../player/player.h"

int qb_index;

void initQuickBullets() {
    qb_index = currNumBulls;
    for (int i = 0; i < NUM_QUICK_BULLS; ++i) {
        BULLET* b = &bullets[currNumBulls];

        b->active = 0;
        b->bType = QUICK;
        b->height = QB_HEIGHT;
        b->width = QB_WIDTH;
        b->dmg = QB_BASE_DMG;

        b->oamIndex = QB_OAM + i;
        currNumBulls++;
    }
}

void updateQuickBullet(BULLET* qb) {
    drawQuickBullet(qb);
    moveQuickBullet(qb);
}

void drawQuickBullet(BULLET* qb) {
    shadowOAM[qb->oamIndex].attr0 = ATTR0_Y(qb->y - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[qb->oamIndex].attr1 = ATTR1_X(qb->x - hOff) | ATTR1_TINY;
    shadowOAM[qb->oamIndex].attr2 = ATTR2_PALROW(BULL_PALROW) | ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 12);
}

void moveQuickBullet(BULLET* qb) {
    switch (qb->direction) {
        case DOWN:
            qb->y += qb->yVel;
            break;

        case UP:
            qb->y -= qb->yVel;
            break;

        case LEFT:
            qb->x -= qb->xVel;
            break;

        case RIGHT:
            qb->x += qb->xVel;
            break;
    }
}

/// @brief spawns 3 bullets in quick succession
void spawnQuickBullet(int x, int y) {
    int bulletsSpawned = 0;
    for (int i = qb_index; i < qb_index + NUM_QUICK_BULLS && bulletsSpawned < 3; ++i) {
        BULLET* qb = &bullets[i];
        if (qb->active) { continue; }
        
        qb->direction = player.direction;
        qb->x = x;
        qb->y = y;
        if (qb->direction == UP) { qb->y += (-QB_HEIGHT) - bulletsSpawned * 5; }
        else if (qb->direction == DOWN) { qb->y += (QB_HEIGHT) + bulletsSpawned * 5; }
        else if (qb->direction == LEFT) { qb->x += (-QB_WIDTH) - bulletsSpawned * 5; }
        else if (qb->direction == RIGHT) { qb->x += (QB_WIDTH) + bulletsSpawned * 5; }
        
        qb->xVel = 3;
        qb->yVel = 3;
        qb->active = 1;

        bulletsSpawned++;
    }
}