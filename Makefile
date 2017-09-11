.PHONY: all
all: game.nes

OBJ_FILES = src/main.o src/intro.o src/controller.o src/pentlysound.o src/pentlymusic.o src/musicseq.o
FCEUX = fceux

src/musicseq.s: sound/music.pently
	util/pentlyas.py --period-region pal --periods 76 $< -o $@
	sed -ie "s#../../src/pentlyseq.inc#pentlyseq.inc#" $@

%.o: %.s
	ca65 --auto-import -t nes -I inc -o $@ $< -g

game.nes: $(OBJ_FILES)
	ld65 $(OBJ_FILES) -C nesfile.ini -m game.map -o game.nes

clean:
	rm -f $(OBJ_FILES) game.map game.nes src/musicseq.s

run: game.nes
	$(FCEUX) --pal 1 --nogui 1 --opengl 0 game.nes
