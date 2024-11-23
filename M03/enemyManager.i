# 1 "enemies/enemyManager.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "enemies/enemyManager.c"
# 1 "enemies/enemyManager.h" 1



# 1 "enemies/../helpers/gba.h" 1




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
# 44 "enemies/../helpers/gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "enemies/../helpers/gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "enemies/../helpers/gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 149 "enemies/../helpers/gba.h"
extern int rSeed;
extern int hOff, vOff;
# 5 "enemies/enemyManager.h" 2

typedef struct {
    int numSpiders;
    int numBallers;
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

    u8 oamIndex;
} ENEMY_DATA;

extern ENEMY_DATA spiders[10];
extern ENEMY_DATA ballers[10];

void initEnemies();
void updateEnemies();
void m_setBallerPos(int x, int y);
# 2 "enemies/enemyManager.c" 2
# 1 "enemies/baller.h" 1
# 9 "enemies/baller.h"
void initBaller();
void updateBallers();
void drawBaller(ENEMY_DATA* e);

void moveBaller(ENEMY_DATA* e);
void randomizeDirection(ENEMY_DATA* e);
void setBallerPos(int x, int y);
void checkBallerCollision(ENEMY_DATA* e);
void eraseBaller(ENEMY_DATA* e);
# 3 "enemies/enemyManager.c" 2


ENEMY_MANAGER enemy_manager;



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
