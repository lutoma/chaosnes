#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>

#define RED(x) (((x)>>16)&0xFF)
#define GREEN(x) (((x)>>8)&0xFF)
#define BLUE(x) ((x)&0xFF)

#define NUMBER_OF_PALETTE_COLORS 64
#define PALETTE_SIZE 16

#define TILE_DATA_BYTE_COUNT 16
#define TILE_PIXEL_HEIGHT 8
#define TILE_PIXEL_WIDTH 8
/* Left most bit are the most significant bit of the byte.
 * So, subtract from 7 when indexing into the byte.
 */
#define TILE_BYTE_BIT_INDEX(x,i) (((x)&(0x1<<(7-(i))))>>(7-(i)))

#define PATTERN_TABLE_TILE_COUNT 256
#define PATTERN_TABLE_BYTE_COUNT (TILE_DATA_BYTE_COUNT*PATTERN_TABLE_TILE_COUNT)
#define NUMBER_OF_PATTERN_TABLES 2

#define PATTERN_TABLE_DISPLAY_WIDTH 128
#define BITMAP_WIDTH 256
#define BITMAP_HEIGHT 128
#define BYTES_PER_PIXEL 3
#define WIDTH_ALIGN 4
#define ALIGN_WIDTH(x) (((x) + WIDTH_ALIGN - 1) & ~(WIDTH_ALIGN-1))

#define INT32_TO_BYTE_ARRAY(n,arr) \
  do { \
    arr[0] = (n)&0xFF; \
    arr[1] = ((n)>>8)&0xFF; \
    arr[2] = ((n)>>16)&0xFF; \
    arr[3] = ((n)>>24)&0xFF; \
  } while(0)

#define INT24_TO_BYTE_ARRAY(n,arr) \
  do { \
    arr[0] = (n)&0xFF; \
    arr[1] = ((n)>>8)&0xFF; \
    arr[2] = ((n)>>16)&0xFF; \
  } while(0)


#define INT16_TO_BYTE_ARRAY(n,arr) \
  do { \
    arr[0] = (n)&0xFF; \
    arr[1] = ((n)>>8)&0xFF; \
  } while(0)

#define WRITE_INT32(file,buf) fwrite((buf),1,4,(file))
#define WRITE_INT16(file,buf) fwrite((buf),1,2,(file))
#define WRITE_BYTE(file,buf) fwrite((buf),1,1,(file))


unsigned int palette_colors[NUMBER_OF_PALETTE_COLORS] =
{
0x525252,0x000080,0x08008A,0x2C007E,0x4A004E,0x500006,0x440000,0x260800,
0x0A2000,0x002E00,0x003200,0x00260A,0x001C48,0x000000,0x000000,0x000000,
0xA4A4A4,0x0038CE,0x3416EC,0x5E04DC,0x8C00B0,0x9A004C,0x901800,0x703600,
0x4C5400,0x0E6C00,0x007400,0x006C2C,0x005E84,0x000000,0x000000,0x000000,
0xFFFFFF,0x4C9CFF,0x7C78FF,0xA664FF,0xDA5AFF,0xF054C0,0xF06A56,0xD68610,
0xBAA400,0x76C000,0x46CC1A,0x2EC866,0x34C2BE,0x3A3A3A,0x000000,0x000000,
0xFFFFFF,0xB6DAFF,0xC8CAFF,0xDAC2FF,0xF0BEFF,0xFCBCEE,0xFAC2C0,0xF2CCA2,
0xE6DA92,0xCCE68E,0xB8EEA2,0xAEEABE,0xAEE8E2,0xB0B0B0,0x000000,0x000000
};

unsigned int palette[PALETTE_SIZE] = {0};

/* Store 2 Pattern Tables */
unsigned char pattern_table[PATTERN_TABLE_BYTE_COUNT*NUMBER_OF_PATTERN_TABLES] = {0};

unsigned char bitmap_data[ALIGN_WIDTH(BITMAP_WIDTH*BYTES_PER_PIXEL)*BITMAP_HEIGHT] = {0};

int main(int argc, char *argv[])
{
  FILE *chr_rom_file;
  FILE *palette_file;
  unsigned int msb = 0;
  int display_grid = 0;

  if( argc != 4 && argc != 5 ) {
    printf("Usage: %s <chr-rom-filename> <palette-filename> <MSB> [--grid]\n\n",
           argv[0]);
    printf("  This program renders the tiles in the provided CHR-ROM file for display.\n");
    printf("  The first pattern table is displayed in a 128x128 square on the left.\n");
    printf("  The second pattern table is displayed in a 128x128 square on the right.\n\n");

    printf("  The CHR-ROM file should contain a raw dump of the 8KB CHR-ROM.\n");
    printf("  No header info should be included in the file.\n\n");

    printf("  The palette is just a text file with 16 hex numbers separate by whitespace.\n");
    printf("  The numbers are of the format 0xYY where YY must be from 00 to 3F.\n\n");

    printf("  MSB means the value of the 2 Most Significant Bits of the palette index.\n");
    printf("  These would be found in the Attribute Table or Sprite Table on the NES.\n");
    printf("  The MSB value must be 0, 1, 2, or 3.\n\n");

    printf("  If a sixth parameter is given, then the program will display a grid.\n");
    printf("  The grid can help one determine the boundaries of the tiles.\n");
    exit(-1);
  }

  if( argc == 5 ) {
    display_grid = 1;
  }

  msb = atoi(argv[3]);
  if( msb != 0 && msb != 1 && msb != 2 && msb != 3 ) {
    fprintf(stderr, "Invalid high bit value: %s\n", argv[3]);
    exit(-1);
  }

  palette_file = fopen(argv[2], "r");
  if( palette_file == NULL ) {
    fprintf(stderr, "Could not open palette file: %s\n", argv[2]);
    exit(-1);
  }
  {
    int count;
    for( count = 0; count < PALETTE_SIZE; ++count ) {
      int res = fscanf(palette_file, "%x", &(palette[count]));
      if( res != 1 ) {
        fprintf(stderr, "Error trying to read palette entry %d.\n", count+1);
        fclose(palette_file);
        exit(-1);
      }
      if( palette[count] < 0 || palette[count] >= NUMBER_OF_PALETTE_COLORS ) {
        fprintf(stderr,
                "Error: palette value %x on line %d is not a valid color index.\n",
                palette[count],
                count);
        fclose(palette_file);
        exit(-1);
      }
    }
    fclose(palette_file);
    palette_file = NULL;
  }

  chr_rom_file = fopen(argv[1], "r");
  if( chr_rom_file == NULL ) {
    fprintf(stderr, "Cound not open CHR-ROM file: %s\n", argv[1]);
    exit(-1);
  }
  {
    size_t bytes_read;
    bytes_read = fread(pattern_table,1,PATTERN_TABLE_BYTE_COUNT*NUMBER_OF_PATTERN_TABLES, chr_rom_file);
    if( bytes_read != PATTERN_TABLE_BYTE_COUNT*NUMBER_OF_PATTERN_TABLES ) {
      fprintf(stderr, "Error reading chr-rom file: %lu bytes read instead of 8K.\n", bytes_read);
      fclose(chr_rom_file);
      exit(-1);
    }
    fclose(chr_rom_file);
    chr_rom_file = NULL;
  }

 {
    int h;
    int i;
    int j;
    int k;
    for(h = 0; h < NUMBER_OF_PATTERN_TABLES; ++h) {
      for(i = 0; i < PATTERN_TABLE_TILE_COUNT; ++i) {
        for(j = 0; j < TILE_PIXEL_HEIGHT; ++j) {
          for(k = 0; k < TILE_PIXEL_HEIGHT; ++k) {
            unsigned char byte1 = pattern_table[h*PATTERN_TABLE_BYTE_COUNT
                                                + i*TILE_DATA_BYTE_COUNT
                                                + j];
            unsigned char byte2 = pattern_table[h*PATTERN_TABLE_BYTE_COUNT
                                                + i*TILE_DATA_BYTE_COUNT
                                                + j
                                                + TILE_DATA_BYTE_COUNT/2];
            unsigned int index = ((msb&0x3)<<2)
                                 | (TILE_BYTE_BIT_INDEX(byte2,k)<<1)
                                 | TILE_BYTE_BIT_INDEX(byte1,k);
            unsigned int r;
            unsigned int g;
            unsigned int b;
            int x = h*PATTERN_TABLE_DISPLAY_WIDTH + (i % TILE_DATA_BYTE_COUNT)*TILE_PIXEL_WIDTH + k;
            int y = (i / TILE_DATA_BYTE_COUNT)*TILE_PIXEL_HEIGHT + j;
            int bitmap_index;

            assert( index < PALETTE_SIZE );
            assert( palette[index] < NUMBER_OF_PALETTE_COLORS && palette[index] >= 0 );
            assert( x >= 0 );
            assert( x < BITMAP_WIDTH);
            assert( y >= 0 );
            assert( y < BITMAP_HEIGHT );

            if( display_grid && (k == 0 || j == 0) ) {
              r = g = b = 0;
            } else {
              r = RED(palette_colors[palette[index]]);
              g = GREEN(palette_colors[palette[index]]);
              b = BLUE(palette_colors[palette[index]]);
            }
            bitmap_index = (BITMAP_HEIGHT - 1 - y)*ALIGN_WIDTH(BITMAP_WIDTH*BYTES_PER_PIXEL)
                    + x*BYTES_PER_PIXEL;

            assert(bitmap_index >= 0 );
            assert(bitmap_index+1 >= 0 );
            assert(bitmap_index+2 >= 0 );
            assert(bitmap_index < ALIGN_WIDTH(BITMAP_WIDTH*BYTES_PER_PIXEL)*BITMAP_HEIGHT);
            assert(bitmap_index+1 < ALIGN_WIDTH(BITMAP_WIDTH*BYTES_PER_PIXEL)*BITMAP_HEIGHT);
            assert(bitmap_index+2 < ALIGN_WIDTH(BITMAP_WIDTH*BYTES_PER_PIXEL)*BITMAP_HEIGHT);

            bitmap_data[bitmap_index] = b;
            bitmap_data[bitmap_index+1] = g;
            bitmap_data[bitmap_index+2] = r;
          }
        }
      }
    }
  }
 /* Write out the bmp file to stdout. */

 /* First write header info. */
  {
#if 1
    unsigned char temp[4];
    unsigned int bitmap_size = 14 + 40 + ALIGN_WIDTH(BITMAP_WIDTH*BYTES_PER_PIXEL)*BITMAP_HEIGHT;

    /* Magic Number */
    temp[0] = 'B';
    temp[1] = 'M';
    WRITE_INT16(stdout,temp);

    /* Size of the BMP file in bytes */
    INT32_TO_BYTE_ARRAY(bitmap_size,temp);
    WRITE_INT32(stdout,temp);

    /* 4 Reserved Bytes. */
    temp[0] = temp[1] = temp[2] = temp[3] = 0;
    WRITE_INT32(stdout,temp);

    /* Offset, where bitmap data can be found */
    INT32_TO_BYTE_ARRAY(14+40,temp);
    WRITE_INT32(stdout,temp);

    /* V3 Header */

    /* Size of the header */
    INT32_TO_BYTE_ARRAY(40,temp);
    WRITE_INT32(stdout,temp);

    /* bitmap pixel width */
    INT32_TO_BYTE_ARRAY(BITMAP_WIDTH,temp);
    WRITE_INT32(stdout,temp);

    /* bitmap pixel height */
    INT32_TO_BYTE_ARRAY(BITMAP_HEIGHT,temp);
    WRITE_INT32(stdout,temp);

    /* number of color planes */
    INT16_TO_BYTE_ARRAY(1,temp);
    WRITE_INT16(stdout,temp);

    /* number of bits per pixel */
    INT16_TO_BYTE_ARRAY(24,temp);
    WRITE_INT16(stdout,temp);

    /* compression method */
    INT32_TO_BYTE_ARRAY(0,temp);
    WRITE_INT32(stdout,temp);

    /* bitmap data size */
    INT32_TO_BYTE_ARRAY(ALIGN_WIDTH(BITMAP_WIDTH*BYTES_PER_PIXEL)*BITMAP_HEIGHT,temp);
    WRITE_INT32(stdout,temp);

    /* horizonatl resolution */
    INT32_TO_BYTE_ARRAY(2835,temp);
    WRITE_INT32(stdout,temp);

    /* vertical resolution */
    INT32_TO_BYTE_ARRAY(2835,temp);
    WRITE_INT32(stdout,temp);

    /* number of colors in color palette */
    INT32_TO_BYTE_ARRAY(0,temp);
    WRITE_INT32(stdout,temp);

    /* number of important colors */
    INT32_TO_BYTE_ARRAY(0,temp);
    WRITE_INT32(stdout,temp);
#endif
    fwrite(bitmap_data,1,ALIGN_WIDTH(BITMAP_WIDTH*BYTES_PER_PIXEL)*BITMAP_HEIGHT,stdout);
  }


  return 0;
}
