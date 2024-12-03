#ifndef PLAYERANIM_H
#define PLAYERANIM_H

#define TRAIL_LENGTH 5
#define TRAIL_LIFESPAN 10

typedef struct {
    int X[TRAIL_LENGTH];  // Store past X positions
    int Y[TRAIL_LENGTH];  // Store past Y positions
    int lifespan[TRAIL_LENGTH];
    int index;  // Current trail index for updating positions
} PLAYER_TRAIL;

void initPlayerAnim();
void drawPlayer();
void drawTrail();

void calculateFrames();
void trailEffectLogic();

#endif