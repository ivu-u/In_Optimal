#include "playerAnim.h"
#include "player.h"

#include "../helpers/sprites.h"

/***********************************************************
 * Handles all player animation logic. Reads from player.h
***********************************************************/

// local
SPRITE playerSprite;

void initPlayerAnim() {
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
    shadowOAM[playerSprite.oamIndex].attr0 = ATTR0_Y(player.y) | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[playerSprite.oamIndex].attr1 = ATTR1_X(player.x) | ATTR1_MEDIUM;
    shadowOAM[playerSprite.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 0);

    if (player.direction == RIGHT) {
        shadowOAM[playerSprite.oamIndex].attr1 |= ATTR1_HFLIP;
    }
}