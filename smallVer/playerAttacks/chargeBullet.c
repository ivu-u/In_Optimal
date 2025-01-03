#include "chargeBullet.h"
#include "bulletManager.h"

#include "../player/player.h"

#include "../helpers/sprites.h"

int cb_index;
int currCharge = 0;

void initChargeBullets() {
    cb_index = currNumBulls;
    for (int i = 0; i < NUM_CHARGE_BULLS; ++i) {
        BULLET* b = &bullets[currNumBulls];

        b->active = 0;
        b->bType = CHARGE;
        b->height = CB_HEIGHT;
        b->width = CB_WIDTH;
        b->dmg = CB_BASE_DMG;

        b->oamIndex = CB_OAM + i;
        currNumBulls++;
    }
}

void updateChargeBullet(BULLET* cb) {
    drawChargeBullet(cb);
    moveChargeBullet(cb);
}

void drawChargeBullet(BULLET* cb) {
    shadowOAM[cb->oamIndex].attr0 = ATTR0_Y(cb->y - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[cb->oamIndex].attr1 = ATTR1_X(cb->x - hOff) | ATTR1_MEDIUM;
    shadowOAM[cb->oamIndex].attr2 = ATTR2_PALROW(BULL_PALROW) | ATTR2_PRIORITY(0) | ATTR2_TILEID(3, 12);
}

void moveChargeBullet(BULLET* cb) {
    switch (cb->direction) {
        case DOWN:
            cb->y += cb->yVel;
            break;
        case UP:
            cb->y -= cb->yVel;
            break;
        case LEFT:
            cb->x -= cb->xVel;
            break;
        case RIGHT:
            cb->x += cb->xVel;
            break;
    }
}

/// @brief Spawns a single powerful sniper bullet after charging.
void spawnChargeBullet(int x, int y) {
    if (currCharge <= 1.5 * 60) { return; }
    // overcharge == more damage(?)
    currCharge = 0;

    for (int i = cb_index; i < cb_index + NUM_CHARGE_BULLS; ++i) {
        BULLET* cb = &bullets[i];
        if (cb->active) { continue; }

        cb->direction = player.direction;
        cb->x = x;
        cb->y = y;

        if (cb->direction == UP) { cb->y -= CB_HEIGHT; }
        else if (cb->direction == DOWN) { cb->y += CB_HEIGHT; }
        else if (cb->direction == LEFT) { cb->x -= CB_WIDTH; }
        else if (cb->direction == RIGHT) { cb->x += CB_WIDTH; }

        // Set high velocity for a sniper shot
        cb->xVel = 6;
        cb->yVel = 6;
        cb->dmg = CB_BASE_DMG * 2;  // Increased damage for a charged shot
        cb->active = 1;
        break;
    }
}

void chargeBullet() {
    currCharge += 1;
}