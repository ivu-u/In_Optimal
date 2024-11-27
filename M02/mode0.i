# 1 "helpers/mode0.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "helpers/mode0.c"
# 1 "helpers/mode0.h" 1



# 1 "helpers/gba.h" 1




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
# 44 "helpers/gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "helpers/gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "helpers/gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 149 "helpers/gba.h"
extern int rSeed;
extern int hOff, vOff;
# 5 "helpers/mode0.h" 2
# 32 "helpers/mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 1 "helpers/mode0.c" 2
