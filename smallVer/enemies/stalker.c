#include "stalker.h"

#include "../states/game.h"

#include "../player/player.h"
#include "../playerAttacks/bulletManager.h"

#include "../helpers/sprites.h"

void initStalkers() {
    for (int i = 0; i < enemy_manager.numStalkers; ++i) {
        ENEMY_DATA* e = &stalkers[i];
        e->width = STALKER_WIDTH;
        e->height = STALKER_HEIGHT;
        e->oamIndex = STALKER_OAM + i;
        e->health = 3;  // Health for the stalker

        // Initial position and velocity will be set later
        e->xVel = 1;
        e->yVel = 1;

        //e->active = 0;  // Not active until spawned
        e->moveTimer = 0;
        e->moveDelay = (rand() % 180) + 60;  // Random delay between 1 to 3 seconds (60 FPS)
        e->moveDuration = 0;
        e->isMoving = 0;
    }
}

void updateStalkers() {
    for (int i = 0; i < enemy_manager.numStalkers; ++i) {
        ENEMY_DATA* e = &stalkers[i];
        if (!e->active) continue;

        if (e->isMoving) {
            // Move for 1 second (60 frames)
            moveStalker(e);
            e->moveDuration++;

            if (e->moveDuration >= 60) {
                e->isMoving = 0;          // Stop moving after 1 second
                e->moveTimer = 0;         // Reset delay timer
                e->moveDuration = 0;      // Reset movement duration
                e->moveDelay = (rand() % 180) + 60;  // Set new random delay
            }
        } else {
            // Wait for the delay timer to reach the moveDelay before moving
            e->moveTimer++;
            if (e->moveTimer >= e->moveDelay) {
                e->isMoving = 1;  // Start moving
                e->moveDuration = 0;
            }
        }

        drawStalker(e);
        checkStalkerCollision(e);
    }
}

void drawStalker(ENEMY_DATA* e) {
    shadowOAM[e->oamIndex].attr0 = ATTR0_Y(e->y - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[e->oamIndex].attr1 = ATTR1_X(e->x - hOff) | ATTR1_SMALL;
    shadowOAM[e->oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | ATTR2_TILEID(2, 15);
}

/// @brief Moves the stalker enemy toward the player's position
void moveStalker(ENEMY_DATA* e) {
    int dx = player.x - e->x;
    int dy = player.y - e->y;

    // Normalize the direction vector to move towards the player
    if (dx != 0) e->xVel = (dx > 0) ? 1 : -1;
    if (dy != 0) e->yVel = (dy > 0) ? 1 : -1;

    // Update position based on velocity
    e->x += e->xVel;
    e->y += e->yVel;

    // Ensure it doesn't go out of bounds
    if (e->x < 0) e->x = 0;
    if (e->y < 0) e->y = 0;
    if (e->x > MapWidth - STALKER_WIDTH) e->x = MapWidth - STALKER_WIDTH;
    if (e->y > MapHeight - STALKER_HEIGHT) e->y = MapHeight - STALKER_HEIGHT;
}

void setStalkerPos(int x, int y) {
    // Find the next available stalker slot and activate it
    for (int i = 0; i < enemy_manager.numStalkers; ++i) {
        ENEMY_DATA* e = &stalkers[i];
        if (e->active) continue;

        e->x = x;
        e->y = y;
        e->active = 1;
        return;
    }
}

void checkStalkerCollision(ENEMY_DATA* e) {
    if (collision(e->x, e->y, STALKER_WIDTH, STALKER_HEIGHT, player.x, player.y, player.width, player.height)) {
        playerTakeDamage(1);
    }

    for (int i = 0; i < MAX_BULL_SIZE; ++i) {
        BULLET* b = &bullets[i];
        if (!(b->active)) { continue; }

        if (collision(e->x, e->y, STALKER_WIDTH, STALKER_HEIGHT, b->x, b->y, b->width, b->height)) {
            eraseStalker(e);
            //TO-DO: jank fix
            b->active = 0;
            shadowOAM[b->oamIndex].attr0 |= ATTR0_HIDE;
        }
    }
}

void eraseStalker(ENEMY_DATA* e) {
    e->active = 0;
    shadowOAM[e->oamIndex].attr0 = ATTR0_HIDE;  // Hide the sprite
    enemyKilled();
}