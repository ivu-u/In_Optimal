#include "baller.h"
#include "enemyManager.h"

#include "../helpers/sprites.h"

#include "../player/player.h"

#include "../states/game.h"

void initBaller() {
    for (int i = 0; i < enemy_manager.numBallers && i < 10; ++i) {
        ENEMY_DATA* e = &ballers[i];
        e->width = BALLER_WIDTH;
        e->health = BALLER_HEIGHT;
        e->oamIndex = BALLER_OAM + i;

        // set the x and y later
        e->xVel = 1;
        e->yVel = 1;

        // // temp values
        // e->x = 0;
        // e->y = 0;
        // e->hasSetPos = 0;
    }
}

void updateBallers() {
    for (int i = 0; i < 10; ++i) {
        ENEMY_DATA* e = &ballers[i];
        if (!(e->active)) { continue; }

        moveBaller(e);
        drawBaller(e);
        checkBallerCollision(e);
    }
}

void drawBaller(ENEMY_DATA* e) {
    shadowOAM[e->oamIndex].attr0 = ATTR0_Y(e->y - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[e->oamIndex].attr1 = ATTR1_X(e->x - hOff) | ATTR1_SMALL;
    shadowOAM[e->oamIndex].attr2 = ATTR2_PALROW(1) | ATTR2_PRIORITY(0) | ATTR2_TILEID(2, 1);
}

void moveBaller(ENEMY_DATA* e) {
    e->x += e->xVel;
    e->y += e->yVel;

    if (e->x <= 0 || e->x >= MapWidth - BALLER_WIDTH) {
        randomizeDirection(e);
    }

    if (e->y <= 0 || e->y >= MapHeight + BALLER_HEIGHT) {
        randomizeDirection(e);
    }
}

void randomizeDirection(ENEMY_DATA* e) {
    // Generate random angles by setting new values for ballDX and ballDY
    e->xVel = -(rand() % 3 + 1) * (rand() % 2 ? 1 : -1); // Random value between -3 and 3, excluding 0
    e->yVel = -(rand() % 3 + 1) * (rand() % 2 ? 1 : -1);
}

void setBallerPos(int x, int y) {
    // find next available index
    for (int i = 0; i < 10; ++i) {
        ENEMY_DATA* e = &ballers[i];
        if (e->active) { continue; }

        e->x = x;
        e->y = y;
        e->hasSetPos = 1;
        e->active = 1;
        return;
    }
}

void checkBallerCollision(ENEMY_DATA* e) {
    if (collision(e->x, e->y, BALLER_WIDTH, BALLER_HEIGHT, player.x, player.y, player.width, player.health)) {
        playerTakeDamage(1);
        eraseBaller(e);
    }
}

void eraseBaller(ENEMY_DATA* e) {
    e->active = 0;
    shadowOAM[e->oamIndex].attr0 = ATTR0_HIDE;
}