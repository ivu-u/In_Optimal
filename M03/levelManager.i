# 1 "levels/levelManager.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "levels/levelManager.c"
# 1 "levels/levelManager.h" 1



typedef enum {
    LVL1,
    LVL2,
} LEVEL;

extern LEVEL currLevel;

void initLevelManager();
void runLevel();
void enterLevel(LEVEL newLevel);

void drawLevelMaps();
# 2 "levels/levelManager.c" 2
# 1 "levels/level1.h" 1



void initLevel1();
void update_lvl1();
void drawMaps_lvl1();

void init_lvl1_room1();
void draw_lvl1_room1();
# 3 "levels/levelManager.c" 2
# 1 "levels/levelArrow.h" 1



# 1 "levels/../helpers/gba.h" 1




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
# 44 "levels/../helpers/gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "levels/../helpers/gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "levels/../helpers/gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 149 "levels/../helpers/gba.h"
extern int rSeed;
extern int hOff, vOff;
# 5 "levels/levelArrow.h" 2
# 1 "levels/../helpers/sprites.h" 1



# 1 "levels/../helpers/gba.h" 1
# 5 "levels/../helpers/sprites.h" 2





typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "levels/../helpers/sprites.h"
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
# 6 "levels/levelArrow.h" 2

typedef struct {
    int x, y;
    int direction;
    int overlappingPlayer;

    int shape;
    int size;
} ARROW_DATA;

void initArrowSprites();
void updateArrows();
void arrowsON();
void arrowsOFF();
void setArrowPos(DIRECTION dir, int x, int y);
void drawArrows();
# 4 "levels/levelManager.c" 2


LEVEL currLevel;


void initLevelManager() {
    initArrowSprites();



    arrowsON();
}


void runLevel() {
    switch(currLevel) {
        case LVL1:
            update_lvl1();
            break;
    }

    updateArrows();
}

void enterLevel(LEVEL newLevel) {
    switch(newLevel) {
        case LVL1:
            initLevel1();
            break;
    }
}



void allEnemiesCleared() {

}


void drawLevelMaps() {
    switch (currLevel) {
        case LVL1:
            drawMaps_lvl1();
            break;
    }
}
