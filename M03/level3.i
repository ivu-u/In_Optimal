# 1 "levels/level3.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "levels/level3.c"
# 1 "levels/level3.h" 1



void init_lvl3_room1();
void draw_lvl3_room1();
# 2 "levels/level3.c" 2

# 1 "levels/../player/player.h" 1



# 1 "levels/../player/../helpers/gba.h" 1




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
# 44 "levels/../player/../helpers/gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "levels/../player/../helpers/gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "levels/../player/../helpers/gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 149 "levels/../player/../helpers/gba.h"
extern int rSeed;
extern int hOff, vOff;
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
# 4 "levels/level3.c" 2

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
# 6 "levels/level3.c" 2

# 1 "levels/../helpers/mode0.h" 1



# 1 "levels/../helpers/gba.h" 1
# 5 "levels/../helpers/mode0.h" 2
# 32 "levels/../helpers/mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 8 "levels/level3.c" 2

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
# 10 "levels/level3.c" 2

# 1 "levels/../gameBgs/pathway.h" 1







extern const unsigned short pathwayMap[1024];
# 12 "levels/level3.c" 2

void init_lvl3_room1() {

    draw_lvl3_room1();
    setMapDimensions(256, 256);
    setPlayerPos(112, 232);


    enemy_manager.numBallers = 4;
    initEnemies();
    m_setBallerPos(40, 0);
    m_setBallerPos(144, 144);
    m_setBallerPos(10, 10);
    m_setBallerPos(100, 100);
}

void draw_lvl3_room1() { DMANow(3, &pathwayMap, &((SB*) 0x6000000)[17], (2048) / 2); }
