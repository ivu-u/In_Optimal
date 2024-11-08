#include "bulletManager.h"
#include "quickBullet.h"

#include "../player/player.h"

#include "../states/game.h"

// externs
BULLET bullets[MAX_BULL_SIZE];
int currNumBulls = 0;

void initBulletManager() {
    initQuickBullets();
}

void updateBullets() {
    for (int i = 0; i < MAX_BULL_SIZE; ++i) {
        BULLET* b = &bullets[i];
        if (!(b->active)) { continue; }

        mgba_printf("act: %d", i);

        switch (b->bType) {
            case QUICK:
                updateQuickBullets(b);
                break;
        }

        checkRemoveBullet(b);
    }
}

void checkRemoveBullet(BULLET* b) {
    if (b->x < -10 || b->x > MAPWIDTH + 10) { b->active = 0; }
    if (b->y < -10 || b->y > MAPHEIGHT + 10) { b->active = 0; }
}

void spawnBullet() {
    switch (player.currAttackType) {
        case QUICK:
            spawnQuickBullet();
            break;
    
        case HEAVY:
            break;

        case CHARGE:
            break;
    }
}