; This waits for a change in the value of the NMI counter.
; It destroys the A register.
.macro wait_for_nmi
	lda nmi_counter
:	cmp nmi_counter
	beq	:-				; Loop, so long as nmi_counter hasn't changed its value.
.endmacro


; This waits for a given no. of NMIs to pass. It destroys the A register.
; Note that it relies on an NMI counter that decrements, rather than increments.
.macro nmi_delay frames
	lda #frames
	sta nmi_counter		; Store the desired frame count.
:	lda nmi_counter		; In a loop, keep checking the frame count.
	bne :-				; Loop until it's decremented to 0.
.endmacro


.macro load_palettes pdata
	; $3F00-$3F1F in the PPU address space is where palette data is kept,
	; organised as 2 sets (background & sprite sets) of 4 palettes, each
	; being 4 bytes long (but only the upper 3 bytes of each being used).
	; That is 2(sets) x 4(palettes) x 3(colours). $3F00 itself is the
	; "backdrop" colour, or the universal background colour.
	ppu_addr $3F00	; Tell the PPU we want to access address $3F00 in its address space.
	ldx #0
:	lda pdata,x
	sta PPU_DATA
	inx
	cpx #32		; P.C gets set if X>=M (i.e. X>=32).
	bcc :-		; Loop if P.C is clear.
	; NOTE: Trying to load the palette outside of VBLANK may lead to the colours being
	; rendered as pixels on the screen. See:
	; http://wiki.nesdev.com/w/index.php/Palette#The_background_palette_hack
.endmacro


.macro clear_vram first_table, num_tables
	; Clear the nametables.
	; The physical VRAM (Video RAM) of the NES is only 2KiB, allowing for two nametables.
	; Each nametable is 1024 bytes of memory, arranged as 32 columns by 30 rows of
	; tile references, for a total of 960 ($3C0) bytes. The remaining 64 bytes are
	; for the attribute table of that nametable.
	; Nametable 0 starts at PPU address $2000, while nametable 1 starts at $2400,
	; nametable 3 at $2800, and nametable 4 at $2c00.
	; For more information, see: http://wiki.nesdev.com/w/index.php/Nametable
	; Because of mirroring, however, in this case implied by the INES header to
	; be "horizontal mirroring", $2000-$23FF is mapped to the same memory
	; as $2400-$27FF, meaning that the next UNIQUE nametable starts at $2800.
	; In order to keep things simple when we clear the video RAM, we just blank out
	; the entire $2000-$2FFF range, which means we're wasting some CPU time, but
	; it isn't noticeable to the user, and saves overcomplicating the code below.
	; NOTE: In order to keep this loop tight (knowing we can only easily count 256 iterations
	; in a single loop), we just have one loop and do multiple writes in it.
	ppu_addr $2000+($400*first_table)
	ldx #0
	txa
	; Write 0 into the PPU Nametable RAM, 16 times, per each of 256 iterations:
:	Repeat 4*num_tables, sta PPU_DATA
	inx
	bne :-
.endmacro


.macro fill_attribute_table tnum
	; Clear attribute table, for a given nametable:
	; One palette (out of the 4 background palettes available) may be assigned
	; per 2x2 group of tiles. The actual layout of the attribute table is a bit
	; funny. See here for more info: http://wiki.nesdev.com/w/index.php/PPU_attribute_tables
	; Attribute table for Nametable 0, first:
	ppu_addr ($23c0+($400*tnum))
	ldx #64
:	sta PPU_DATA
	dex
	bne :-
.endmacro
