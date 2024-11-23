# 1 "levels/level1.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "levels/level1.c"
# 1 "levels/level1.h" 1



void initLevel1();
void update_lvl1();
void drawMaps_lvl1();

void init_lvl1_room1();
void draw_lvl1_room1();
# 2 "levels/level1.c" 2
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
# 3 "levels/level1.c" 2

# 1 "levels/../player/player.h" 1



# 1 "levels/../player/../helpers/gba.h" 1
# 5 "levels/../player/player.h" 2

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
# 5 "levels/level1.c" 2

# 1 "levels/../enemies/enemyManager.h" 1



# 1 "levels/../enemies/../helpers/gba.h" 1
# 5 "levels/../enemies/enemyManager.h" 2

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
# 7 "levels/level1.c" 2

# 1 "levels/../helpers/mode0.h" 1
# 32 "levels/../helpers/mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 9 "levels/level1.c" 2


# 1 "levels/../states/game.h" 1



# 1 "levels/../states/../helpers/gba.h" 1
# 5 "levels/../states/game.h" 2


void initGame();
void updateGame();
void resumeGame();

void setMapDimensions(int mapWidth, int mapHeight);
void drawMaps();
void drawMovingBG();

void gameOver();

extern int MapWidth, MapHeight;

# 1 "levels/../states/../gameBgs/pathwayBitmap.h" 1
# 20 "levels/../states/../gameBgs/pathwayBitmap.h"
extern const unsigned short pathwayBitmapBitmap[32768];
# 20 "levels/../states/game.h" 2


inline unsigned char colorAt(int x, int y){
    return ((unsigned char *) pathwayBitmapBitmap)[((y) * (MapWidth) + (x))];
}
# 12 "levels/level1.c" 2

# 1 "levels/../lvl1_Art/lvl1_tileset.h" 1
# 21 "levels/../lvl1_Art/lvl1_tileset.h"
extern const unsigned short lvl1_tilesetTiles[16384];


extern const unsigned short lvl1_tilesetPal[256];
# 14 "levels/level1.c" 2
# 1 "levels/../lvl1_Art/greenTest.h" 1







extern const unsigned short greenTestMap[1024];
# 15 "levels/level1.c" 2

typedef enum {
    ROOM1,
} LEVEL1_ROOMS;

LEVEL1_ROOMS currRoom;


void initLevel1() {
    currRoom = ROOM1;
    DMANow(3, &lvl1_tilesetTiles, &((CB*) 0x6000000)[1], 32768 / 2);
    DMANow(3, &lvl1_tilesetPal, ((unsigned short *)0x5000000), 512 / 2);
    init_lvl1_room1();
}

void update_lvl1() {
    switch (currRoom) {
        case ROOM1:
            break;

        default:
            break;
    }
}

void drawMaps_lvl1() {
    switch (currRoom) {
        case ROOM1:
            draw_lvl1_room1();
            break;

        default:
            break;
    }
}

void init_lvl1_room1() {
    draw_lvl1_room1();
    setMapDimensions(256, 256);
    setPlayerPos(112, 112);


    setArrowPos(UP, 120, 0);
}

void draw_lvl1_room1() { DMANow(3, greenTestMap ,&((SB*) 0x6000000)[17], (2048) / 2); }

void room1() {



}

void room2() {

}

void winLevel() { }
