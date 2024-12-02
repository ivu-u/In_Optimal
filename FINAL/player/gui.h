#ifndef GUI_H
#define GUI_H

#include "../helpers/gba.h"

typedef struct {
    int x, y;
    int score;
    u8 heartOamIndex;
} GUI;

void initGui();
void drawGui();

#endif