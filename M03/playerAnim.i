# 1 "player/playerAnim.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player/playerAnim.c"
# 1 "player/playerAnim.h" 1



void initPlayerAnim();
void drawPlayer();
# 2 "player/playerAnim.c" 2
# 1 "player/player.h" 1



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
# 5 "player/player.h" 2

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
# 3 "player/playerAnim.c" 2
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
# 4 "player/playerAnim.c" 2






SPRITE playerSprite;

void initPlayerAnim() {
    playerSprite.shape = (2<<14);
    playerSprite.size = (2<<14);

    playerSprite.hide = 0;
    playerSprite.animSpeed = 10;
    playerSprite.timeUntilNextFrame = playerSprite.animSpeed;

    playerSprite.numFrames = 1;
    playerSprite.currentFrame = 1;

    playerSprite.isAnimating = 0;
    playerSprite.hide = 0;
    playerSprite.oamIndex = 0;
}


void drawPlayer() {
    shadowOAM[playerSprite.oamIndex].attr0 = ((player.y - vOff) & 0xFF) | (0<<13) | playerSprite.shape;
    shadowOAM[playerSprite.oamIndex].attr1 = ((player.x - hOff) & 0x1FF) | playerSprite.size;
    shadowOAM[playerSprite.oamIndex].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | ((((0) * (32) + (0))) & 0x3FF);

    if (player.direction == RIGHT) {
        shadowOAM[playerSprite.oamIndex].attr1 |= (1<<12);
    }
}
