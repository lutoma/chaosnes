.PHONY: all
all: game.nes

OBJ_FILES = src/main.o src/intro.o src/nsfplayer.o src/controller.o
FCEUX = fceux

%.o: %.s
	ca65 --auto-import -t nes -I inc -o $@ $< -g

game.nes: $(OBJ_FILES)
	ld65 $(OBJ_FILES) -C nesfile.ini -m game.map -o game.nes

clean:
	rm -f $(OBJ_FILES) game.map game.nes

run: game.nes
	$(FCEUX) --pal 1 --nogui 1 --opengl 0 game.nes
