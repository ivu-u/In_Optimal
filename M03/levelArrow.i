# 1 "levels/levelArrow.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "levels/levelArrow.c"
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
# 2 "levels/levelArrow.c" 2




ARROW_DATA arrow_data[4];

int arrowsActive = 0;


void initArrowSprites() {
    for (int i = 0; i < 4; ++i) {
        arrow_data[i].shape = (0<<14);
        arrow_data[i].size = (1<<14);

    }
}

void updateArrows() {

}

void arrowsON() {

}

void arrowsOFF() {

}

void setArrowPos(DIRECTION dir, int x, int y) {

}

void drawArrows() {

}
