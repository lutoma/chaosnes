.PHONY: all
all: game.nes

%.o: %.s
	ca65 -o $@ $< -l

game.nes: main.o
	ld65 main.o -C nesfile.ini -m game.map -o game.nes

clean:
	rm -f game.nes main.o game.map main.lst

run: game.nes
	fceux --pal 1 --nogui 1 --opengl 0 game.nes
