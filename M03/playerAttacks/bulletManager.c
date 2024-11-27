#include "bulletManager.h"
#include "quickBullet.h"
#include "heavyBullet.h"

#include "../player/player.h"

#include "../states/game.h"

// externs
BULLET bullets[MAX_BULL_SIZE];
int currNumBulls = 0;

void initBulletManager() {
    initQuickBullets();
    initHeavyBullets();
}

void updateBullets() {
    for (int i = 0; i < MAX_BULL_SIZE; ++i) {
        BULLET* b = &bullets[i];
        if (!(b->active)) { continue; }

        switch (b->bType) {
            case QUICK:
                mgba_printf("quick");
                updateQuickBullet(b);
                break;
            case HEAVY:
                mgba_printf("heavy");
                updateHeavyBullet(b);
                break;
        }

        checkRemoveBullet(b);
    }
}

void checkRemoveBullet(BULLET* b) {
    if (b->x < -10 || b->x > MapWidth) { b->active = 0; }
    if (b->y < -10 || b->y > MapHeight) { b->active = 0; }
}

void spawnBullet(int x, int y) {
    switch (player.currAttackType) {
        case QUICK:
            spawnQuickBullet(x, y);
            break;
    
        case HEAVY:
            spawnHeavyBullet(x, y);
            break;

        case CHARGE:
            break;
    }
}