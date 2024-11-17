#include "playerAnim.h"
#include "player.h"

#include "../helpers/sprites.h"

/***********************************************************
 * Handles all player animation logic. Reads from player.h
***********************************************************/

// local
SPRITE playerSprite;

void initPlayerAnim() {
    playerSprite.shape = ATTR0_TALL;
    playerSprite.size = ATTR1_MEDIUM;

    playerSprite.hide = 0;
    playerSprite.animSpeed = 10;
    playerSprite.timeUntilNextFrame = playerSprite.animSpeed;

    playerSprite.numFrames = 1;
    playerSprite.currentFrame = 1;

    playerSprite.isAnimating = 0;
    playerSprite.hide = 0;

    playerSprite.oamIndex = PLAYER_OAM;
}

// temp
void drawPlayer() {
    shadowOAM[playerSprite.oamIndex].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_4BPP | playerSprite.shape;
    shadowOAM[playerSprite.oamIndex].attr1 = ATTR1_X(player.x - hOff) | playerSprite.size;
    shadowOAM[playerSprite.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 0);

    if (player.direction == RIGHT) {
        shadowOAM[playerSprite.oamIndex].attr1 |= ATTR1_HFLIP;
    }
}