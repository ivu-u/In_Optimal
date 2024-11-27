# 1 "states/cutscene.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "states/cutscene.c"
# 1 "states/cutscene.h" 1



void initCutscene();
void updateCutscene();
# 2 "states/cutscene.c" 2
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
# 3 "states/cutscene.c" 2

# 1 "states/../helpers/sprites.h" 1



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
# 5 "states/../helpers/sprites.h" 2





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
# 5 "states/cutscene.c" 2
# 1 "states/../helpers/mode0.h" 1
# 32 "states/../helpers/mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 6 "states/cutscene.c" 2

# 1 "states/../cutscenes/blackBorder.h" 1
# 22 "states/../cutscenes/blackBorder.h"
extern const unsigned short blackBorderTiles[32];


extern const unsigned short blackBorderMap[1024];


extern const unsigned short blackBorderPal[256];
# 8 "states/cutscene.c" 2
# 1 "states/../cutscenes/lvl1_01.h" 1
# 22 "states/../cutscenes/lvl1_01.h"
extern const unsigned short lvl1_01Tiles[1536];


extern const unsigned short lvl1_01Map[1024];


extern const unsigned short lvl1_01Pal[256];
# 9 "states/cutscene.c" 2

void initCutscene() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);


    DMANow(3, &lvl1_01Pal, ((unsigned short *)0x5000000), 512 / 2);

    DMANow(3, &lvl1_01Tiles, &((CB*) 0x6000000)[0], 3072 / 2);
    DMANow(3, &lvl1_01Map, &((SB*) 0x6000000)[16], 2048 / 2);

    DMANow(3, &blackBorderTiles, &((CB*) 0x6000000)[1], 64 / 2);
    DMANow(3, &blackBorderMap, &((SB*) 0x6000000)[17], 2048 / 2);
}

void updateCutscene() {
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        enterState(GS_START);
    }
}
