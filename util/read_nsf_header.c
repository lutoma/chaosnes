#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

struct nsf_header {
	uint8_t magic[5];
	uint8_t version;
	uint8_t total_songs;
	uint8_t starting_song;

	uint8_t load_addr[2];
	uint8_t init_addr[2];
	uint8_t play_addr[2];

	uint8_t name[32];
	uint8_t artist[32];
	uint8_t copyright[32];

	uint16_t play_speed_ntsc;
	uint8_t bank_switch_values[8];
	uint16_t play_speed_pal;

	uint8_t ntsc_pal;
};

int main() {
	FILE* fp = fopen("sound/intro.nsf", "rb");
	if(!fp) {
		fprintf(stderr, "Couldn't open NSF file\n");
		exit(EXIT_FAILURE);
	}

	fseek(fp, 0L, SEEK_END);
	long int sz = ftell(fp);
	rewind(fp);

	void* dest = malloc(sz);
	size_t read = fread(dest, sz, 1, fp);

	struct nsf_header* header = (struct nsf_header*)dest;

	printf("Header: %.4s\n", header->magic);
	printf("Version: %d\n", header->version);
	printf("Total songs: %d\n", header->total_songs);
	printf("Starting song: %d\n", header->starting_song);

	printf("Load addr (lo): 0x%x\n", header->load_addr[0]);
	printf("Init addr (lo): 0x%x\n", header->init_addr[0]);
	printf("Play addr (lo): 0x%x\n", header->play_addr[0]);
	printf("Load addr (hi): 0x%x\n", header->load_addr[1]);
	printf("Init addr (hi): 0x%x\n", header->init_addr[1]);
	printf("Play addr (hi): 0x%x\n", header->play_addr[1]);

	printf("Name: %s\n", (char*)&header->name);
	printf("Artist: %s\n", (char*)&header->artist);
	printf("Copyright: %s\n", (char*)&header->copyright);

	printf("Play speed (PAL): 0x%x\n", header->play_speed_pal);
	printf("Play speed (NTSC): 0x%x\n", header->play_speed_ntsc);

	for(int i = 0; i < 8; i++) {
		printf("Bank switch value (%d): 0x%x\n", i + 1, header->bank_switch_values[i]);
	}

	free(dest);
	fclose(fp);
}