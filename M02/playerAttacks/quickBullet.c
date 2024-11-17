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

void updateQuickBullets(BULLET* qb) {
    drawQuickBullet(qb);
    moveQuickBullet(qb);
}

void drawQuickBullet(BULLET* qb) {
    shadowOAM[qb->oamIndex].attr0 = ATTR0_Y(qb->y - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[qb->oamIndex].attr1 = ATTR1_X(qb->x - hOff) | ATTR1_TINY;
    shadowOAM[qb->oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(2, 0);
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

void spawnQuickBullet() {
    BULLET* qb;

    for (int i = qb_index; i < qb_index + NUM_QUICK_BULLS; ++i) {
        qb = &bullets[i];
        if (qb->active) { continue; }
        break;
    }
    
    qb->x = player.x;
    qb->y = player.y;
    qb->xVel = 3;
    qb->yVel = 3;
    qb->direction = player.direction;
    if (qb->direction == RIGHT) { qb->x += player.width; }
    qb->active = 1;
}