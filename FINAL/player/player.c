#include "player.h"
#include "playerAnim.h"
#include "camera.h"

#include "../playerAttacks/bulletManager.h"

#include "../helpers/sprites.h"
#include "../helpers/mode0.h"

#include "../states/game.h"

// externs
PLAYER player;

// local
int rightX = 0;
int leftX = 0;
int topY = 0;
int botY = 0;

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

void playerMovement() {
    rightX = player.x + player.width - 1;
    leftX = player.x;
    topY = player.y;
    botY = player.y + player.height - 1;

    if (player.dashCooldownTimer > 0) { player.dashCooldownTimer--; }

    //  RECOIL ---
    if (player.isRecoiling) {
        // player.x += player.xVel;
        // player.y += player.yVel;
        int newX = player.x + player.xVel;
        int newY = player.y + player.yVel;

        // Check collision before applying recoil movement
        if (colorAt(newX, topY) && colorAt(newX, botY)) {
            player.x = newX;
        }
        if (colorAt(leftX, newY) && colorAt(rightX, newY)) {
            player.y = newY;
        }

        player.xVel *= 0.9;
        player.yVel *= 0.9;

        // Decrease recoil timer and reset when done
        player.recoilTimer--;
        if (player.recoilTimer <= 0) {
            player.isRecoiling = 0;
            player.xVel = 1;
            player.yVel = 1;
        }
        return;
    }

    // DASHING feat. chatGPT ---
    if (player.isDashing) {
        trailEffectLogic();

        // Update player position
        // player.x += player.xVel;
        // player.y += player.yVel;

        int newX = player.x + player.xVel;
        int newY = player.y + player.yVel;

        // Check collision before applying dash movement
        if (colorAt(newX, topY) && colorAt(newX, botY)) {
            player.x = newX;
        }
        if (colorAt(leftX, newY) && colorAt(rightX, newY)) {
            player.y = newY;
        }

        player.dashTimer--; // decr dash timer
        if (player.dashTimer <= 0) { player.isDashing = 0; }
    } else {
        // Smooth deceleration if dash ended
        if (player.xVel > 1 || player.yVel > 1) {
            player.xVel *= 0.9;  // Smoothly reduce speed
            player.yVel *= 0.9;
        } else {
            player.xVel = 1;  // Return to normal speed
            player.yVel = 1;
        }
    }

    if (player.isDashing) return;

    // WALKING ---
    if (BUTTON_HELD(BUTTON_LEFT) && player.x ) {
        playerSwitchDirections(LEFT);
        if (colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, botY)) {
            player.x -= player.xVel;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.x) {
        playerSwitchDirections(RIGHT);
        if (colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, botY)) {
            player.x += player.xVel;
        }
    }
    if (BUTTON_HELD(BUTTON_UP) && player.y) {
        playerSwitchDirections(UP);
        if (colorAt(leftX, topY - player.yVel) && colorAt(rightX , topY - player.yVel)) {
            player.y -= player.yVel;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && player.y) {
        playerSwitchDirections(DOWN);
        if (colorAt(leftX, botY + player.yVel) && colorAt(rightX, botY + player.yVel)) {
            player.y += player.yVel;
        }
    }
}

void playerSkills() {
    // dash
    if (BUTTON_PRESSED(BUTTON_B) && player.dashCooldownTimer <= 0) { playerDash(); }

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

void playerDash() {
    if (player.dashCooldownTimer > 0) { return; }

    player.isDashing = 1;
    player.dashTimer = P_DASH_DURATION;
    player.dashCooldownTimer =P_DASH_COOLDOWN;

    switch (player.direction) {
        case UP:
            player.xVel = 0;
            player.yVel = -P_DASH_SPEED;
            break;
        
        case DOWN:
            player.xVel = 0;
            player.yVel = P_DASH_SPEED;
            break;
        
        case LEFT:
            player.xVel = -P_DASH_SPEED;
            player.yVel = 0;
            break;
        
        case RIGHT:
            player.xVel = P_DASH_SPEED;
            player.yVel = 0;
            break;
    }

    // screen shake
    triggerScreenshake(10, 2);
}

void playerTakeDamage(int dmg) {
    if (player.isInvulnerable) { return; }
    player.health -= dmg;
    playerMakeInvulnerable();

    // game over
    if (player.health <= 0) { gameOver(); }
}

void playerApplyRecoil(int direction, int recoilForce) {
    switch (direction) {
        case UP:
            player.yVel = recoilForce;
            player.xVel = 0;
            break;

        case DOWN:
            player.yVel = -recoilForce;
            player.xVel = 0;
            break;

        case LEFT:
            player.xVel = recoilForce;
            player.yVel = 0;
            break;

        case RIGHT:
            player.xVel = -recoilForce;
            player.yVel = 0;
            break;
    }

    player.isRecoiling = 1;
    player.recoilTimer = 12;  // Frames of recoil
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

void playerSwitchDirections(DIRECTION dir) {
    switch (dir) {
        case UP:
            player.fireX = player.x + 5;
            player.fireY = player.y + 4;
            player.direction = UP;
            break;
        
        case DOWN:
            player.fireX = player.x + 5;
            player.fireY = player.y + 11;
            player.direction = DOWN;
            break;

        case LEFT:
            player.fireX = player.x - 2;
            player.fireY = player.y + 6;
            player.direction = LEFT;
            break;

        case RIGHT:
            player.fireX = player.x + 13;
            player.fireY = player.y + 6;
            player.direction = RIGHT;
            break;
    }
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

void playerCalculateIFrames() {
    if (player.iFrames > 0) { player.iFrames--; return; }
    player.isInvulnerable = 0;
}

void playerMakeInvulnerable() {
    player.isInvulnerable = 1;
    player.iFrames = IFRAME_AMOUNT;
}