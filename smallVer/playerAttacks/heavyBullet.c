#include "heavyBullet.h"
#include "bulletManager.h"

#include "../player/player.h"

#include "../helpers/sprites.h"

int hb_index;

void initHeavyBullets() {
    hb_index = currNumBulls;
    for (int i = 0; i < NUM_HEAVY_BULLS; ++i) {
        BULLET* b = &bullets[currNumBulls];

        b->active = 0;
        b->bType = HEAVY;
        b->height = HB_HEIGHT;
        b->width = HB_WIDTH;
        b->dmg = HB_BASE_DMG;
        b->distanceMoved = 0;

        b->oamIndex = HB_OAM + i;
        currNumBulls++;
    }
}

void updateHeavyBullet(BULLET* hb) {
    drawHeavyBullet(hb);
    moveHeavyBullet(hb);
}

void drawHeavyBullet(BULLET* hb) {
    shadowOAM[hb->oamIndex].attr0 = ATTR0_Y(hb->y - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[hb->oamIndex].attr1 = ATTR1_X(hb->x - hOff) | ATTR1_TINY;
    shadowOAM[hb->oamIndex].attr2 = ATTR2_PALROW(BULL_PALROW) | ATTR2_PRIORITY(0) | ATTR2_TILEID(1, 12);
}

void moveHeavyBullet(BULLET* hb) {
    switch (hb->direction) {
        case DOWN:
            hb->y += hb->yVel;
            break;

        case UP:
            hb->y -= hb->yVel;
            break;

        case LEFT:
            hb->x -= hb->xVel;
            break;

        case RIGHT:
            hb->x += hb->xVel;
            break;
    }
    hb->distanceMoved++;
    if (hb->distanceMoved >= HB_MAX_DISTANCE) { HB_Despawn(hb); }
}

/// @brief heavy recoil shot
void spawnHeavyBullet(int x, int y) {
    BULLET* hb;
    for (int i = hb_index; i < hb_index + NUM_HEAVY_BULLS; ++i) {
        hb = &bullets[i];
        if (hb->active) { continue; }
        break;
    }

    hb->direction = player.direction;
    hb->x = x;
    hb->y = y;
    if (hb->direction == UP) { hb->y += (-HB_HEIGHT); }
    else if (hb->direction == DOWN) { hb->y += (HB_HEIGHT); }
    else if (hb->direction == LEFT) { hb->x += (-HB_WIDTH); }
    else if (hb->direction == RIGHT) { hb->x += (HB_WIDTH); }

    hb->xVel = 3;
    hb->yVel = 3;
    hb->distanceMoved = 0;
    hb->active = 1;

    playerApplyRecoil(hb->direction, 5);
}

void HB_Despawn(BULLET* hb) {
    hb->active = 0;
    shadowOAM[hb->oamIndex].attr0 = ATTR0_HIDE;
}