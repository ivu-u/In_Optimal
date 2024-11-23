# 1 "enemies/baller.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "enemies/baller.c"
# 1 "enemies/baller.h" 1






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
# 8 "enemies/baller.h" 2

void initBaller();
void updateBallers();
void drawBaller(ENEMY_DATA* e);

void moveBaller(ENEMY_DATA* e);
void randomizeDirection(ENEMY_DATA* e);
void setBallerPos(int x, int y);
void checkBallerCollision(ENEMY_DATA* e);
void eraseBaller(ENEMY_DATA* e);
# 2 "enemies/baller.c" 2


# 1 "enemies/../helpers/sprites.h" 1



# 1 "enemies/../helpers/gba.h" 1
# 5 "enemies/../helpers/sprites.h" 2





typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "enemies/../helpers/sprites.h"
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
# 5 "enemies/baller.c" 2

# 1 "enemies/../player/player.h" 1



# 1 "enemies/../player/../helpers/gba.h" 1
# 5 "enemies/../player/player.h" 2

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
# 7 "enemies/baller.c" 2

# 1 "enemies/../states/game.h" 1



# 1 "enemies/../states/../helpers/gba.h" 1
# 5 "enemies/../states/game.h" 2


void initGame();
void updateGame();
void resumeGame();

void setMapDimensions(int mapWidth, int mapHeight);
void drawMaps();
void drawMovingBG();

void gameOver();

extern int MapWidth, MapHeight;

# 1 "enemies/../states/../gameBgs/pathwayBitmap.h" 1
# 20 "enemies/../states/../gameBgs/pathwayBitmap.h"
extern const unsigned short pathwayBitmapBitmap[32768];
# 20 "enemies/../states/game.h" 2


inline unsigned char colorAt(int x, int y){
    return ((unsigned char *) pathwayBitmapBitmap)[((y) * (MapWidth) + (x))];
}
# 9 "enemies/baller.c" 2

void initBaller() {
    for (int i = 0; i < enemy_manager.numBallers && i < 10; ++i) {
        ENEMY_DATA* e = &ballers[i];
        e->width = 12;
        e->health = 12;
        e->oamIndex = 51 + i;


        e->xVel = 1;
        e->yVel = 1;





    }
}

void updateBallers() {
    for (int i = 0; i < 10; ++i) {
        ENEMY_DATA* e = &ballers[i];
        if (!(e->active)) { continue; }

        moveBaller(e);
        drawBaller(e);
        checkBallerCollision(e);
    }
}

void drawBaller(ENEMY_DATA* e) {
    shadowOAM[e->oamIndex].attr0 = ((e->y - vOff) & 0xFF) | (0<<13) | (0<<14);
    shadowOAM[e->oamIndex].attr1 = ((e->x - hOff) & 0x1FF) | (1<<14);
    shadowOAM[e->oamIndex].attr2 = (((1) & 0xF) <<12) | (((0) & 3) << 10) | ((((11) * (32) + (0))) & 0x3FF);
}

void moveBaller(ENEMY_DATA* e) {
    e->x += e->xVel;
    e->y += e->yVel;

    if (e->x <= 0 || e->x >= MapWidth - 12) {
        randomizeDirection(e);
    }

    if (e->y <= 0 || e->y >= MapHeight + 12) {
        randomizeDirection(e);
    }
}

void randomizeDirection(ENEMY_DATA* e) {

    e->xVel = -(rand() % 3 + 1) * (rand() % 2 ? 1 : -1);
    e->yVel = -(rand() % 3 + 1) * (rand() % 2 ? 1 : -1);
}

void setBallerPos(int x, int y) {

    for (int i = 0; i < 10; ++i) {
        ENEMY_DATA* e = &ballers[i];
        if (e->active) { continue; }

        e->x = x;
        e->y = y;
        e->hasSetPos = 1;
        e->active = 1;
        return;
    }
}

void checkBallerCollision(ENEMY_DATA* e) {
    if (collision(e->x, e->y, 12, 12, player.x, player.y, player.width, player.health)) {
        playerTakeDamage(1);
        eraseBaller(e);
    }
}

void eraseBaller(ENEMY_DATA* e) {
    e->active = 0;
    shadowOAM[e->oamIndex].attr0 = (2<<8);
}
