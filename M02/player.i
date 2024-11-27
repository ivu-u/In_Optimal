# 1 "player/player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player/player.c"
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
# 2 "player/player.c" 2
# 1 "player/playerAnim.h" 1



void initPlayerAnim();
void drawPlayer();
# 3 "player/player.c" 2

# 1 "player/../playerAttacks/bulletManager.h" 1



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
# 5 "player/player.c" 2

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
# 7 "player/player.c" 2

# 1 "player/../states/game.h" 1



# 1 "player/../states/../helpers/gba.h" 1
# 5 "player/../states/game.h" 2


void initGame();
void updateGame();
void resumeGame();

void setMapDimensions(int mapWidth, int mapHeight);
void drawMaps();
void drawMovingBG();

void gameOver();

extern int MapWidth, MapHeight;

# 1 "player/../states/../gameBgs/pathwayBitmap.h" 1
# 20 "player/../states/../gameBgs/pathwayBitmap.h"
extern const unsigned short pathwayBitmapBitmap[32768];
# 20 "player/../states/game.h" 2


inline unsigned char colorAt(int x, int y){
    return ((unsigned char *) pathwayBitmapBitmap)[((y) * (MapWidth) + (x))];
}
# 9 "player/player.c" 2


PLAYER player;

void initPlayer() {
    player.xVel = 1;
    player.yVel = 1;


    player.width = 15;
    player.height = 20;

    player.moveType = IDLE;
    player.direction = RIGHT;


    player.currAttackType = QUICK;

    player.health = 3;

    initPlayerAnim();
    initBulletManager();
}

void updatePlayer() {
    playerMovement();
    playerSkills();
    drawPlayer();
    updateBullets();
}

void setPlayerPos(int x, int y) {
    player.x = x;
    player.y = y;
}



void playerMovement() {
    int rightX = player.x + player.width - 1;
    int leftX = player.x;
    int topY = player.y;
    int botY = player.y + player.height - 1;

    if ((~(buttons) & ((1<<5))) && player.x > 0) {
        player.direction = LEFT;
        if (colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, botY)) {
            player.x -= player.xVel;
        }
    }
    if ((~(buttons) & ((1<<4))) && player.x + player.width - 1 < MapWidth) {
        player.direction = RIGHT;
        if (colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, botY)) {
            player.x += player.xVel;
        }
    }
    if ((~(buttons) & ((1<<6))) && player.y > 0) {
        player.direction = UP;
        if (colorAt(leftX, topY - player.yVel) && colorAt(rightX , topY - player.yVel)) {
            player.y -= player.yVel;
        }
    }
    if ((~(buttons) & ((1<<7))) && player.y + player.height - 1 < MapHeight) {
        player.direction = DOWN;
        if (colorAt(leftX, botY + player.yVel) && colorAt(rightX, botY + player.yVel)) {
            player.y += player.yVel;
        }
    }
}

void playerSkills() {
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        spawnBullet();
    }
}

void playerTakeDamage(int dmg) {
    player.health -= dmg;
    mgba_printf("dmg");

    if (player.health <= 0) {

        gameOver();
    }
}
