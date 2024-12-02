#include "gui.h"
#include "../player/player.h"

#include "../helpers/sprites.h"

GUI gui;
int heartOams[3];
int timerOams[4];

void initGui() {
    gui.x = 3;
    gui.y = 3;

    for (int i = 0; i < player.health; ++i) { heartOams[i] = HEART_OAM + i; }

    for (int i = 0; i < 4; ++i) { timerOams[i] = BULL_TIMER_OAM + i; }
}

void drawGui() {
    drawHealth();
    drawAttackType();
}

void drawHealth() {
    int baseX = gui.x;
    int baseY = gui.y;

    for (int i = 0; i < MAX_PLAYER_HEALTH; ++i) {
        int xPos = baseX + (i * 17);
        shadowOAM[heartOams[i]].attr0 = ATTR0_Y(baseY) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[heartOams[i]].attr1 = ATTR1_X(xPos) | ATTR1_SMALL;

        if (i <= player.health - 1) { shadowOAM[heartOams[i]].attr2 = ATTR2_PALROW(15) | ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 30); }
        else { shadowOAM[heartOams[i]].attr2 = ATTR2_PALROW(15) | ATTR2_PRIORITY(0) | ATTR2_TILEID(2, 30); }
    }
}

void drawAttackType() {
    int boxX = gui.x;
    int boxY = gui.y + 16;

    // static box
    shadowOAM[B_TYPE_BOX_OAM].attr0 = ATTR0_Y(boxY) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[B_TYPE_BOX_OAM].attr1 = ATTR1_X(boxX) | ATTR1_SMALL;
    shadowOAM[B_TYPE_BOX_OAM].attr2 = ATTR2_PALROW(15) | ATTR2_PRIORITY(1) | ATTR2_TILEID(4, 30);

    // bull type
    int tileX = 7;  // quick is default
    if (player.currAttackType == HEAVY) { tileX += 2;}
    else if (player.currAttackType == CHARGE) { tileX += 4;}

    shadowOAM[B_TYPE_OAM].attr0 = ATTR0_Y(boxY) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[B_TYPE_OAM].attr1 = ATTR1_X(boxX) | ATTR1_SMALL;
    shadowOAM[B_TYPE_OAM].attr2 = ATTR2_PALROW(15) | ATTR2_PRIORITY(0) | ATTR2_TILEID(tileX, 30);
}