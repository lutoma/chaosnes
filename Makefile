.PHONY: all
all: game.nes

game.nes: game.c game.h
	cl65 -t nes game.c -o game.nes

clean:
	rm -f game.nes game.o

run: game.nes
	fceux --pal 1 --nogui 1 --opengl 0 game.nes