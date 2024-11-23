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

    // TEMP
    player.width = 15;
    player.height = 20;

    player.moveType = IDLE;
    player.direction = RIGHT;

    // for now i'll manually set this
    player.currAttackType = QUICK;

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
        player.direction = LEFT;
        if (colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, botY)) {
            player.x -= player.xVel;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.x + player.width - 1 < MapWidth) {
        player.direction = RIGHT;
        if (colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, botY)) {
            player.x += player.xVel;
        }
    }
    if (BUTTON_HELD(BUTTON_UP) && player.y > 0) {
        player.direction = UP;
        if (colorAt(leftX, topY - player.yVel) && colorAt(rightX , topY - player.yVel)) {
            player.y -= player.yVel;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && player.y + player.height - 1 < MapHeight) {
        player.direction = DOWN;
        if (colorAt(leftX, botY + player.yVel) && colorAt(rightX, botY + player.yVel)) {
            player.y += player.yVel;
        }
    }
}

void playerSkills() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        spawnBullet();
    }
}

void playerTakeDamage(int dmg) {
    player.health -= dmg;
    mgba_printf("dmg");

    if (player.health <= 0) {
        // game over
        gameOver();
    }
}