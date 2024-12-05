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

#include "../gameBgs/pathwayBitmap.h"

// TO-DO: make this scalable with levels
inline unsigned char colorAt(int x, int y){
    //return ((unsigned char *) pathwayBitmapBitmap)[OFFSET(x, y, MapWidth)];
    return 1;
}

#endif