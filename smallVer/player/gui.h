#ifndef GUI_H
#define GUI_H

#include "../helpers/gba.h"

typedef struct {
    int x, y;
} GUI;

void initGui();
void drawGui();

void drawHealth();
void drawAttackType();

#endif