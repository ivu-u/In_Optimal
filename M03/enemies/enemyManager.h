#ifndef ENEMYMANAGER_H
#define ENEMYMANAGER_H

#include "../helpers/gba.h"

typedef struct {
    int numSpiders;
    int numBallers;
    int numStalkers;
    int totalNumEnemeies;
} ENEMY_MANAGER;

extern ENEMY_MANAGER enemy_manager;

typedef struct {
    int active;
    int height, width;

    int hasSetPos;
    int x, y;
    int xVel, yVel;

    int moveType;
    int direction;

    int health;

    // specific for diff enemies
    int moveTimer;
    int moveDelay;
    int moveDuration;
    int isMoving;

    u8 oamIndex;
} ENEMY_DATA;

extern ENEMY_DATA spiders[10];   // max num spiders for obj pool
extern ENEMY_DATA ballers[10];   // max num spiders for obj pool
extern ENEMY_DATA stalkers[10];   // max num spiders for obj pool

void initEnemies();
void updateEnemies();
void enemyKilled();

void m_setBallerPos(int x, int y);
void m_setStalkerPos(int x, int y);

#endif