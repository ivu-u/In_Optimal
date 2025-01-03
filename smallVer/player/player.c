#include "player.h"
#include "playerMovement.h"
#include "playerAnim.h"
#include "camera.h"

#include "../playerAttacks/bulletManager.h"

#include "../helpers/sprites.h"
#include "../helpers/mode0.h"

#include "../states/game.h"

// externs
PLAYER player;

void initPlayer() {
    player.xVel = 1;
    player.yVel = 1;

    player.width = 12;
    player.height = 18;

    player.moveType = IDLE;
    playerSwitchDirections(LEFT);

    // for now i'll manually set this
    //playerGetRandomSkill();
    player.currAttackType = HEAVY;
    player.skillSwitchCooldown = SWITCH_SKILL_TIME;

    player.health = MAX_PLAYER_HEALTH;
    player.iFrames = 0;

    player.isDashing = 0;
    player.dashTimer = 0;
    player.dashCooldownTimer = 0;

    initPlayerAnim();
    initBulletManager();
}

void updatePlayer() {
    playerMovement();
    if (player.isInvulnerable) { playerCalculateIFrames(); }
    playerSkills();
    drawPlayer();
    updateBullets();
}

void setPlayerPos(int x, int y) {
    player.x = x;
    player.y = y;
}

// -----------

void playerSkills() {
    // dash
    if (BUTTON_PRESSED(BUTTON_B) && player.dashCooldownTimer <= 0) { startPlayerDash(); }

    // can only cast after cooldown is over
    if (player.skillCooldown > 0) { player.skillCooldown -= 1; return; }

    if (BUTTON_PRESSED(BUTTON_A)) {
        spawnBullet(player.fireX, player.fireY);
        playerResetSkillTime(player.currAttackType);
    }

    // random skill after X seconds
    // if (player.skillSwitchCooldown > 0) { player.skillSwitchCooldown -= 1; return; }
    // playerGetRandomSkill();
}

void playerTakeDamage(int dmg) {
    if (player.isInvulnerable) { return; }
    player.health -= dmg;
    playerMakeInvulnerable();

    // game over
    if (player.health <= 0) { gameOver(); }
}

// -----------

void playerGetRandomSkill() {
    int val = rand() % 3;

    if (val == 0) { 
        player.currAttackType = QUICK; 
        playerResetSkillTime(QUICK);
    } else if (val == 1) { 
        player.currAttackType = HEAVY; 
        playerResetSkillTime(HEAVY);
    } else if (val == 2) { 
        player.currAttackType = CHARGE; 
        playerResetSkillTime(CHARGE);
    }

    // reset timer
    player.skillSwitchCooldown = SWITCH_SKILL_TIME;
}

void playerResetSkillTime(BULLET_TYPE type) {
    switch(type) {
        case QUICK:
            player.skillCooldown = .4;
            break;
        case HEAVY:
            player.skillCooldown = .6;
            break;
        case CHARGE:
            player.skillCooldown = 0;
            break;
    }
    player.skillCooldown *= 60;
}


//-----
void playerCalculateIFrames() {
    if (player.iFrames > 0) { player.iFrames--; return; }
    player.isInvulnerable = 0;
}

void playerMakeInvulnerable() {
    player.isInvulnerable = 1;
    player.iFrames = IFRAME_AMOUNT;
}