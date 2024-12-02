# 1 "states/states.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "states/states.c"
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
# 2 "states/states.c" 2
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
# 3 "states/states.c" 2
# 1 "states/game.h" 1






void initGame();
void updateGame();
void resumeGame();

void setMapDimensions(int mapWidth, int mapHeight);
void drawMaps();
void drawMovingBG();

void gameOver();

extern int MapWidth, MapHeight;

# 1 "states/../gameBgs/pathwayBitmap.h" 1
# 20 "states/../gameBgs/pathwayBitmap.h"
extern const unsigned short pathwayBitmapBitmap[32768];
# 20 "states/game.h" 2


inline unsigned char colorAt(int x, int y){
    return ((unsigned char *) pathwayBitmapBitmap)[((y) * (MapWidth) + (x))];
}
# 4 "states/states.c" 2
# 1 "states/start.h" 1




void initStart();
void updateStart();
# 5 "states/states.c" 2
# 1 "states/pause.h" 1



void innitPause();
void updatePause();
void drawPause();
# 6 "states/states.c" 2
# 1 "states/lose.h" 1



void innitLose();
void updateLose();
void drawLose();
# 7 "states/states.c" 2
# 1 "states/win.h" 1



void innitWin();
void updateWin();
void drawWin();
# 8 "states/states.c" 2
# 1 "states/instructions.h" 1



void initIntructions();
void updateInstructions();
void drawInstructions();
# 9 "states/states.c" 2
# 1 "states/cutscene.h" 1



void initCutscene();
void updateCutscene();
# 10 "states/states.c" 2

GameState state;




void runState() {
    switch (state) {
        case GS_CUTSCENE:
            updateCutscene();
            break;

        case GS_START:
            updateStart();
            break;

        case GS_INSTRUCT:
            updateInstructions();

        case GS_PAUSE:
            updatePause();
            break;

        case GS_GAME:
            updateGame();
            break;

        case GS_LOSE:
            updateLose();
            break;
        case GS_WIN:
            updateWin();
            break;
    }
}

void enterState(GameState newState) {
    hOff = 0;
    vOff = 0;
    switch (newState) {
        case GS_CUTSCENE:
            initCutscene();
            state = GS_CUTSCENE;
            break;

        case GS_START:
            initStart();
            state = GS_START;
            break;

        case GS_INSTRUCT:
            initIntructions();
            state = GS_INSTRUCT;

        case GS_PAUSE:
            innitPause();
            state = GS_PAUSE;
            break;

        case GS_GAME:
            initGame();
            state = GS_GAME;
            break;

        case GS_LOSE:
            innitLose();
            state = GS_LOSE;
            break;

        case GS_WIN:
            innitWin();
            state = GS_WIN;
            break;
    }
}

void resumeState(GameState newState) {
    switch (newState) {
        case GS_GAME:
            resumeGame();
            state = GS_GAME;
            break;
    }
}
