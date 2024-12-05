#include "camera.h"
#include "player.h"

#include "../helpers/mode0.h"

#include "../states/game.h"

//locals
int mapOffsetX = 96;
int mapOffsetY = 112;

int screenshakeTimer = 0;
int screenshakeIntensity = 0;
//int restrictionAmount = 20;     // so when the camera goes close to the enge it doesn't show too much blank space by only centering the player

// testing kinda
int playAreaX = 304;
int playAreaY = 264;

void initCamera() {
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

 void updateCamera() {
    // setting camera based on new player position
    hOff = player.x - (SCREENWIDTH - player.width) / 2;
    vOff = player.y - (SCREENHEIGHT - player.height) / 2;

    // restrict player movement to map
    // if (player.x < 0 + restrictionAmount) { player.x = 0; }
    // if (player.y < 0 + restrictionAmount) { player.y = 0; }
    // if (player.x + player.width > MapWidth) { player.x = MapWidth - player.width; }
    // if (player.y + player.height > MapHeight) { player.y = MapHeight - player.height; }

    // restrict camera movement to map
    if (hOff < mapOffsetX) { hOff = mapOffsetX; }
    if (vOff < mapOffsetY) { vOff = mapOffsetY; }
    if (hOff > (mapOffsetX + playAreaX - SCREENWIDTH)) { hOff = mapOffsetX + playAreaX - SCREENWIDTH; }
    if (vOff > (mapOffsetY + playAreaY - SCREENHEIGHT)) { vOff = mapOffsetY + playAreaY - SCREENHEIGHT; }

    applyScreenshake();
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

void applyScreenshake() {
    if (screenshakeTimer <= 0) { return; }

    int shakeX = (rand() % (screenshakeIntensity * 1 + 1)) - screenshakeIntensity;
    int shakeY = (rand() % (screenshakeIntensity * 1 + 1)) - screenshakeIntensity;

    hOff += shakeX;
    vOff += shakeY;

    screenshakeTimer--;
}

void triggerScreenshake(int duration, int intensity) {
    screenshakeTimer = duration;
    screenshakeIntensity = intensity;
}