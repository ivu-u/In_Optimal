PRODUCT_NAME       = Project

# You probably won't need to touch anything below here!!!
# The one exception is the cleanup stuff.

SOURCES 		   = $(wildcard *.c)

ARTSOURCES	   	   		= $(wildcard art/*.c)
CUTSCENESSOURCES	   	= $(wildcard cutscenes/*.c)
ENEMIESSOURCES	   	   	= $(wildcard enemies/*.c)
GAMEBGSSOURCES	   	   	= $(wildcard gameBgs/*.c)
HELPERSOURCES	   		= $(wildcard helpers/*.c)
LEVELSSOURCES			= $(wildcard levels/*.c)
LVL1_ARTSOURCES			= $(wildcard lvl1_Art/*.c)
MENUSCREENSOURCES		= $(wildcard menuScreens/*.c)
PLAYERSOURCES			= $(wildcard player/*.c)
PLAYERATTACKSSOURCES	= $(wildcard playerAttacks/*.c)
BEHAVIORSOURCES	  		= $(wildcard behavior/*.c)
STATESOURCES	   		= $(wildcard states/*.c)

ASMSOURCES         = $(wildcard *.asm)
AUDIOSOURCES       = $(wildcard *.wav)

DKPATH             = /opt/devkitpro
FIND               = find
COPY               = cp -r

# --- File Names
ELF_NAME           = $(PRODUCT_NAME).elf
ROM_NAME           = $(PRODUCT_NAME).gba
BIN_NAME           = $(PRODUCT_NAME)

#MODEL              = -mthumb-interwork -mthumb
MODEL              = -mthumb-interwork -marm -mlong-calls #This makes interrupts work
SPECS              = -specs=gba.specs

# --- Archiver
AS                 = $(DKPATH)/devkitARM/bin/arm-none-eabi-as
ASFLAGS            = -mthumb-interwork

# --- Compiler
CC                 = $(DKPATH)/devkitARM/bin/arm-none-eabi-gcc
CFLAGS             = $(MODEL) -O2 -Wall -pedantic -Wextra -std=c99 -save-temps -D_ROM=$(ROM_NAME)

# --- Linker
LD                 = $(DKPATH)/devkitARM/bin/arm-none-eabi-gcc
LDFLAGS            = $(SPECS) $(MODEL) -lm

# --- Object/Executable Packager
OBJCOPY            = $(DKPATH)/devkitARM/bin/arm-none-eabi-objcopy
OBJCOPYFLAGS       = -O binary

# --- ROM Fixer
GBAFIX             = $(DKPATH)/tools/bin/gbafix

# --- Delete
RM                 = rm -f

ASMOBJECTS = $(ASMSOURCES:.asm=.o)
AUDIOOBJECTS = $(AUDIOSOURCES:.wav=.c)
AUDIOHEADERS = $(AUDIOSOURCES:.wav=.h)

ARTOBJECTS = $(ARTSOURCES:.c=.o)
CUTSCENESOBJECTS = $(CUTSCENESSOURCES:.c=.o)
ENEMIESOBJECTS = $(ENEMIESSOURCES:.c=.o)
GAMEBGSOBJECTS = $(GAMEBGSSOURCES:.c=.o)
HELPEROBJECTS = $(HELPERSOURCES:.c=.o)
LEVELESOBJECTS	= $(LEVELSSOURCES:.c=.o)
LVL1_ARTOBJECTS	= $(LVL1_ARTSOURCES:.c=.o)
MENUSCREENSOBJECTS = $(MENUSCREENSOURCES:.c=.o)
PLAYEROBJECTS = $(PLAYERSOURCES:.c=.o)
PLAYERATTACKSOBJECTS = $(PLAYERATTACKSSOURCES:.c=.o)
BEHAVIOROBJECTS = $(BEHAVIORSOURCES:.c=.o)
STATEOBJECTS = $(STATESOURCES:.c=.o)

COBJECTS = $(SOURCES:.c=.o) $(AUDIOSOURCES:.wav=.o)
OBJECTS = $(COBJECTS) $(ASMOBJECTS) $(HELPEROBJECTS) $(BEHAVIOROBJECTS) $(STATEOBJECTS) $(ARTOBJECTS) $(PLAYEROBJECTS) $(MENUSCREENSOBJECTS) $(PLAYERATTACKSOBJECTS) $(ENEMIESOBJECTS) $(GAMEBGSOBJECTS) $(LEVELESOBJECTS) $(CUTSCENESOBJECTS) $(LVL1_ARTOBJECTS)


# --- Main build target

all : audio build

build : $(ROM_NAME)

# --- Build .elf file into .gba ROM file
$(ROM_NAME) : $(ELF_NAME)
	$(OBJCOPY) $(OBJCOPYFLAGS) $(ELF_NAME) $(ROM_NAME)
	$(GBAFIX) $(ROM_NAME)

# --- Build .o files into .elf file
$(ELF_NAME) : $(OBJECTS)
	$(LD) $^ $(LDFLAGS) -o $@

# -- Build .asm files into .o files
$(ASMOBJECTS) : %.o : %.asm
	$(AS) $(ASFLAGS) $< -o $@

# -- Build .c files into .o files
$(COBJECTS) : %.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

# -- Build .wav files into .c and .h files
$(AUDIOOBJECTS) : %.c : %.wav
	wav2c $< $@ $*

$(AUDIOHEADERS) : %.h : %.c


clean:
	$(RM) $(ROM_NAME) $(ELF_NAME) $(BIN_NAME)
	$(RM) $(AUDIOOBJECTS) $(AUDIOHEADERS)
	$(RM) *.sav
	$(FIND) . -type f \( -name '*.o' -o -name '*.i' -o -name '*.s' \) -delete

audio: $(AUDIOOBJECTS)
