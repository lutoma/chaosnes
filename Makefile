.PHONY: all clean run
all: game.nes

OBJ_FILES = src/main.o src/intro.o src/mainmenu.o src/controller.o src/pentlysound.o src/pentlymusic.o src/musicseq.o src/paldetect.o src/level.o
FCEUX = fceux

src/musicseq.s: sound/music.pently
	util/pentlyas.py --period-region pal --periods 76 $< -o $@
	sed -ie "s#../../src/pentlyseq.inc#pentlyseq.inc#" $@

src/main.o: sprites/tiles.chr
sprites/tiles.chr: sprites/tiles.png
	util/pilbmp2nes.py -i $< -o $@

%.o: %.s
	ca65 --auto-import -t nes -I inc -o $@ $< -g

game.nes: $(OBJ_FILES)
	ld65 $(OBJ_FILES) -C nesfile.ini -m game.map -o game.nes

clean:
	rm -f $(OBJ_FILES) game.map game.nes src/musicseq.s src/musicseq.se sprites/tiles.chr

run: game.nes
	$(FCEUX) --pal 1 --nogui 1 --opengl 0 game.nes
