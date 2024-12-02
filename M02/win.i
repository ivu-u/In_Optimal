# 1 "states/win.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "states/win.c"
# 1 "states/win.h" 1



void innitWin();
void updateWin();
void drawWin();
# 2 "states/win.c" 2
# 1 "states/states.h" 1



typedef enum {
    GS_CUTSCENE,
    GS_START,
    GS_PAUSE,
    GS_GAME,
    GS_LOSE,
    GS_WIN,
    GS_INSTRUCT,
} GameState;

extern GameState state;


void runState();
void enterState(GameState newState);
void resumeState(GameState newState);
# 3 "states/win.c" 2

# 1 "states/../helpers/gba.h" 1




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
# 44 "states/../helpers/gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "states/../helpers/gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "states/../helpers/gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 149 "states/../helpers/gba.h"
extern int rSeed;
extern int hOff, vOff;
# 5 "states/win.c" 2
# 1 "states/../helpers/mode0.h" 1



# 1 "states/../helpers/gba.h" 1
# 5 "states/../helpers/mode0.h" 2
# 32 "states/../helpers/mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 6 "states/win.c" 2
# 1 "states/../helpers/sprites.h" 1
# 10 "states/../helpers/sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "states/../helpers/sprites.h"
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
# 7 "states/win.c" 2



void innitWin() {
    hideSprites();
}

void updateWin() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        enterState(GS_START);
    }
}

void drawWin() {

}
