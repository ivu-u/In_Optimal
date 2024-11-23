#include "enemyManager.h"
#include "baller.h"

// extern
ENEMY_MANAGER enemy_manager;

// keep track of how many enemies are spawned in
// update the level 
ENEMY_DATA spiders[10];
ENEMY_DATA ballers[10]; 

void initEnemies() {
    initBaller();
}

void updateEnemies() {
    updateBallers();
}

void m_setBallerPos(int x, int y) {
    setBallerPos(x, y);
}