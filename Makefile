.PHONY: all
all: game.nes

OBJ_FILES = main.o intro.o audio.o

%.o: %.s
	ca65 -o $@ $< -g

game.nes: $(OBJ_FILES)
	ld65 $(OBJ_FILES) -C nesfile.ini -m game.map -o game.nes

clean:
	rm -f $(OBJ_FILES) game.map main.lst

run: game.nes
	fceux --pal 1 --nogui 1 --opengl 0 game.nes
