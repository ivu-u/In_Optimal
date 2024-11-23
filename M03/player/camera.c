#include "camera.h"
#include "player.h"

#include "../helpers/mode0.h"

#include "../states/game.h"

void initCamera() {
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

 void updateCamera() {
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    // setting camera based on new player position
    hOff = player.x - (SCREENWIDTH - player.width) / 2;
    vOff = player.y - (SCREENHEIGHT - player.height) / 2;

    // restrict player movement to map
    if (player.x < 0) { player.x = 0; }
    if (player.y < 0) { player.y = 0; }
    if (player.x + player.width > MapWidth) { player.x = MapWidth - player.width; }
    if (player.y + player.height > MapHeight) { player.y = MapHeight - player.height; }

    // restrict camera movement to map
    if (hOff < 0) { hOff = 0; }
    if (vOff < 0) { vOff = 0; }
    if (hOff > (MapWidth - SCREENWIDTH)) { hOff = MapWidth - SCREENWIDTH; }
    if (vOff > (MapHeight - SCREENHEIGHT)) { vOff = MapHeight - SCREENHEIGHT; }
}