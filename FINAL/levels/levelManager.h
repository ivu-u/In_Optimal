#ifndef LEVELMANAGER_H
#define LEVELMANAGER_H

typedef enum {
    LVL1,
    LVL2,
} LEVEL;

extern LEVEL currLevel;

typedef enum {
    STARTROOM,
    LEFT1,
    LEFT2,
    LEFTFINAL
} ROOMS;

extern ROOMS currRoom;

void initLevelManager();
void runLevel();
void enterLevel(LEVEL newLevel);
void enterRoom(ROOMS room, int x, int y);

void allEnemiesCleared();
void drawLevelMaps();

#endif