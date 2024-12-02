#include "player.h"
#include "playerAnim.h"

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

void playerMovement() {
    int rightX = player.x + player.width - 1;
    int leftX = player.x;
    int topY = player.y;
    int botY = player.y + player.height - 1;

    if (player.dashCooldownTimer > 0) { player.dashCooldownTimer--; }

    // dashing feat. chatGPT
    if (player.isDashing) {
        // Update player position
        player.x += player.xVel;
        player.y += player.yVel;

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

    if (BUTTON_HELD(BUTTON_LEFT) && player.x > 0) {
        playerSwitchDirections(LEFT);
        if (colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, botY)) {
            player.x -= player.xVel;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.x + player.width - 1 < MapWidth) {
        playerSwitchDirections(RIGHT);
        if (colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, botY)) {
            player.x += player.xVel;
        }
    }
    if (BUTTON_HELD(BUTTON_UP) && player.y > 0) {
        playerSwitchDirections(UP);
        if (colorAt(leftX, topY - player.yVel) && colorAt(rightX , topY - player.yVel)) {
            player.y -= player.yVel;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && player.y + player.height - 1 < MapHeight) {
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
        mgba_printf("pew");
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

    // // screen shake
    // REG_BG1HOFF = rand() % 100 - 1;
    // REG_BG1VOFF = rand() % 100 - 1; 
}

void playerTakeDamage(int dmg) {
    if (player.isInvulnerable) { return; }
    player.health -= dmg;
    playerMakeInvulnerable();

    // game over
    if (player.health <= 0) { gameOver(); }
}

void playerApplyRecoil(int direction, int recoilForce) {
    
}

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