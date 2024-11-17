#include "gui.h"
#include "../player/player.h"

#include "../helpers/sprites.h"

GUI gui;
int heartOams[3];

void initGui() {
    gui.x = 3;
    gui.y = 3;

    gui.score = 0;

    gui.heartOamIndex = HEART_OAM;

    for (int i = 0; i < player.health; ++i) {
        heartOams[i] = gui.heartOamIndex + (i + 1);
    }
}

void drawGui() {
    int baseX = gui.x;
    int baseY = gui.y;

    for (int i = 0; i < MAX_PLAYER_HEALTH; ++i) {
        int xPos = baseX + (i * 17);
        shadowOAM[heartOams[i]].attr0 = ATTR0_Y(baseY) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[heartOams[i]].attr1 = ATTR1_X(xPos) | ATTR1_SMALL;

        if (i <= player.health - 1) { shadowOAM[heartOams[i]].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 4); }
        else { shadowOAM[heartOams[i]].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(2, 4); }
    }
}