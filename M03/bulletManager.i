# 1 "playerAttacks/bulletManager.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "playerAttacks/bulletManager.c"
# 1 "playerAttacks/bulletManager.h" 1



typedef struct {
    int active;

    int bType;
    int x, y;
    int xVel, yVel;
    int height, width;

    int direction;
    int oamIndex;

    int dmg;
} BULLET;


extern int currNumBulls;

extern BULLET bullets[50];

typedef enum { QUICK, HEAVY, CHARGE } BULLET_TYPE;



void initBulletManager();
void updateBullets();
void checkRemoveBullet(BULLET* b);
void spawnBullet();
# 2 "playerAttacks/bulletManager.c" 2
# 1 "playerAttacks/quickBullet.h" 1
# 11 "playerAttacks/quickBullet.h"
void initQuickBullets();
void updateQuickBullets(BULLET* qb);
void drawQuickBullet(BULLET* qb);
void moveQuickBullet(BULLET* qb);
void spawnQuickBullet();
# 3 "playerAttacks/bulletManager.c" 2

# 1 "playerAttacks/../player/player.h" 1



# 1 "playerAttacks/../player/../helpers/gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "playerAttacks/../player/../helpers/gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "playerAttacks/../player/../helpers/gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "playerAttacks/../player/../helpers/gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 149 "playerAttacks/../player/../helpers/gba.h"
extern int rSeed;
extern int hOff, vOff;
# 5 "playerAttacks/../player/player.h" 2

typedef struct {
    int x, y;
    int xVel, yVel;
    int height, width;

    int moveType;
    int direction;

    int health;

    int currAttackType;
} PLAYER;



extern PLAYER player;
typedef enum {IDLE } MOVE_TYPE;

void initPlayer();
void updatePlayer();
void setPlayerPos(int x, int y);

void playerMovement();
void playerSkills();
void playerTakeDamage(int dmg);
# 5 "playerAttacks/bulletManager.c" 2

# 1 "playerAttacks/../states/game.h" 1



# 1 "playerAttacks/../states/../helpers/gba.h" 1
# 5 "playerAttacks/../states/game.h" 2


void initGame();
void updateGame();
void resumeGame();

void setMapDimensions(int mapWidth, int mapHeight);
void drawMaps();
void drawMovingBG();

void gameOver();

extern int MapWidth, MapHeight;

# 1 "playerAttacks/../states/../gameBgs/pathwayBitmap.h" 1
# 20 "playerAttacks/../states/../gameBgs/pathwayBitmap.h"
extern const unsigned short pathwayBitmapBitmap[32768];
# 20 "playerAttacks/../states/game.h" 2


inline unsigned char colorAt(int x, int y){
    return ((unsigned char *) pathwayBitmapBitmap)[((y) * (MapWidth) + (x))];
}
# 7 "playerAttacks/bulletManager.c" 2


BULLET bullets[50];
int currNumBulls = 0;

void initBulletManager() {
    initQuickBullets();
}

void updateBullets() {
    for (int i = 0; i < 50; ++i) {
        BULLET* b = &bullets[i];
        if (!(b->active)) { continue; }

        switch (b->bType) {
            case QUICK:
                updateQuickBullets(b);
                break;
        }

        checkRemoveBullet(b);
    }
}

void checkRemoveBullet(BULLET* b) {
    if (b->x < -10 || b->x > MapWidth + 10) { b->active = 0; }
    if (b->y < -10 || b->y > MapHeight + 10) { b->active = 0; }
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
