#include "states.h"
#include "../helpers/gba.h"
#include "game.h"
#include "start.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
#include "instructions.h"

GameState state;

/*******************************
Generics & State Defs
*******************************/
void runState() {
    switch (state) {
        case GS_START:
            updateStart();
            break;

        case GS_INSTRUCT:
            updateInstructions();

        case GS_PAUSE:
            updatePause();
            break;

        case GS_GAME:
            updateGame();
            break;

        case GS_LOSE:
            updateLose();
            break;
        case GS_WIN:
            updateWin();
            break;
    }
}

void enterState(GameState newState) {
    switch (newState) {
        case GS_START:
            initStart();
            state = GS_START;
            break;
        
        case GS_INSTRUCT:
            initIntructions();
            state = GS_INSTRUCT;

        case GS_PAUSE:
            innitPause();
            state = GS_PAUSE;
            break;

        case GS_GAME:
            initGame();
            state = GS_GAME;
            break;

        case GS_LOSE:
            innitLose();
            state = GS_LOSE;
            break;

        case GS_WIN:
            innitWin();
            state = GS_WIN;
            break;
    }
}

void resumeState(GameState newState) {
    switch (newState) {
    case GS_GAME:
        resumeGame();
        state = GS_GAME;
        break;
    }
}
