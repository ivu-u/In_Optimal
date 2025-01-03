#ifndef PLAYERMOVEMENT_H
#define PLAYERMOVEMENT_H

#include "../helpers/sprites.h"

void playerMovement();

void playerWalking();
void playerDashing();
int playerRecoiling();

void startPlayerDash();
void playerApplyRecoil(int direction, int recoilForce);
void playerSwitchDirections(DIRECTION dir);

#endif