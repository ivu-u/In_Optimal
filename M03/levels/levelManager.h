#ifndef LEVELMANAGER_H
#define LEVELMANAGER_H

typedef enum {
    LVL1,
    LVL2,
} LEVEL;

extern LEVEL currLevel;

typedef enum {
    ROOM1,
    ROOM2,
    ROOM3,
    ROOM4
} ROOMS;

extern ROOMS currRoom;

void initLevelManager();
void runLevel();
void enterLevel(LEVEL newLevel);
void enterRoom(ROOMS room);

void allEnemiesCleared();
void drawLevelMaps();

#endif