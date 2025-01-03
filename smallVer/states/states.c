#include "states.h"
#include "../helpers/gba.h"
#include "game.h"
#include "start.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
#include "instructions.h"
#include "cutscene.h"
#include "../helpers/mode0.h"

GameState state;

/*******************************
Generics & State Defs
*******************************/
void runState() {
    switch (state) {
        case GS_CUTSCENE:
            updateCutscene();
            break;

        case GS_START:
            updateStart();
            break;

        case GS_INSTRUCT:
            updateInstructions();
            break;

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
    hOff = 0;
    vOff = 0;
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    switch (newState) {
        case GS_CUTSCENE:
            initCutscene();
            state = GS_CUTSCENE;
            break;

        case GS_START:
            initStart();
            state = GS_START;
            break;
        
        case GS_INSTRUCT:
            initIntructions();
            state = GS_INSTRUCT;
            break;

        case GS_PAUSE:
            initPause();
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
