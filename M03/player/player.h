#ifndef PLAYER_H
#define PLAYER_H

#include "../helpers/gba.h"
#include "../helpers/sprites.h"
#include "../playerAttacks/bulletManager.h"

typedef struct {
    int x, y;
    int xVel, yVel;
    int height, width;

    int fireX, fireY;
    float skillCooldown;

    int moveType;
    int direction;

    int health;

    int currAttackType;
} PLAYER;

#define MAX_PLAYER_HEALTH 3

extern PLAYER player;
typedef enum {IDLE } MOVE_TYPE;

void initPlayer();
void updatePlayer();
void setPlayerPos(int x, int y);

void playerMovement();
void playerSkills();
void playerTakeDamage(int dmg);
void playerGetRandomSkill();
void playerSwitchDirections(DIRECTION dir);
void playerResetSkillTime(BULLET_TYPE type);

#endif