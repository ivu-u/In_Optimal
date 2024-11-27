# 1 "helpers/gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "helpers/gba.c"
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
# 2 "helpers/gba.c" 2


unsigned volatile short *videoBuffer = (unsigned short *)0x6000000;



int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}


void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}


void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl) {
    ((DMAChannel*)0x040000B0)[channel].ctrl = 0;
    ((DMAChannel*)0x040000B0)[channel].src = src;
    ((DMAChannel*)0x040000B0)[channel].dest = dest;
    ((DMAChannel*)0x040000B0)[channel].ctrl = ctrl | (1 << 31);
}
