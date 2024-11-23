# 1 "player/camera.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player/camera.c"
# 1 "player/camera.h" 1



void initCamera();
void updateCamera();
# 2 "player/camera.c" 2
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
# 3 "player/camera.c" 2

# 1 "player/../helpers/mode0.h" 1



# 1 "player/../helpers/gba.h" 1
# 5 "player/../helpers/mode0.h" 2
# 32 "player/../helpers/mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 5 "player/camera.c" 2

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
# 7 "player/camera.c" 2

void initCamera() {
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;
}

 void updateCamera() {
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;


    hOff = player.x - (240 - player.width) / 2;
    vOff = player.y - (160 - player.height) / 2;


    if (player.x < 0) { player.x = 0; }
    if (player.y < 0) { player.y = 0; }
    if (player.x + player.width > MapWidth) { player.x = MapWidth - player.width; }
    if (player.y + player.height > MapHeight) { player.y = MapHeight - player.height; }


    if (hOff < 0) { hOff = 0; }
    if (vOff < 0) { vOff = 0; }
    if (hOff > (MapWidth - 240)) { hOff = MapWidth - 240; }
    if (vOff > (MapHeight - 160)) { vOff = MapHeight - 160; }
}
