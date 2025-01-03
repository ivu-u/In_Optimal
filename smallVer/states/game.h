#ifndef GAME_H
#define GAME_H

#include "../helpers/gba.h"

// prototypes
void initGame();
void updateGame();
void resumeGame();

void setMapDimensions(int mapWidth, int mapHeight);
void drawMaps();
void drawMovingBG();

void gameOver();

extern int MapWidth, MapHeight;

#include "../lvl1_Art/lvlBitmap.h"

// TO-DO: make this scalable with levels
inline unsigned char colorAt(int x, int y){
    return ((unsigned char *) lvlBitmapBitmap)[OFFSET(x, y, MapWidth)];
}

#endif