#include "enemyManager.h"
#include "baller.h"
#include "stalker.h"

#include "../levels/levelManager.h"

// extern
ENEMY_MANAGER enemy_manager;

// keep track of how many enemies are spawned in
// update the level 
ENEMY_DATA spiders[10];
ENEMY_DATA ballers[10]; 
ENEMY_DATA stalkers[10];

void initEnemies() {
    enemy_manager.totalNumEnemeies = enemy_manager.numBallers + enemy_manager.numStalkers;

    initBaller();
    initStalkers();
}

void updateEnemies() {
    updateBallers();
    updateStalkers();
}

void enemyKilled() {
    enemy_manager.totalNumEnemeies--;
    if (enemy_manager.totalNumEnemeies <= 0) {
        allEnemiesCleared();
    }
}

void m_setBallerPos(int x, int y) {
    setBallerPos(x, y);
}

void m_setStalkerPos(int x, int y) {
    setStalkerPos(x, y);
}