#include "level3.h"

#include "../player/player.h"

#include "../enemies/enemyManager.h"

#include "../helpers/mode0.h"

#include "../states/game.h"

#include "../gameBgs/pathway.h"

void init_lvl3_room1() {
    // set up game background
    draw_lvl3_room1();
    setMapDimensions(256, 256);
    setPlayerPos(112, 232);

    // initialize enemies (number, type, position)
    enemy_manager.numBallers = 4;
    initEnemies();
    m_setBallerPos(40, 0);
    m_setBallerPos(144, 144);
    m_setBallerPos(10, 10);
    m_setBallerPos(100, 100);
}

void draw_lvl3_room1() {  }