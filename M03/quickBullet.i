# 1 "playerAttacks/quickBullet.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "playerAttacks/quickBullet.c"
# 1 "playerAttacks/quickBullet.h" 1



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
# 5 "playerAttacks/quickBullet.h" 2






void initQuickBullets();
void updateQuickBullets(BULLET* qb);
void drawQuickBullet(BULLET* qb);
void moveQuickBullet(BULLET* qb);
void spawnQuickBullet();
# 2 "playerAttacks/quickBullet.c" 2


# 1 "playerAttacks/../helpers/sprites.h" 1



# 1 "playerAttacks/../helpers/gba.h" 1




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
# 44 "playerAttacks/../helpers/gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "playerAttacks/../helpers/gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "playerAttacks/../helpers/gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 149 "playerAttacks/../helpers/gba.h"
extern int rSeed;
extern int hOff, vOff;
# 5 "playerAttacks/../helpers/sprites.h" 2





typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "playerAttacks/../helpers/sprites.h"
void hideSprites();

typedef struct {
  int shape;
  int size;

  int animSpeed;
  int timeUntilNextFrame;

  int numFrames;
  int currentFrame;

  int isAnimating;
  int hide;
  u8 oamIndex;
} SPRITE;

typedef enum {UP, DOWN, LEFT, RIGHT} DIRECTION;
# 5 "playerAttacks/quickBullet.c" 2

# 1 "playerAttacks/../player/player.h" 1



# 1 "playerAttacks/../player/../helpers/gba.h" 1
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
# 7 "playerAttacks/quickBullet.c" 2

int qb_index;

void initQuickBullets() {
    qb_index = currNumBulls;
    for (int i = 0; i < 20; ++i) {
        BULLET* b = &bullets[currNumBulls];

        b->active = 0;
        b->bType = QUICK;
        b->height = 2;
        b->width = 2;
        b->dmg = 0;

        b->oamIndex = 12 + i;
        currNumBulls++;
    }
}

void updateQuickBullets(BULLET* qb) {
    drawQuickBullet(qb);
    moveQuickBullet(qb);
}

void drawQuickBullet(BULLET* qb) {
    shadowOAM[qb->oamIndex].attr0 = ((qb->y - vOff) & 0xFF) | (0<<13) | (0<<14);
    shadowOAM[qb->oamIndex].attr1 = ((qb->x - hOff) & 0x1FF) | (0<<14);
    shadowOAM[qb->oamIndex].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | ((((9) * (32) + (0))) & 0x3FF);
}

void moveQuickBullet(BULLET* qb) {
    switch (qb->direction) {
        case DOWN:
            qb->y += qb->yVel;
            break;

        case UP:
            qb->y -= qb->yVel;
            break;

        case LEFT:
            qb->x -= qb->xVel;
            break;

        case RIGHT:
            qb->x += qb->xVel;
            break;
    }
}

void spawnQuickBullet() {
    BULLET* qb;

    for (int i = qb_index; i < qb_index + 20; ++i) {
        qb = &bullets[i];
        if (qb->active) { continue; }
        break;
    }

    qb->x = player.x;
    qb->y = player.y;
    qb->xVel = 3;
    qb->yVel = 3;
    qb->direction = player.direction;
    if (qb->direction == RIGHT) { qb->x += player.width; }
    qb->active = 1;
}
