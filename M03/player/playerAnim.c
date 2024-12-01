#include "playerAnim.h"
#include "player.h"
#include "../helpers/sprites.h"

/***********************************************************
 * Handles all player animation logic. Reads from player.h
***********************************************************/

// local
SPRITE playerSprite;
int numWalkSideFrames = 4;
int numWalkDownFrames = 4;
int numWalkUpFrames = 2;

void initPlayerAnim() {
    playerSprite.shape = ATTR0_TALL;
    playerSprite.size = ATTR1_MEDIUM;

    playerSprite.hide = 0;
    playerSprite.animSpeed = 60;
    playerSprite.timeUntilNextFrame = playerSprite.animSpeed;

    //playerSprite.numFrames = 1;
    playerSprite.currentFrame = 0;

    playerSprite.isAnimating = 0;
    playerSprite.hide = 0;  
    playerSprite.oamIndex = PLAYER_OAM;
}

void drawPlayer() {
    calculateFrames();

    shadowOAM[playerSprite.oamIndex].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_4BPP | playerSprite.shape;
    shadowOAM[playerSprite.oamIndex].attr1 = ATTR1_X(player.x - hOff) | playerSprite.size;
    shadowOAM[playerSprite.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

    if (player.direction == UP) {
        shadowOAM[playerSprite.oamIndex].attr2 = ATTR2_TILEID(playerSprite.currentFrame, 4);
    } else if (player.direction == DOWN) {
        shadowOAM[playerSprite.oamIndex].attr2 = ATTR2_TILEID(playerSprite.currentFrame, 8);
    } else {
        shadowOAM[playerSprite.oamIndex].attr2 = ATTR2_TILEID(playerSprite.currentFrame, 0);
    }

    if (player.direction == RIGHT) {
        shadowOAM[playerSprite.oamIndex].attr1 |= ATTR1_HFLIP;
    }
}

void calculateFrames() {
    if (playerSprite.timeUntilNextFrame > 0) { playerSprite.timeUntilNextFrame--; return; }
    playerSprite.timeUntilNextFrame = playerSprite.animSpeed;

    switch(player.direction) {
        case UP:
            playerSprite.currentFrame = (playerSprite.currentFrame + 1) % numWalkUpFrames;
            break;

        case DOWN:
            playerSprite.currentFrame = (playerSprite.currentFrame + 1) % numWalkDownFrames;
            break;

        default:
            playerSprite.currentFrame = (playerSprite.currentFrame + 1) % numWalkSideFrames;
            break;
    }
}