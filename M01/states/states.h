#ifndef STATES
#define STATES

typedef enum {
    GS_START,
    GS_PAUSE,
    GS_GAME,
    GS_LOSE,
    GS_WIN,
    GS_INSTRUCT,
} GameState;

extern GameState state;   // current state

// function prototypes
void runState();
void enterState(GameState newState);

#endif
