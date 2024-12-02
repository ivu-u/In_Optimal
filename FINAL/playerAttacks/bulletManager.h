#ifndef BULLETMANAGER_H
#define BULLETMANAGER_H

typedef struct {
    int active;
    
    int bType;  // bullet type
    int x, y;
    int xVel, yVel;
    int height, width;

    int direction;
    int oamIndex;

    int dmg;
} BULLET;

#define MAX_BULL_SIZE 50
extern int currNumBulls;

extern BULLET bullets[MAX_BULL_SIZE];

typedef enum { QUICK, HEAVY, CHARGE } BULLET_TYPE;

#define NUM_QUICK_BULLS 20
#define NUM_HEAVY_BULLS 10
#define NUM_CHARGE_BULLS 6

void initBulletManager();
void updateBullets();
void checkRemoveBullet(BULLET* b);
void spawnBullet(int x, int y);

#endif