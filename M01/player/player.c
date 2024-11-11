#include "player.h"
#include "playerAnim.h"

#include "../playerAttacks/bulletManager.h"

#include "../helpers/sprites.h"

#include "../states/game.h"

// externs
PLAYER player;

void initPlayer() {
    player.x = 50;
    player.y = 50;
    player.xVel = 1;
    player.yVel = 1;

    // TEMP
    player.width = 14;
    player.height = 23;

    player.moveType = IDLE;
    player.direction = RIGHT;

    // for now i'll manually set this
    player.currAttackType = QUICK;

    initPlayerAnim();
    initBulletManager();
}

void updatePlayer() {
    playerMovement();
    playerSkills();
    drawPlayer();
    updateBullets();
}

// -----------

void playerMovement() {
    if (BUTTON_HELD(BUTTON_LEFT) && player.x > 0) {
        player.direction = LEFT;
        player.x -= player.xVel;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.x + player.width - 1 < MAPWIDTH) {
        player.direction = RIGHT;
        player.x += player.xVel;
    }
    if (BUTTON_HELD(BUTTON_UP) && player.y > 0) {
        //player.direction = UP;
        player.y -= player.yVel;
    }
    if (BUTTON_HELD(BUTTON_DOWN) && player.y + player.height - 1 < MAPHEIGHT) {
        //player.direction = DOWN;
        player.y += player.yVel;
    }
}

void playerSkills() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        spawnBullet();
    }
}