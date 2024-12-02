#ifndef LEVELMANAGER_H
#define LEVELMANAGER_H

typedef enum {
    LVL1,
    LVL2,
} LEVEL;

extern LEVEL currLevel;

void initLevelManager();
void runLevel();
void enterLevel(LEVEL newLevel);

#endif