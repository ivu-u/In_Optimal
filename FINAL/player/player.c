#include "player.h"
#include "playerAnim.h"

#include "../playerAttacks/bulletManager.h"

#include "../helpers/sprites.h"

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
    playerGetRandomSkill();

    player.health = MAX_PLAYER_HEALTH;

    initPlayerAnim();
    initBulletManager();
}

void updatePlayer() {
    playerMovement();
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
    // can only cast after cooldown is over
    if (player.skillCooldown > 0) { player.skillCooldown -= 1; return; }

    if (BUTTON_PRESSED(BUTTON_A)) {
        spawnBullet(player.fireX, player.fireY);
        playerResetSkillTime(player.currAttackType);
    }
}

void playerTakeDamage(int dmg) {
    player.health -= dmg;

    if (player.health <= 0) {
        // game over
        gameOver();
    }
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
            player.skillCooldown = 1;
            break;
        case HEAVY:
            player.skillCooldown = 1;
            break;
        case CHARGE:
            player.skillCooldown = 1;
            break;
    }
    player.skillCooldown *= 60;
}