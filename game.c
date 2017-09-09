#include <nes.h>
#include <stdbool.h>
#include "game.h"

int frame = 0;
const int soundtrack[] = {0x193, 0x208};

void write_string(char *str, int x, int y) {
	ppu_set_cursor(x, y);

	while(*str) {
		ppu_io(*str);
		str++;
	}
}

void play_soundtrack(int frame) {
	if (frame == 60)
	{
		/* 60 frames have elapsed (1 second) so switch to a higher frequency.
		 * 0x193 becomes about 276.9Hz. */
		apu_pulse(0, 2, 0x93);
		apu_pulse(0, 3, 0x1);
	}
	else if (frame == 120)
	{
		/* Another 60 frames have elapsed, so switch back to lower frequency,
		 * and reset the frame counter. */
		apu_pulse(0, 2, 0x08);
		apu_pulse(0, 3, 0x2);
		frame = 0;
	}
}

void game_loop() {
	waitvblank();
	frame++;

	if(frame < 60) {
		write_string("boop", 1, 20);
	} else {
		write_string("beep", 1, 20);
	}
	ppu_set_scroll(0, 0);

	play_soundtrack(frame);
}

int main() {
	// We have to wait for VBLANK or we can't even use the PPU
	waitvblank();

	// http://en.wikipedia.org/wiki/List_of_video_game_console_palettes#NES
	ppu_set_color_back(0x0f);
	ppu_set_color_text(0x10);

	// Enable the screen
	poke(PPU_CTRL2, 8);

	/* Start making a noise, by turning on bit 0 of APU_STATUS,
	 * which activates "pulse channel 1" */
	apu_status(1);

	/* Set the pulse timer for the first pulse channel (0), via registers
	 * 2 and 3 (i.e. 0x4002 and 0x4003). Set the timer value to 0x208: */
	apu_pulse(0, 2, 0x08); /* Set low 8 bits of pulse timer to 8 (00001000) */
	apu_pulse(0, 3, 0x2); /* Set high 3 bits of pulse timer to 2 (010) */
	/* A timer value of 0x208 means a frequency of about 214.7Hz. */

	/* Set:
	 * 10...... = Duty Cycle is 50%;
	 * ..1..... = Disable length counter;
	 * ...1.... = Constant volume option;
	 * ....1111 = Maximum volume level.
	 */
	apu_pulse(0, 0, 0xBF);

	while(true) {
		game_loop();
	}

	while(true);
	return 0;
}

