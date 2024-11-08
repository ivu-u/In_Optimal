#ifndef PLAYER_H
#define PLAYER_H

#include "../helpers/gba.h"

typedef struct {
    int x, y;
    int xVel, yVel;
    int height, width;

    int moveType;
    int direction;

    int lives;

    int currAttackType;
} PLAYER;

extern PLAYER player;
typedef enum {IDLE } MOVE_TYPE;

void initPlayer();
void updatePlayer();
void drawPlayer();
void playerMovement();
void playerSkills();

#endif