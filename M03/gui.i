# 1 "player/gui.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player/gui.c"
# 1 "player/gui.h" 1



# 1 "player/../helpers/gba.h" 1




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
# 44 "player/../helpers/gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "player/../helpers/gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "player/../helpers/gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 149 "player/../helpers/gba.h"
extern int rSeed;
extern int hOff, vOff;
# 5 "player/gui.h" 2

typedef struct {
    int x, y;
    int score;
    u8 heartOamIndex;
} GUI;

void initGui();
void drawGui();
# 2 "player/gui.c" 2
# 1 "player/../player/player.h" 1



# 1 "player/../player/../helpers/gba.h" 1
# 5 "player/../player/player.h" 2

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
# 3 "player/gui.c" 2

# 1 "player/../helpers/sprites.h" 1



# 1 "player/../helpers/gba.h" 1
# 5 "player/../helpers/sprites.h" 2





typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "player/../helpers/sprites.h"
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
# 5 "player/gui.c" 2

GUI gui;
int heartOams[3];

void initGui() {
    gui.x = 3;
    gui.y = 3;

    gui.score = 0;

    gui.heartOamIndex = 44;

    for (int i = 0; i < player.health; ++i) {
        heartOams[i] = gui.heartOamIndex + (i + 1);
    }
}

void drawGui() {
    int baseX = gui.x;
    int baseY = gui.y;

    for (int i = 0; i < 3; ++i) {
        int xPos = baseX + (i * 17);
        shadowOAM[heartOams[i]].attr0 = ((baseY) & 0xFF) | (0<<13) | (0<<14);
        shadowOAM[heartOams[i]].attr1 = ((xPos) & 0x1FF) | (1<<14);

        if (i <= player.health - 1) { shadowOAM[heartOams[i]].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | ((((4) * (32) + (0))) & 0x3FF); }
        else { shadowOAM[heartOams[i]].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | ((((4) * (32) + (2))) & 0x3FF); }
    }
}
