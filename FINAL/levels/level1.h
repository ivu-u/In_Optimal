#ifndef LEVEL1_H
#define LEVEL1_H

#include "levelManager.h"

#define NUM_ROOMS 4

void initLevel1();
void lvl1_enterROOM(ROOMS room, int x, int y);
void drawMaps_lvl1();

void init_lvl1_startingRoom();
void draw_lvl1_startingRoom();
void update_lvl1_startingRoom();

void init_lvl1_leftRoom1();
void draw_lvl1_leftRoom1();
void update_lvl1_leftRoom1();

void init_lvl1_leftRoom2();
void draw_lvl1_leftRoom2();
void update_lvl1_leftRoom2();

void init_lvl1_leftRoomFinal();
void draw_lvl1_leftRoomFinal();
void update_lvl1_leftRoomFinal();

void winLevel();

#endif