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
    int skillSwitchCooldown;

    int moveType;
    int direction;

    int health;
    int iFrames;
    int isInvulnerable;

    int isDashing;
    int dashTimer;
    int dashCooldownTimer;
    int isRecoiling;

    int currAttackType;
} PLAYER;

#define MAX_PLAYER_HEALTH 3
#define SWITCH_SKILL_TIME 2 * 60    // X seconds * 60
#define IFRAME_AMOUNT 50

#define P_NORMAL_SPEED 1
#define P_DASH_SPEED 3
#define P_DASH_DURATION 15
#define P_DASH_COOLDOWN 30

extern PLAYER player;
typedef enum {IDLE } MOVE_TYPE;

void initPlayer();
void updatePlayer();
void setPlayerPos(int x, int y);

void playerMovement();
void playerSkills();
void playerDash();
void playerTakeDamage(int dmg);

void playerGetRandomSkill();
void playerSwitchDirections(DIRECTION dir);
void playerResetSkillTime(BULLET_TYPE type);
void playerCalculateIFrames();
void playerMakeInvulnerable();

#endif