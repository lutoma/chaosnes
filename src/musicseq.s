; Generated using Pently music assembler
; Music from src/musicseq.pently
.include "pentlyseq.inc"
.segment "RODATA"
NUM_SONGS=9
NUM_SOUNDS=12
.exportzp NUM_SONGS, NUM_SOUNDS
pently_sfx_table:  ; 12 entries, 250 bytes
sfxdef PE_kick, PEDAT_kick, 10, 1, 3
sfxdef PE_snare, PEDAT_snare, 10, 1, 3
sfxdef PE_hihat, PEDAT_hihat, 4, 1, 3
sfxdef PE_quiethat, PEDAT_quiethat, 2, 1, 3
sfxdef PE_openhat, PEDAT_openhat, 15, 1, 3
sfxdef PE_snarehat, PEDAT_snarehat, 15, 1, 3
sfxdef PE_trikick, PEDAT_trikick, 5, 1, 2
sfxdef PE_trisnare, PEDAT_trisnare, 4, 1, 2
sfxdef PE_tubfloorA, PEDAT_tubfloorA, 12, 1, 0
sfxdef PE_arghatbuzz, PEDAT_arghatbuzz, 6, 1, 3
sfxdef PE_stickskick, PEDAT_stickskick, 12, 1, 3
sfxdef PE_stickshatlo, PEDAT_stickshatlo, 6, 1, 3
PEDAT_kick:
.dbyt $0c05,$0a0f,$080f,$060f,$050f,$040f,$030f,$020f,$010f,$010f
PEDAT_snare:
.dbyt $0c0b,$0a05,$0805,$0605,$0505,$0405,$0305,$0205,$0105,$0105
PEDAT_hihat:
.dbyt $0403,$0283,$0203,$0183
PEDAT_quiethat = PEDAT_hihat + 2 * 2
PEDAT_openhat:
.dbyt $0603,$0583,$0403,$0483,$0303,$0383,$0303,$0283,$0203,$0283,$0103,$0183
.dbyt $0103,$0183,$0103
PEDAT_snarehat:
.dbyt $060b,$0505,$0405,$0483,$0303,$0383,$0303,$0283,$0203,$0283,$0103,$0183
.dbyt $0103,$0183,$0103
PEDAT_trikick:
.dbyt $8f1f,$8f1b,$8f18,$8215,$8213
PEDAT_trisnare:
.dbyt $8f25,$8f23,$8222,$8221
PEDAT_tubfloorA:
.dbyt $4c06,$4a02,$8802,$8701,$8600,$8500,$8400,$8400,$8300,$8300,$8200,$8100
PEDAT_arghatbuzz:
.dbyt $0403,$0283,$0388,$0288,$0288,$0188
PEDAT_stickskick:
.dbyt $048c,$068b,$058a,$048a,$038a,$038b,$028a,$028b,$018b,$018b,$018b,$018b
PEDAT_stickshatlo:
.dbyt $0489,$0689,$0389,$0289,$0189,$0189
pently_instruments:  ; 24 entries, 466 bytes
instdef PI_bass, 2, 8, 0, 0, 0, 0
instdef PI_framepop, 2, 0, 0, 0, PIDAT_framepop, 1
instdef PI_banjo, 0, 2, 1, 0, PIDAT_banjo, 8
instdef PI_latebanjo, 0, 2, 1, 0, PIDAT_latebanjo, 9
instdef PI_tubbass, 2, 4, 2, 0, PIDAT_tubbass, 6
instdef PI_tubbass_slow, 2, 8, 1, 0, PIDAT_tubbass_slow, 8
instdef PI_dut, 0, 0, 16, 0, PIDAT_dut, 9
instdef PI_feat_wah, 0, 3, 1, 0, PIDAT_feat_wah, 12
instdef PI_feat_power, 0, 8, 0, 0, 0, 0
instdef PI_bf98_flute, 2, 5, 0, 0, PIDAT_bf98_flute, 7
instdef PI_bf98_flute2, 2, 4, 0, 0, PIDAT_bf98_flute2, 7
instdef PI_bf98_osti, 0, 5, 0, 1, PIDAT_bf98_osti, 4
instdef PI_orchhit, 1, 0, 0, 0, PIDAT_orchhit, 24
instdef PI_crashcymbal, 0, 7, 2, 0, 0, 0
instdef PI_fiddle2, 1, 4, 0, 1, PIDAT_fiddle2, 5
instdef PI_bf98_fluteshort, 2, 5, 0, 0, PIDAT_bf98_fluteshort, 4
instdef PI_vowele, 1, 5, 0, 0, PIDAT_vowele, 7
instdef PI_vowela, 0, 5, 0, 0, PIDAT_vowela, 7
instdef PI_argtwinkle, 2, 2, 1, 0, PIDAT_argtwinkle, 10
instdef PI_argdive, 2, 5, 0, 0, PIDAT_argdive, 20
instdef PI_arg2bass, 2, 10, 20, 0, 0, 0
instdef PI_toot0, 2, 0, 0, 0, PIDAT_toot0, 10
instdef PI_toot1, 2, 0, 0, 0, PIDAT_toot1, 6
instdef PI_stringlead, 0, 3, 0, 0, PIDAT_stringlead, 9
PIDAT_framepop:
.dbyt $8e00
PIDAT_banjo = PIDAT_latebanjo + 2 * 1
PIDAT_latebanjo:
.dbyt $0000,$0c00,$0800,$0600,$0500,$0400,$0400,$0300,$0300
PIDAT_tubbass:
.dbyt $4c06,$4a04,$8802,$8701,$8600,$8500
PIDAT_tubbass_slow:
.dbyt $0e06,$0d04,$4c02,$4b01,$8a00,$8900,$8900,$8900
PIDAT_dut:
.dbyt $8cfd,$4cff,$0b00,$0800,$06ff,$05ff,$04fe,$02fd,$01fb
PIDAT_feat_wah:
.dbyt $8800,$8800,$8700,$8700,$8600,$8600,$4500,$4500,$4500,$4400,$4400,$4400
PIDAT_bf98_flute = PIDAT_bf98_flute2 + 2 * 0
PIDAT_bf98_flute2:
.dbyt $8400,$8600,$8700,$8600,$8600,$8500,$8500
PIDAT_bf98_osti:
.dbyt $0300,$0600,$0700,$0600
PIDAT_orchhit:
.dbyt $480c,$4800,$48f4,$470c,$4700,$47f4,$460c,$4600,$46f4,$450c,$4500,$45f4
.dbyt $440c,$4400,$44f4,$430c,$4300,$43f4,$420c,$4200,$42f4,$410c,$4100,$41f4
PIDAT_fiddle2:
.dbyt $4300,$4500,$4600,$4500,$4500
PIDAT_bf98_fluteshort = PIDAT_bf98_flute2 + 2 * 0
PIDAT_vowele:
.dbyt $4400,$4600,$4700,$4600,$4600,$4500,$4500
PIDAT_vowela:
.dbyt $0400,$0600,$0700,$0600,$0600,$0500,$0500
PIDAT_argtwinkle:
.dbyt $8700,$8600,$8600,$8500,$8500,$8400,$8400,$8400,$8400,$8400
PIDAT_argdive:
.dbyt $85ff,$85fe,$85fd,$85fc,$85fb,$85fa,$85f9,$85f8,$85f7,$85f6,$85f5,$85f4
.dbyt $85f3,$85f2,$85f1,$85f0,$85ef,$85ee,$85ed,$85ec
PIDAT_toot0:
.dbyt $8400,$8700,$8800,$8800,$8700,$8500,$8300,$8200,$8100,$8100
PIDAT_toot1 = PIDAT_toot0 + 2 * 0
PIDAT_stringlead:
.dbyt $0400,$0700,$0800,$0800,$0700,$0700,$0500,$0400,$0400
pently_drums:  ; 12 entries, 24 bytes
drumdef DR_kick, PE_kick
drumdef DR_snare, PE_snare
drumdef DR_clhat, PE_hihat
drumdef DR_ohat, PE_openhat
drumdef DR_tkick, PE_kick, PE_trikick
drumdef DR_tsnare, PE_snare, PE_trisnare
drumdef DR_tsohat, PE_snarehat, PE_trisnare
drumdef DR_tubkick, PE_kick, PE_tubfloorA
drumdef DR_arghatbuzz, PE_arghatbuzz
drumdef DR_quiethat, PE_quiethat
drumdef DR_stickskick, PE_stickskick
drumdef DR_stickshatlo, PE_stickshatlo
pently_patterns:  ; 82 entries, 2520 bytes
patdef PP_argument_drum34, PPDAT_argument_drum34
patdef PP_argument_drum34_8, PPDAT_argument_drum34_8
patdef PP_argument_commemorate3, PPDAT_argument_commemorate3
patdef PP_argument_tubbassloop, PPDAT_argument_tubbassloop
patdef PP_argument_intro_dut, PPDAT_argument_intro_dut
patdef PP_argument_bass, PPDAT_argument_bass
patdef PP_argument_melody, PPDAT_argument_melody
patdef PP_argument_melodyend, PPDAT_argument_melodyend
patdef PP_argument_descendingchords, PPDAT_argument_descendingchords
patdef PP_argument_twinkle, PPDAT_argument_twinkle
patdef PP_argument_cadenzabass, PPDAT_argument_cadenzabass
patdef PP_argument_cadenza, PPDAT_argument_cadenza
patdef PP_argument_cadenzaend, PPDAT_argument_cadenzaend
patdef PP_argument_cadenzaend2, PPDAT_argument_cadenzaend2
patdef PP_argument_drum68, PPDAT_argument_drum68
patdef PP_argument_drum68nokick, PPDAT_argument_drum68nokick
patdef PP_argument_drum68allkick, PPDAT_argument_drum68allkick
patdef PP_argument_drum68top, PPDAT_argument_drum68top
patdef PP_argument_bass68, PPDAT_argument_bass68
patdef PP_argument_harmony68_1, PPDAT_argument_harmony68_1
patdef PP_argument_harmony68_2, PPDAT_argument_harmony68_2
patdef PP_argument_harmony68_3, PPDAT_argument_harmony68_3
patdef PP_argument_melody68, PPDAT_argument_melody68
patdef PP_argument_bass68end, PPDAT_argument_bass68end
patdef PP_argument_drum68topend, PPDAT_argument_drum68topend
patdef PP_sticks_introbanjo1, PPDAT_sticks_introbanjo1
patdef PP_sticks_introch2, PPDAT_sticks_introch2
patdef PP_sticks_introbanjo2, PPDAT_sticks_introbanjo2
patdef PP_sticks_introbass, PPDAT_sticks_introbass
patdef PP_sticks_introdrum, PPDAT_sticks_introdrum
patdef PP_sticks_bassstart, PPDAT_sticks_bassstart
patdef PP_sticks_bass, PPDAT_sticks_bass
patdef PP_sticks_chords1start, PPDAT_sticks_chords1start
patdef PP_sticks_chords1, PPDAT_sticks_chords1
patdef PP_sticks_chords2, PPDAT_sticks_chords2
patdef PP_sticks_drum, PPDAT_sticks_drum
patdef PP_sticks_v_iv_bass, PPDAT_sticks_v_iv_bass
patdef PP_sticks_v_iv_chords1, PPDAT_sticks_v_iv_chords1
patdef PP_sticks_v_iv_chords2, PPDAT_sticks_v_iv_chords2
patdef PP_twinkle_melody, PPDAT_twinkle_melody
patdef PP_twinkle_bassline, PPDAT_twinkle_bassline
patdef PP_twinkle_bassfinal, PPDAT_twinkle_bassfinal
patdef PP_twinkle_beat, PPDAT_twinkle_beat
patdef PP_canon_bass, PPDAT_canon_bass
patdef PP_canon_melody, PPDAT_canon_melody
patdef PP_bf98_orchhits, PPDAT_bf98_orchhits
patdef PP_bf98_drums, PPDAT_bf98_drums
patdef PP_bf98_drums_resumefill, PPDAT_bf98_drums_resumefill
patdef PP_bf98_drums_tripletfill, PPDAT_bf98_drums_tripletfill
patdef PP_bf98_drums_quietfill, PPDAT_bf98_drums_quietfill
patdef PP_bf98_drums_break, PPDAT_bf98_drums_break
patdef PP_bf98_bassA, PPDAT_bf98_bassA
patdef PP_bf98_melodyA, PPDAT_bf98_melodyA
patdef PP_bf98_thirdsA, PPDAT_bf98_thirdsA
patdef PP_bf98_osti1, PPDAT_bf98_osti1
patdef PP_bf98_osti2, PPDAT_bf98_osti2
patdef PP_bf98_melodyB1, PPDAT_bf98_melodyB1
patdef PP_bf98_counterB1, PPDAT_bf98_counterB1
patdef PP_bf98_bassB1, PPDAT_bf98_bassB1
patdef PP_bf98_melodyB2, PPDAT_bf98_melodyB2
patdef PP_bf98_counterB2, PPDAT_bf98_counterB2
patdef PP_bf98_bassB2, PPDAT_bf98_bassB2
patdef PP_arp_waltz_bassintro, PPDAT_arp_waltz_bassintro
patdef PP_arp_waltz_bass1, PPDAT_arp_waltz_bass1
patdef PP_arp_waltz_bass2, PPDAT_arp_waltz_bass2
patdef PP_arp_waltz_melody, PPDAT_arp_waltz_melody
patdef PP_arp_waltz_interlude, PPDAT_arp_waltz_interlude
patdef PP_allfeatures_between, PPDAT_allfeatures_between
patdef PP_allfeatures_drum, PPDAT_allfeatures_drum
patdef PP_allfeatures_drumfill, PPDAT_allfeatures_drumfill
patdef PP_allfeatures_chords, PPDAT_allfeatures_chords
patdef PP_allfeatures_bass, PPDAT_allfeatures_bass
patdef PP_stairs_lead1, PPDAT_stairs_lead1
patdef PP_stairs_introg, PPDAT_stairs_introg
patdef PP_stairs_lead1end, PPDAT_stairs_lead1end
patdef PP_stairs_bass, PPDAT_stairs_bass
patdef PP_stairs_lead2, PPDAT_stairs_lead2
patdef PP_stairs_lead2end, PPDAT_stairs_lead2end
patdef PP_attacktest_drums, PPDAT_attacktest_drums
patdef PP_attacktest_bass, PPDAT_attacktest_bass
patdef PP_attacktest_atk, PPDAT_attacktest_atk
patdef PP_attacktest_drumfill, PPDAT_attacktest_drumfill
PPDAT_argument_drum34:
.byte DR_tubkick|D_8,DR_clhat|D_8,DR_clhat|D_8,PATEND
PPDAT_argument_drum34_8:
.byte DR_tubkick,DR_quiethat,DR_clhat,DR_arghatbuzz,DR_clhat,DR_quiethat,PATEND
PPDAT_argument_commemorate3:
.byte INSTRUMENT,PI_vowele,N_D,N_F,REST,N_E,N_F|D_8,N_E|D_8,REST
.byte INSTRUMENT,PI_vowela,N_F,GRACE,4,N_TIE,INSTRUMENT,PI_vowele,N_E|D_8,N_DS
.byte GRACE,4,N_TIE,INSTRUMENT,PI_bf98_flute2,N_D|D_8,INSTRUMENT,PI_vowele,N_FS
.byte GRACE,4,REST,INSTRUMENT,PI_bf98_flute2,N_DS|D_8,INSTRUMENT,PI_vowela,N_D
.byte GRACE,4,REST,INSTRUMENT,PI_vowele,N_CS|D_8,INSTRUMENT,PI_bf98_flute2
.byte REST|D_8,INSTRUMENT,PI_bf98_flute2,N_CS,INSTRUMENT,PI_vowela,GRACE,7,N_DS
.byte REST,INSTRUMENT,PI_vowele,N_CS,INSTRUMENT,PI_bf98_flute2,N_F,GRACE,4
.byte N_TIE,INSTRUMENT,PI_vowele,N_E|D_8,N_CS,GRACE,4,REST,N_E|D_8,N_DS|D_8
.byte REST,N_CS,INSTRUMENT,PI_bf98_flute2,GRACE,4,REST,N_DS|D_8
.byte INSTRUMENT,PI_vowele,N_CS,INSTRUMENT,PI_vowela,N_C,REST,GRACE,4,N_G
.byte N_C|D_8,INSTRUMENT,PI_vowele,N_CS|D_8,REST|D_4,PATEND
PPDAT_argument_tubbassloop:
.byte INSTRUMENT,PI_tubbass_slow,N_CS,LEGATO_ON,N_C|D_2,N_TIE|D_D8,LEGATO_OFF
.byte REST|D_D4,REST|D_D4,PATEND
PPDAT_argument_intro_dut:
.byte N_C|D_D4,REST|D_D4,N_C|D_D4,REST|D_D4,N_C|D_D4,N_C|D_D4,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C,N_C,N_C,N_C,N_C,N_C,PATEND
PPDAT_argument_bass:
.byte N_D|D_8,N_DH,N_D|D_8,N_DH,N_D|D_8,N_DH|D_8,N_D|D_8,N_F|D_8,N_FH,N_F|D_8
.byte N_FH,N_F|D_8,N_FH|D_8,N_F|D_8,N_C|D_8,N_CH,N_C|D_8,N_CH,N_C|D_8,N_CH|D_8
.byte N_C|D_8,N_G|D_8,N_GH,N_G|D_8,N_GH,N_G|D_8,N_GH|D_8,N_G|D_8,PATEND
PPDAT_argument_melody:
.byte N_E|D_2,N_TIE|D_8,N_G|D_8,N_D|D_2,N_TIE|D_8,N_C|D_8,N_E|D_2,N_TIE|D_8
.byte N_G|D_8,N_D|D_D2,PATEND
PPDAT_argument_melodyend:
.byte N_C,N_CS,REST|D_4,PATEND
PPDAT_argument_descendingchords:
.byte N_CHH,N_GSH,N_FH,N_CH,N_GS,N_F,N_C,TRANSPOSE,<-19,N_DSH,N_CH,N_G,N_DS,N_C
.byte TRANSPOSE,<22,N_CHH,N_AH,N_FH,N_CH,N_A,N_F,N_C,TRANSPOSE,<-19,N_EH,N_CH
.byte N_G,N_E,N_C,TRANSPOSE,<19,N_CHH,N_GH,N_EH,N_CH,N_G,N_E,N_C,TRANSPOSE,<-20
.byte N_DSH,N_CH,N_GS,N_DS,N_C,TRANSPOSE,<19,N_CHH,N_GSH,N_DSH,N_CH,N_GS,N_DS
.byte N_C,TRANSPOSE,<-21,N_FH,N_CH,N_A,N_F,N_C,TRANSPOSE,<19,PATEND
PPDAT_argument_twinkle:
.byte REST|D_8,N_CS|D_8,N_DS|D_8,N_F|D_D4,REST|D_8,N_F|D_8,N_G|D_8,N_GS|D_D4
.byte REST|D_8,N_C|D_8,N_CS|D_8,N_DS|D_D4,REST|D_8,N_DS|D_8,N_F|D_8,N_G|D_D4
.byte PATEND
PPDAT_argument_cadenzabass:
.byte N_D|D_D2,N_F|D_D2,N_C|D_D2,N_G|D_D2,PATEND
PPDAT_argument_cadenza:
.byte N_AH|D_8,N_GH|D_8,N_FH|D_8,N_GH|D_8,N_AH|D_8,N_DH|D_8,N_FH|D_8,N_CH|D_8
.byte N_DH|D_8,N_A|D_8,N_CH|D_8,N_F|D_8,N_G|D_8,N_C|D_8,N_E|D_8,TRANSPOSE,<-22
.byte N_FH|D_8,N_ASH|D_8,N_DH|D_8,N_FH|D_8,N_A|D_8,N_CH|D_8,N_F|D_8,N_A|D_8
.byte N_C|D_8,N_DS|D_8,N_G|D_8,N_CH|D_8,N_G|D_8,N_CH|D_8,N_DSH|D_8,N_AS|D_8
.byte N_DSH|D_8,N_GH|D_8,N_DSH|D_8,N_GH|D_8,N_ASH|D_8,N_FH|D_8,N_ASH|D_8
.byte TRANSPOSE,<22,N_E|D_8,N_C|D_8,N_E|D_8,N_G|D_8,N_D|D_8,N_G|D_8,N_B|D_8
.byte N_G|D_8,N_B|D_8,N_DH|D_8,PATEND
PPDAT_argument_cadenzaend:
.byte N_C|D_8,N_E|D_8,N_A|D_8,N_CH|D_8,N_EH|D_8,N_AH|D_8,N_CHH|D_8
.byte TRANSPOSE,<23,N_F|D_8,N_GS|D_8,N_CSH|D_8,N_FH|D_8,N_GSH|D_8,N_CHH,N_ASH
.byte N_GSH,N_FH,N_DSH,N_CH,N_AS,N_GS,N_F,N_DS,N_C,TRANSPOSE,<-5,N_DS,N_C|D_2
.byte N_TIE|D_8,INSTRUMENT,PI_argdive,N_C|D_8,TRANSPOSE,<-18,PATEND
PPDAT_argument_cadenzaend2:
.byte N_CHH,N_ASH,N_GH,N_FH,N_DSH,N_CH,N_AS,N_G,N_F,N_DS,N_C,TRANSPOSE,<-7,N_F
.byte N_C|D_D4,REST|D_D4,TRANSPOSE,<7,PATEND
PPDAT_argument_drum68:
.byte DR_tkick,DR_quiethat,DR_quiethat
PPDAT_argument_drum68nokick:
.byte DR_clhat,DR_quiethat,DR_quiethat,PATEND
PPDAT_argument_drum68allkick:
.byte DR_tkick,DR_quiethat,DR_quiethat,PATEND
PPDAT_argument_drum68top:
.byte N_C|D_D8,PATEND
PPDAT_argument_bass68:
.byte N_D,N_D,N_D,N_D,N_D,N_D,N_D,N_D,N_D,N_D,N_D,N_D,N_F,N_F,N_F,N_F,N_F,N_F
.byte N_F,N_F,N_F,N_F,N_F,N_F,N_C,N_C,N_C,N_C,N_C,N_C,N_C,N_C,N_C,N_C,N_C,N_C
.byte N_G,N_G,N_G,N_G,N_G,N_G,N_G,N_G,N_G,N_G,N_G,N_G,PATEND
PPDAT_argument_harmony68_1:
.byte N_C,REST|D_8,REST|D_D8,REST|D_D4,N_DS,REST|D_8,REST|D_D8,REST|D_D4,N_DS
.byte REST|D_8,REST|D_D8,REST|D_D4,N_D,REST|D_8,REST|D_D8,REST|D_D4,PATEND
PPDAT_argument_harmony68_2:
.byte N_D|D_D4,REST|D_D4,N_F|D_D4,REST|D_D4,N_C|D_D4,REST|D_D4,N_G|D_D4
.byte REST|D_D4,PATEND
PPDAT_argument_harmony68_3:
.byte N_C,REST|D_8,REST|D_D8,REST|D_D4,N_E,REST|D_8,REST|D_D8,REST|D_D4,N_D
.byte REST|D_8,REST|D_D8,REST|D_D4,N_D,REST|D_8,REST|D_D8,REST|D_D4,PATEND
PPDAT_argument_melody68:
.byte N_A,N_D,N_F,N_A,N_G,N_F,N_G,REST,N_A,REST|D_D8,N_CH,N_C,N_F,N_A,N_G,N_F
.byte N_G,REST,N_A,REST,N_G,N_F,N_CH,N_C,N_E,N_G,N_F,N_E,N_F,REST,N_G,REST|D_D8
.byte N_B,N_D,N_G,N_B,N_A,N_G,REST,N_B|D_8,N_CH,N_CSH,N_DH,PATEND
PPDAT_argument_bass68end:
.byte N_D|D_8,N_D|D_8,N_D|D_8,N_D|D_8,N_D|D_8,N_D|D_8,N_F|D_8,N_F|D_8,N_F|D_8
.byte N_F|D_8,N_F|D_8,N_F|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_G|D_8,N_G|D_8,N_G|D_8,N_G|D_8,N_G|D_8,N_G|D_8,PATEND
PPDAT_argument_drum68topend:
.byte N_C|D_D4,PATEND
PPDAT_sticks_introbanjo1:
.byte REST|D_8,REST|D_8,N_F|D_D4,N_C|D_2,N_DS|D_4,N_F|D_8,PATEND
PPDAT_sticks_introch2:
.byte N_CH|D_D4,INSTRUMENT,PI_banjo,N_ASH|D_D4,INSTRUMENT,PI_tubbass,N_C|D_D2
.byte INSTRUMENT,PI_toot0,N_DSH|D_D4,INSTRUMENT,PI_banjo,N_ASH|D_D4
.byte INSTRUMENT,PI_tubbass,N_DS|D_D2,INSTRUMENT,PI_toot0,N_FH|D_D4
.byte INSTRUMENT,PI_banjo,N_ASH|D_D4,INSTRUMENT,PI_tubbass,N_F|D_D4
.byte INSTRUMENT,PI_banjo,N_CH|D_D4,INSTRUMENT,PI_tubbass,TRANSPOSE,<-5
.byte N_C|D_D4,INSTRUMENT,PI_banjo,ARPEGGIO,$37,TRANSPOSE,<36,N_C|D_D4
.byte INSTRUMENT,PI_tubbass,ARPEGGIO,$00,TRANSPOSE,<-33,N_C|D_D4
.byte INSTRUMENT,PI_banjo,ARPEGGIO,$47,TRANSPOSE,<36,N_C|D_4
.byte INSTRUMENT,PI_tubbass,ARPEGGIO,$00,TRANSPOSE,<-36,N_C|D_8,N_D|D_1
.byte N_TIE|D_8,REST|D_D4,TRANSPOSE,<2,PATEND
PPDAT_sticks_introbanjo2:
.byte N_C|D_D4,N_CS|D_4,N_DS|D_8,N_F|D_4,N_DS|D_8,N_F|D_D4,N_F|D_4,N_GS|D_D4
.byte N_AS|D_8,ARPEGGIO,$47,N_DSH|D_1,N_TIE|D_8,ARPEGGIO,$00,REST|D_D4,PATEND
PPDAT_sticks_introbass:
.byte N_C|D_D2,N_DS|D_2,N_TIE|D_8,N_DS|D_8,N_F|D_1,N_TIE|D_8,REST|D_D4,PATEND
PPDAT_sticks_introdrum:
.byte DR_clhat|D_2,N_TIE|D_8,DR_clhat|D_8,DR_clhat|D_2,N_TIE|D_8,DR_clhat|D_8
.byte DR_clhat|D_1,N_TIE|D_8,DR_stickskick|D_1,N_TIE|D_2,DR_clhat|D_D4,PATEND
PPDAT_sticks_bassstart:
.byte REST|D_4,N_D|D_2,N_D|D_2,N_TIE|D_8,N_C|D_2,N_C|D_1,N_TIE|D_8,PATEND
PPDAT_sticks_bass:
.byte INSTRUMENT,PI_toot0,N_C|D_4,INSTRUMENT,PI_toot1,TRANSPOSE,<29,N_D|D_2
.byte N_D|D_2,N_TIE|D_8,N_C|D_2,N_C|D_1,N_TIE|D_8,TRANSPOSE,<-29,PATEND
PPDAT_sticks_chords1start:
.byte REST|D_4,INSTRUMENT,PI_toot0,N_DS|D_2,N_CS|D_2,N_TIE|D_8,N_C|D_2,N_C|D_1
.byte N_TIE|D_8,PATEND
PPDAT_sticks_chords1:
.byte INSTRUMENT,PI_tubbass,N_C|D_4,INSTRUMENT,PI_toot0,TRANSPOSE,<33,N_DS|D_2
.byte N_CS|D_2,N_TIE|D_8,N_C|D_2,N_C|D_2,N_TIE|D_D8,GRACE,4,N_TIE,N_CH,GRACE,2
.byte N_TIE,N_CSH,N_DSH|D_4,N_TIE,INSTRUMENT,PI_tubbass,TRANSPOSE,<-33,N_C|D_4
.byte INSTRUMENT,PI_toot0,TRANSPOSE,<33,N_DS|D_2,N_CS|D_2,N_TIE|D_8,N_C|D_2
.byte N_C|D_D4,N_CH|D_4,N_CH|D_8,N_AS|D_D4,TRANSPOSE,<-33,PATEND
PPDAT_sticks_chords2:
.byte REST|D_4,N_E|D_2,N_D|D_2,N_TIE|D_8,N_C|D_2,N_C|D_1,N_TIE|D_8,PATEND
PPDAT_sticks_drum:
.byte DR_stickskick|D_D2,DR_clhat|D_D2,DR_stickshatlo|D_D2,DR_clhat|D_D2,PATEND
PPDAT_sticks_v_iv_bass:
.byte INSTRUMENT,PI_toot0,N_C|D_4,INSTRUMENT,PI_toot1,N_CHH|D_2,N_CHH|D_2
.byte N_TIE|D_8,TRANSPOSE,<22,N_F|D_2,N_F|D_2,N_TIE|D_8,N_D|D_2,N_C|D_2
.byte N_TIE|D_8,N_C|D_2,N_C|D_1,N_TIE|D_8,INSTRUMENT,PI_toot0,TRANSPOSE,<-24
.byte N_C|D_D2,TRANSPOSE,<2,PATEND
PPDAT_sticks_v_iv_chords1:
.byte REST|D_4,N_CSH|D_2,N_DSH|D_2,N_TIE|D_8,N_FH|D_2,N_FH|D_2,N_TIE|D_8
.byte N_CSH|D_2,N_CSH|D_2,N_TIE|D_8,N_CH|D_2,N_CH|D_D4,INSTRUMENT,PI_banjo
.byte N_GS|D_D4,N_C|D_D4,N_C|D_D2,PATEND
PPDAT_sticks_v_iv_chords2:
.byte N_C|D_4,INSTRUMENT,PI_toot0,TRANSPOSE,<17,N_DH|D_2,N_EH|D_2,N_TIE|D_8
.byte N_FH|D_2,N_FH|D_2,N_TIE|D_8,N_DH|D_2,N_DH|D_2,N_TIE|D_8,N_CH|D_2
.byte N_CH|D_D4,INSTRUMENT,PI_banjo,REST|D_4,N_C|D_D4,N_C|D_8
.byte INSTRUMENT,PI_tubbass,TRANSPOSE,<-19,N_C|D_4,INSTRUMENT,PI_banjo,N_CH|D_8
.byte N_B|D_4,N_A|D_8,TRANSPOSE,<2,PATEND
PPDAT_twinkle_melody:
.byte N_C|D_D8,N_C|D_D8,N_G|D_D8,N_G|D_D8,N_A|D_D8,N_A|D_D8,N_G|D_D4,N_F|D_D8
.byte N_F|D_D8,N_E|D_D8,N_E|D_D8,N_D|D_D8,N_D|D_D8,N_C|D_D4,N_G|D_D8,N_G|D_D8
.byte N_F|D_D8,N_F|D_D8,N_E|D_D8,N_E|D_D8,N_D|D_D4,N_G|D_D8,N_G|D_D8,N_F|D_D8
.byte N_F|D_D8,N_E|D_D8,N_E|D_D8,N_D|D_D4,PATEND
PPDAT_twinkle_bassline:
.byte N_F|D_D8,N_CH|D_D8,N_A|D_D8,N_CH|D_D8,N_AS|D_D8,N_F|D_D8,N_A|D_D8
.byte N_F|D_D8,N_G|D_D8,N_AS|D_D8,N_F|D_D8,N_A|D_D8,N_CH|D_D8,N_E|D_D8,N_F|D_D8
.byte N_CH|D_D8,N_A|D_D8,N_CH|D_D8,N_G|D_D8,N_AS|D_D8,N_F|D_D8,N_A|D_D8
.byte N_CH|D_D8,N_G|D_D8,N_A|D_D8,N_CH|D_D8,N_G|D_D8,N_AS|D_D8,N_F|D_D8
.byte N_A|D_D8,N_CH|D_D8,N_C|D_D8,PATEND
PPDAT_twinkle_bassfinal:
.byte N_C|D_D4,PATEND
PPDAT_twinkle_beat:
.byte DR_tkick|D_D8,DR_clhat|D_D8,DR_tkick|D_D8,DR_clhat|D_8,DR_clhat,PATEND
PPDAT_canon_bass:
.byte N_CH|D_2,N_G|D_2,N_A|D_2,N_E|D_2,N_F|D_2,N_C|D_2,N_F|D_2,N_G|D_2,PATEND
PPDAT_canon_melody:
.byte VIBRATO,1,N_GH|D_2,N_FH|D_2,N_DSH|D_2,N_DH|D_2,N_CH|D_2,N_AS|D_2,N_CH|D_2
.byte N_DH|D_2,N_DSH|D_2,N_DH|D_2,N_CH|D_2,N_AS|D_2,N_GS|D_2,N_G|D_2,N_GS|D_2
.byte N_F|D_2,N_DS|D_4,N_G|D_4,N_AS|D_4,N_GS|D_4,N_G|D_4,N_DS|D_4,N_G|D_4
.byte N_F|D_4,N_DS|D_4,N_C|D_4,N_DS|D_4,N_AS|D_4,N_GS|D_4,N_CH|D_4,N_AS|D_4
.byte N_GS|D_4,N_G|D_4,N_DS|D_4,N_F|D_4,N_DH|D_4,N_DSH|D_4,N_GH|D_4,N_ASH|D_4
.byte N_AS|D_4,N_CH|D_4,N_GS|D_4,N_AS|D_4,N_G|D_4,N_DS|D_4,N_DSH|D_4,N_DSH|D_D4
.byte N_DH|D_8,N_DSH|D_8,N_DH|D_8,N_DSH|D_8,N_DS|D_8,N_D|D_8,N_AS|D_8,N_F|D_8
.byte N_G|D_8,N_DS|D_8,N_DSH|D_8,N_DH|D_8,N_CH|D_8,N_DH|D_8,N_GH|D_8,N_ASH|D_8
.byte N_CHH|D_8,N_GSH|D_8,N_GH|D_8,N_FH|D_8,N_GSH|D_8,N_GH|D_8,N_FH|D_8
.byte N_DSH|D_8,N_DH|D_8,N_CH|D_8,N_AS|D_8,N_GS|D_8,N_G|D_8,N_F|D_8,N_GS|D_8
.byte N_G|D_8,N_F|D_8,N_DS|D_8,N_F|D_8,N_G|D_8,N_GS|D_8,N_AS|D_8,N_F|D_8
.byte N_AS|D_8,N_GS|D_8,N_G|D_8,N_CH|D_8,N_AS|D_8,N_GS|D_8,N_AS|D_8,N_GS|D_8
.byte N_G|D_8,N_F|D_8,N_DS|D_8,N_C|D_8,N_CH|D_8,N_DH|D_8,N_DSH|D_8,N_DH|D_8
.byte N_CH|D_8,N_AS|D_8,N_GS|D_8,N_G|D_8,N_F|D_8,N_CH|D_8,N_AS|D_8,N_CH|D_8
.byte N_AS|D_8,N_GS|D_8,N_G|D_4,N_GH|D_4,N_FH|D_2,REST|D_4,N_DSH|D_4,N_GH|D_2
.byte N_CHH|D_2,N_ASH|D_2,N_CHH|D_2,TRANSPOSE,<3,N_BH|D_2,N_CHH|D_4,N_CH|D_4
.byte N_B|D_2,REST|D_4,N_A|D_4,N_CH|D_2,N_CH|D_D2,N_CH|D_4,N_CH|D_4,N_FH|D_4
.byte N_DH|D_4,N_GH|D_4,N_GH|D_8,N_EH,N_FH,N_GH|D_8,N_EH,N_FH,N_GH,N_G,N_A,N_B
.byte N_CH,N_DH,N_EH,N_FH,N_EH|D_8,N_CH,N_DH,N_EH|D_8,N_E,N_F,N_G,N_A,N_G,N_F
.byte N_G,N_E,N_F,N_G,N_F|D_8,N_A,N_G,N_F|D_8,N_E,N_D,N_E,N_D,N_C,N_D,N_E,N_F
.byte N_G,N_A,N_F|D_8,N_A,N_G,N_A|D_8,N_B,N_CH,N_G,N_A,N_B,N_CH,N_DH,N_EH,N_FH
.byte N_GH,N_EH|D_8,N_CH,N_DH,N_EH|D_8,N_DH,N_CH,N_DH,N_B,N_CH,N_DH,N_EH,N_DH
.byte N_CH,N_B,N_CH|D_8,N_A,N_B,N_CH|D_8,N_C,N_D,N_E,N_F,N_E,N_D,N_E,N_CH,N_B
.byte N_CH,N_A|D_8,N_CH,N_B,N_A|D_8,N_G,N_F,N_G,N_F,N_E,N_F,N_G,N_A,N_B,N_CH
.byte N_A|D_8,N_CH,N_B,N_CH|D_8,N_B,N_A,N_B,N_CH,N_DH,N_CH,N_B,N_CH,N_A,N_B
.byte N_CH|D_4,REST|D_4,N_B|D_4,REST|D_4,N_A|D_4,REST|D_4,N_CH|D_4,REST|D_4
.byte N_C|D_4,REST|D_4,N_C|D_4,REST|D_4,N_C|D_4,REST|D_4,N_D|D_4,REST|D_4
.byte REST|D_4,N_G|D_4,REST|D_4,N_G|D_4,REST|D_4,N_E|D_4,REST|D_4,N_G|D_4
.byte REST|D_4,N_F|D_4,REST|D_4,N_E|D_4,REST|D_4,N_F|D_4,REST|D_4,N_DH|D_4
.byte N_EH|D_8,N_E|D_8,N_F|D_8,N_E|D_8,N_D|D_8,N_DH|D_8,N_EH|D_8,N_DH|D_8
.byte N_CH|D_8,N_E|D_8,N_C|D_8,N_A|D_8,N_G|D_8,TRANSPOSE,<-7,N_D|D_8,N_C|D_8
.byte N_D|D_8,N_E|D_8,N_EH|D_8,N_FSH|D_8,N_EH|D_8,N_DH|D_8,N_D|D_8,N_C|D_8
.byte N_D|D_8,N_E|D_8,N_EH|D_8,N_DH|D_8,N_EH|D_8,N_FSH|D_8,N_FS|D_8,N_E|D_8
.byte N_FS|D_8,N_G|D_8,N_GH|D_8,N_AH|D_8,N_GH|D_8,N_FSH|D_8,N_FS|D_8,N_G|D_8
.byte N_FS|D_8,N_E|D_8,N_EH|D_8,N_DH|D_8,N_EH|D_8,N_FSH|D_8,N_FS|D_8,N_B|D_8
.byte N_A|D_8,N_G|D_8,N_GH|D_8,N_AH|D_8,N_CHH|D_8,N_BH|D_8,N_B|D_8,N_DH|D_8
.byte N_BH|D_8,N_GH|D_8,N_CHH|D_8,N_BH|D_8,N_CHH|D_8,N_AH|D_8,N_DH|D_8,N_CH|D_8
.byte N_DH|D_8,N_B|D_8,N_DH|D_8,N_DH|D_8,N_DH|D_8,N_DH|D_8,N_DH|D_8,N_DH|D_8
.byte N_DH|D_8,N_B|D_8,N_B|D_8,N_B|D_8,N_B|D_8,N_B|D_8,N_B|D_8,N_DH|D_8
.byte N_DH|D_8,N_CH|D_8,N_CH|D_8,N_CH|D_8,N_GH|D_8,N_GH|D_8,N_GH|D_8,N_GH|D_8
.byte N_GH|D_8,N_GH|D_8,N_GH|D_8,N_EH|D_8,N_EH|D_8,N_DH|D_8,N_DH|D_8,N_AH|D_8
.byte N_FSH|D_8,N_DH|D_8,N_BH|D_8,N_BH|D_8,N_BH|D_8,N_AH|D_8,N_AH|D_8,N_AH|D_8
.byte N_AH|D_8,N_GH|D_8,N_GH|D_8,N_GH|D_8,N_GH|D_8,TRANSPOSE,<6,N_GSH|D_8
.byte N_GSH|D_8,N_GSH|D_8,N_GSH|D_8,N_ASH|D_8,N_ASH|D_8,N_ASH|D_8,N_ASH|D_8
.byte N_GSH|D_8,N_GSH|D_8,N_GSH|D_8,N_GSH|D_8,N_ASH|D_8,N_ASH|D_8,N_ASH|D_8
.byte N_ASH|D_8,N_CHH|D_8,N_CH|D_8,N_CH|D_8,N_CH|D_8,N_CSH|D_8,N_CS,N_DS
.byte N_F|D_8,N_CS|D_8,N_C|D_8,N_CH,N_CSH,N_DSH|D_8,N_CH|D_8,N_AS|D_8
.byte TRANSPOSE,<-2,N_C,N_D,N_DS|D_8,N_C|D_8,N_D|D_8,N_AS,N_GS,N_G|D_8,N_F|D_8
.byte N_DS|D_8,N_GS,N_G,N_F|D_8,N_GS|D_8,N_G|D_8,N_DS,N_F,N_G|D_8,N_AS|D_8
.byte N_GS|D_8,N_CH,N_AS,N_GS|D_8,N_G|D_8,N_F|D_8,N_AS,N_GS,N_G|D_8,N_F|D_8
.byte N_G|D_8,N_DSH,N_DH,N_DSH|D_8,N_G|D_8,N_AS|D_8,N_AS,N_CH,N_DH|D_8,N_AS|D_8
.byte N_G|D_8,N_DSH,N_FH,N_GH|D_8,N_DSH|D_8,N_GH|D_8,N_GH,N_FH,N_DSH|D_8
.byte N_DH|D_8,N_CH|D_8,N_CH,N_AS,N_CH|D_8,N_DH|D_8,N_DSH|D_8,N_GH,N_FH
.byte N_DSH|D_8,N_GH|D_8,N_GSH|D_8,N_DSH,N_DH,N_CH|D_8,N_CH|D_8,N_AS|D_8
.byte N_F|D_8,N_AS|D_8,N_AS|D_8,N_AS|D_D2,N_AS|D_4,N_DS|D_D2,N_AS|D_4,N_GS|D_2
.byte N_AS|D_2,N_GS|D_4,N_DS|D_4,N_DS|D_D4,N_D|D_8,N_DS|D_4,N_DSH|D_4,N_DH|D_2
.byte N_CH|D_2,N_AS|D_2,N_DS|D_D4,N_F|D_8,N_G|D_2,N_CH|D_2,N_F|D_D4,N_F|D_8
.byte N_G|D_D4,N_GH|D_8,N_GH|D_8,N_GSH|D_8,N_GH|D_8,N_FH|D_8,N_DSH|D_D4
.byte N_DSH|D_8,N_DSH|D_8,N_FH|D_8,N_DSH|D_8,N_DH|D_8,N_CH|D_2,N_DSH|D_2
.byte N_DSH|D_8,N_CSH|D_8,N_CH|D_8,N_CSH|D_8,N_AS|D_D4,N_AS|D_8,N_AS|D_D4
.byte N_ASH|D_8,N_ASH|D_8,N_CHH|D_8,N_ASH|D_8,N_GSH|D_8,N_GH|D_D4,N_GH|D_8
.byte N_GH|D_8,N_GSH|D_8,N_GH|D_8,N_FH|D_8,N_DSH|D_8,N_CSH|D_8,N_CH|D_8
.byte N_CSH|D_8,N_AS|D_D4,N_AS|D_8,N_GS|D_4,N_DSH|D_4,N_DH|D_D4,N_DH|D_8
.byte N_DSH|D_4,N_DSH|D_2,N_DH|D_2,N_CH|D_2,N_AS|D_2,N_GS|D_2,N_G|D_2,N_TIE|D_8
.byte N_F|D_8,N_F|D_2,N_G|D_4,N_GH|D_2,N_FH|D_4,N_DSH|D_4,TRANSPOSE,<3
.byte N_CHH|D_2,N_ASH|D_4,N_AH|D_2,N_CHH|D_4,N_GH|D_4,N_AH|D_2,N_GH|D_2
.byte N_GH|D_2,N_G|D_D4,N_F|D_8,N_E|D_2,N_EH|D_D4,N_DH|D_8,N_CH|D_D2,N_CH|D_4
.byte N_CH|D_2,N_B|D_2,N_CH|D_4,N_C|D_4,TRANSPOSE,<-5,N_E|D_4,N_EH|D_4,N_DH|D_4
.byte N_D|D_4,N_C|D_4,N_CH|D_4,N_AS|D_4,N_ASH|D_4,N_AH|D_4,N_A|D_4,N_G|D_4
.byte N_DH|D_4,N_G|D_4,N_GH|D_4,N_AH|D_4,N_A|D_4,N_G|D_4,N_GH|D_4,N_FH|D_4
.byte N_F|D_4,N_E|D_4,N_EH|D_4,N_DH|D_4,TRANSPOSE,<10,N_EH|D_4,N_DH|D_4,N_D|D_4
.byte N_C|D_D4,N_A|D_8,N_D|D_4,N_D|D_4,N_D|D_2,TRANSPOSE,<-8,PATEND
PPDAT_bf98_orchhits:
.byte N_E|D_D8,N_E|D_8,N_C|D_4,N_D|D_D8,N_D|D_8,N_F|D_4,PATEND
PPDAT_bf98_drums:
.byte DR_tkick|D_D8,DR_clhat|D_8,DR_tkick,DR_tsnare|D_D8,DR_tkick|D_D8
.byte DR_clhat|D_8,DR_tkick,DR_tsnare|D_D8,DR_tkick|D_D8,DR_clhat|D_8,DR_tkick
.byte DR_tsnare|D_D8
PPDAT_bf98_drums_resumefill:
.byte DR_tkick|D_8,DR_tsnare,DR_clhat|D_8,DR_tkick,DR_tsnare|D_8,DR_tsnare
.byte PATEND
PPDAT_bf98_drums_tripletfill:
.byte DR_tkick|D_8,DR_clhat,DR_tsnare|D_8,DR_tkick|D_8,DR_tsnare|D_8,PATEND
PPDAT_bf98_drums_quietfill:
.byte DR_tkick|D_D8,DR_clhat|D_D8,DR_clhat|D_D8,PATEND
PPDAT_bf98_drums_break:
.byte DR_tkick|D_D4,DR_clhat|D_8,DR_tkick,PATEND
PPDAT_bf98_bassA:
.byte N_D|D_8,REST,N_FS|D_8,REST,N_A|D_8,N_GS,N_G|D_8,REST,N_C|D_8,REST,N_E|D_8
.byte REST,N_D|D_8,N_FS,N_A|D_8,REST,N_DH|D_8,N_CSH,N_CH|D_8,REST,N_G|D_8
.byte N_GS|D_8,N_A|D_8,PATEND
PPDAT_bf98_melodyA:
.byte REST|D_D8,N_D|D_8,REST,N_F|D_8,REST,N_DS|D_8,N_F,N_DS|D_8,REST,N_C|D_8
.byte REST,N_D|D_8,N_DS,N_F|D_8,REST,N_AS|D_8,REST,GRACE,5,N_GS,N_AS|D_D8
.byte N_GS|D_4,N_TIE,REST,PATEND
PPDAT_bf98_thirdsA:
.byte REST|D_D8,N_D|D_8,REST,N_FS|D_8,REST,N_E|D_8,N_FS,N_E|D_8,REST,N_C|D_8
.byte REST,N_D|D_8,N_E,N_FS|D_8,REST,N_A|D_8,REST,N_G|D_2,REST,PATEND
PPDAT_bf98_osti1:
.byte REST|D_8,N_FS,N_A,N_A,N_A,N_A|D_8,N_FS,REST|D_8,N_E,N_G,N_G,N_G,N_G|D_8
.byte N_E,REST|D_8,N_D,N_FS,N_FS,N_FS,N_FS|D_8,N_D,REST|D_8,N_C,N_E,N_E,N_E
.byte N_E|D_8,N_C,PATEND
PPDAT_bf98_osti2:
.byte N_E|D_8,INSTRUMENT,PI_bf98_osti,N_GH,N_CHH,N_CHH,N_CHH,N_CHH|D_8,N_GH
.byte INSTRUMENT,PI_orchhit,N_D|D_8,INSTRUMENT,PI_bf98_osti,N_FH,N_ASH,N_ASH
.byte N_ASH,N_ASH|D_8,N_FH,INSTRUMENT,PI_orchhit,N_C|D_8
.byte INSTRUMENT,PI_bf98_osti,N_EH,N_GH,N_GH,N_GH,N_GH|D_8,N_EH
.byte INSTRUMENT,PI_orchhit,N_F|D_8,INSTRUMENT,PI_bf98_osti,N_DH,N_FH,N_FH,N_FH
.byte N_FH|D_8,N_DH,INSTRUMENT,PI_orchhit,PATEND
PPDAT_bf98_melodyB1:
.byte REST|D_8,N_CS,N_F|D_8,N_GS,N_F|D_8,REST,N_G|D_8,N_F,N_DS|D_8,REST
.byte N_DS|D_8,N_CS,N_C|D_8,REST,N_DS|D_8,REST,N_CS|D_8,N_F,N_DS|D_D8,REST|D_D8
.byte N_GS|D_8,N_G,N_F|D_8,N_DS,N_CS|D_8,N_DS,N_F|D_8,REST,N_G|D_8,REST
.byte N_DS|D_8,REST,N_CS|D_8,REST,N_C|D_8,REST,N_DS|D_4,N_TIE,REST|D_4
.byte REST|D_D4,PATEND
PPDAT_bf98_counterB1:
.byte N_C|D_8,REST,N_DS|D_8,REST,N_GS|D_8,REST,N_F|D_8,REST,N_D|D_8,REST
.byte N_F|D_8,REST,N_DS|D_8,REST,N_G|D_8,REST,N_F|D_8,REST,N_G|D_D8,REST|D_D4
.byte N_GS|D_8,REST,N_DS|D_8,REST,N_C|D_8,REST,N_D|D_8,REST,N_F|D_8,REST
.byte N_D|D_8,REST,N_DS|D_8,REST,N_G|D_4,N_TIE,REST|D_4,REST|D_D4,PATEND
PPDAT_bf98_bassB1:
.byte N_FS|D_8,REST,N_GS|D_8,REST,N_AS|D_8,REST,N_GS|D_8,REST,N_DS|D_8,REST
.byte N_C|D_8,REST,N_CS|D_8,REST,N_CS|D_8,REST,N_GS|D_8,REST,N_CSH|D_8,REST
.byte N_CS|D_8,N_DS|D_8,N_F|D_8,PATEND
PPDAT_bf98_melodyB2:
.byte N_C|D_8,REST,N_E|D_8,REST,N_FS|D_D8,N_G|D_D8,REST|D_D8,N_G|D_8,N_F
.byte N_E|D_8,N_F,N_G|D_8,REST,N_E|D_8,REST,N_FS|D_8,N_E,N_D|D_8,N_E,N_FS|D_8
.byte N_GS,GRACE,4,N_GS,N_A|D_D8,N_GS|D_4,N_TIE,REST,PATEND
PPDAT_bf98_counterB2:
.byte N_DS|D_8,REST,N_FS|D_8,REST,N_GS|D_D8,N_F|D_8,REST,N_CS|D_8,REST,N_F|D_8
.byte REST,N_CS|D_8,REST,N_FS|D_8,REST,N_CS|D_8,REST,N_DS|D_8,REST,N_C|D_8,REST
.byte N_DS|D_8,REST,N_F|D_2,REST,PATEND
PPDAT_bf98_bassB2:
.byte N_D|D_8,REST,N_D|D_8,REST,N_G|D_8,REST,N_CH|D_8,REST,N_C|D_8,N_D|D_8
.byte N_E|D_8,N_F|D_8,REST,N_A|D_8,REST,N_CH|D_8,N_DH,N_G|D_8,REST,N_DH|D_8
.byte N_CH,N_B|D_8,REST,N_A|D_8,REST,N_CSH|D_8,REST,N_E|D_8,REST,N_A|D_8,REST
.byte REST|D_D4,PATEND
PPDAT_arp_waltz_bassintro:
.byte N_F,N_AH,N_AH,N_C,N_AH,N_AH,PATEND
PPDAT_arp_waltz_bass1:
.byte N_G,N_BH,N_BH,N_D,N_BH,N_BH,N_C,N_CHH,N_CHH,N_G,N_CHH,N_CHH,N_A,N_CHH
.byte N_CHH,N_E,N_CHH,N_CHH,N_D,N_AH,N_AH,N_A,N_CHH,N_CHH,PATEND
PPDAT_arp_waltz_bass2:
.byte N_C,N_ASH,N_ASH,N_F,N_AH,N_AH,N_C,N_D,N_E,PATEND
PPDAT_arp_waltz_melody:
.byte ARPEGGIO,$59,N_DS|D_8,ARPEGGIO,$36,N_G,ARPEGGIO,$47,N_GS|D_8,ARPEGGIO,$37
.byte N_AS,ARPEGGIO,$47,N_GS,ARPEGGIO,$38,N_F|D_D8,N_F,ARPEGGIO,$47,N_GS
.byte ARPEGGIO,$37,N_AS|D_8,ARPEGGIO,$47,N_GS,ARPEGGIO,$38,N_F|D_8,ARPEGGIO,$37
.byte N_F,ARPEGGIO,$47,N_DS,ARPEGGIO,$36,N_G|D_4,N_TIE,ARPEGGIO,$59,N_DS|D_8
.byte ARPEGGIO,$36,N_G,ARPEGGIO,$47,N_GS|D_8,ARPEGGIO,$59,N_DS,ARPEGGIO,$38,N_F
.byte ARPEGGIO,$59,N_GS|D_D8,ARPEGGIO,$38,N_G,ARPEGGIO,$59,N_GS,ARPEGGIO,$38
.byte N_G|D_8,N_F,ARPEGGIO,$49,N_DS|D_8,ARPEGGIO,$47,N_DS,ARPEGGIO,$38,N_C|D_4
.byte ARPEGGIO,$59,REST|D_8,PATEND
PPDAT_arp_waltz_interlude:
.byte ARPEGGIO,$70,N_C|D_D8,ARPEGGIO,$7C,N_C|D_D8,ARPEGGIO,$70,N_F|D_D8
.byte ARPEGGIO,$59,N_C|D_D8,ARPEGGIO,$70,N_D|D_D8,ARPEGGIO,$7C,N_D|D_D8
.byte ARPEGGIO,$57,N_G|D_D8,ARPEGGIO,$59,N_D|D_D8,ARPEGGIO,$70,N_C|D_D8
.byte ARPEGGIO,$7C,N_C|D_D8,ARPEGGIO,$70,N_F|D_D8,ARPEGGIO,$4C,N_F|D_D8
.byte ARPEGGIO,$7C,N_D|D_D8,ARPEGGIO,$59,N_D|D_D8,ARPEGGIO,$4C,N_C|D_D4,PATEND
PPDAT_allfeatures_between:
.byte ARPEGGIO,$00,N_C|D_D4,REST|D_1,N_TIE|D_1,N_TIE|D_1,N_TIE|D_1,PATEND
PPDAT_allfeatures_drum:
.byte DR_tkick|D_8,DR_clhat|D_8,DR_clhat|D_8,DR_tsnare|D_8,DR_clhat|D_8
.byte DR_ohat|D_8,DR_tkick|D_8,DR_clhat|D_8,DR_clhat|D_8,DR_tsnare|D_8
.byte DR_clhat|D_8,DR_tkick|D_8,PATEND
PPDAT_allfeatures_drumfill:
.byte DR_tkick|D_8,DR_clhat|D_8,DR_tkick|D_8,DR_tsnare|D_8,DR_tsnare|D_8
.byte DR_tsnare|D_8,PATEND
PPDAT_allfeatures_chords:
.byte ARPEGGIO,$37,REST|D_D4,N_D|D_1,REST|D_2,ARPEGGIO,$47,N_C|D_1,REST|D_8
.byte PATEND
PPDAT_allfeatures_bass:
.byte N_F|D_4,REST|D_8,N_GS|D_D4,REST|D_4,N_GS|D_8,N_F|D_4,N_GS|D_8,N_AS|D_4
.byte N_DS|D_4,REST|D_8,N_DS|D_4,REST|D_4,N_C|D_4,REST|D_8,PATEND
PPDAT_stairs_lead1:
.byte N_DS|D_D8,N_G|D_D8,N_G|D_D8,REST|D_8,N_DS,N_C|D_D8,N_DS|D_D8,N_DS|D_D8
.byte REST|D_D8,N_F|D_D8,N_G|D_8,N_GS,N_AS|D_8,N_GS,N_F|D_D8,N_G|D_D8,N_AS|D_D8
.byte N_AS|D_D8,REST|D_D8,PATEND
PPDAT_stairs_introg:
.byte N_C|D_D8,REST|D_D8,PATEND
PPDAT_stairs_lead1end:
.byte N_E|D_D8,N_D|D_D8,N_C|D_D8,REST|D_D8,PATEND
PPDAT_stairs_bass:
.byte N_C|D_D8,INSTRUMENT,PI_latebanjo,N_CHH|D_D8,INSTRUMENT,PI_tubbass
.byte TRANSPOSE,<-5,N_C|D_D8,INSTRUMENT,PI_latebanjo,TRANSPOSE,<29,N_C|D_D8
.byte INSTRUMENT,PI_tubbass,TRANSPOSE,<-31,N_C|D_D8,INSTRUMENT,PI_latebanjo
.byte TRANSPOSE,<7,N_CHH|D_D8,INSTRUMENT,PI_tubbass,N_C|D_D8
.byte INSTRUMENT,PI_latebanjo,N_CHH|D_D8,INSTRUMENT,PI_tubbass,TRANSPOSE,<-5
.byte N_C|D_D8,INSTRUMENT,PI_latebanjo,TRANSPOSE,<5,N_CHH|D_D8
.byte INSTRUMENT,PI_tubbass,N_D|D_D8,INSTRUMENT,PI_latebanjo,N_CHH|D_D8
.byte INSTRUMENT,PI_tubbass,N_C|D_D8,INSTRUMENT,PI_latebanjo,N_CHH|D_D8
.byte INSTRUMENT,PI_tubbass,TRANSPOSE,<-5,N_C|D_D8,INSTRUMENT,PI_latebanjo
.byte TRANSPOSE,<29,N_C|D_D8,INSTRUMENT,PI_tubbass,TRANSPOSE,<-24,PATEND
PPDAT_stairs_lead2:
.byte N_F|D_8,N_A,N_C|D_8,N_CH,N_F|D_8,N_A,N_C|D_8,N_CH,N_F|D_8,N_AS,N_D|D_8
.byte N_DH,N_F|D_8,N_AS,N_D|D_8,N_DH,N_G|D_8,N_AS,N_C|D_8,N_CH,N_G|D_8,N_AS
.byte N_C|D_8,N_CH,N_A|D_8,N_CH,N_F|D_8,N_CH,N_A|D_8,N_CH,N_F|D_8,N_CH,PATEND
PPDAT_stairs_lead2end:
.byte N_E|D_8,N_G,N_D|D_8,N_G,N_C|D_D8,REST|D_D8,PATEND
PPDAT_attacktest_drums:
.byte DR_kick|D_D8,DR_clhat|D_D8,DR_snare|D_D8,DR_clhat|D_8,DR_kick
.byte DR_clhat|D_D8,DR_kick|D_D8,DR_snare|D_D8,DR_clhat|D_D8,DR_kick|D_D8
.byte DR_clhat|D_D8,DR_snare|D_D8,DR_clhat|D_8,DR_snare,DR_clhat|D_D8
.byte DR_kick|D_D8,DR_snare|D_D8,DR_ohat|D_D8,PATEND
PPDAT_attacktest_bass:
.byte N_DS|D_4,REST,N_F|D_8,REST|D_2,REST|D_D4,N_C|D_8,REST,N_DS|D_4,REST
.byte N_F|D_8,REST|D_8,BEND,$16,N_GS|D_2,REST|D_4,BEND,$00,N_C|D_8,REST
.byte N_DS|D_4,REST,N_F|D_8,REST|D_2,REST|D_D4,N_C|D_8,REST,N_DS|D_4,REST
.byte N_F|D_8,REST|D_8,GRACE,2,N_DS,BEND,$16,N_FS|D_2,BEND,$00,REST|D_4,N_C|D_8
.byte REST,PATEND
PPDAT_attacktest_atk:
.byte N_C|D_8,N_DS,N_G|D_8,N_DS,N_G|D_8,N_AS,N_G|D_8,N_AS,N_DH|D_8,N_AS,N_G|D_8
.byte N_AS,N_G|D_8,N_DS,N_G|D_8,N_DS,PATEND
PPDAT_attacktest_drumfill:
.byte DR_snare|D_8,DR_ohat,DR_snare,DR_snare,DR_snare,PATEND
pently_songs:  ; 9 entries, 873 bytes
songdef PS_argument, PSDAT_argument
songdef PS_sticks, PSDAT_sticks
songdef PS_twinkle, PSDAT_twinkle
songdef PS_canon, PSDAT_canon
songdef PS_bf98, PSDAT_bf98
songdef PS_arp_waltz, PSDAT_arp_waltz
songdef PS_allfeatures, PSDAT_allfeatures
songdef PS_stairs, PSDAT_stairs
songdef PS_attacktest, PSDAT_attacktest
PSDAT_argument:
playPatNoise PP_argument_drum34
setTempo 360
setBeatDuration D_8
waitRows 48
playPatSq2 PP_argument_commemorate3, 23, PI_bf98_flute2
waitRows 48
playPatSq2 PP_argument_tubbassloop, 0, PI_tubbass_slow
waitRows 24
stopPatSq2
waitRows 24
playPatSq2 PP_argument_intro_dut, 18, PI_dut
waitRows 48
stopPatSq2
playPatTri PP_argument_bass, 10, PI_bass
waitRows 96
playPatSq2 PP_argument_melody, 27, PI_bf98_flute2
waitRows 96
attackOnSq2
playPatSq2 PP_argument_bass, 10, PI_bf98_flute2
playPatAttack PP_argument_melodyend, 30, PI_bf98_flute2
playPatNoise PP_argument_drum34_8
waitRows 6
stopPatAttack
waitRows 42
playPatSq1 PP_argument_bass, 22, PI_bf98_flute2
waitRows 48
playPatSq1 PP_argument_tubbassloop, 12, PI_tubbass_slow
playPatSq2 PP_argument_melody, 39, PI_bf98_flute2
waitRows 96
playPatSq2 PP_argument_descendingchords, 19, PI_bf98_flute2
waitRows 96
stopPatSq1
playPatSq2 PP_argument_twinkle, 50, PI_argtwinkle
waitRows 192
playPatSq1 PP_argument_tubbassloop, 12, PI_tubbass_slow
playPatSq2 PP_argument_melody, 39, PI_bf98_flute2
attackOnSq1
playPatAttack PP_argument_twinkle, 50, PI_argtwinkle
waitRows 96
attackOnSq2
playPatSq2 PP_argument_bass, 10, PI_bf98_flute2
playPatAttack PP_argument_melodyend, 42, PI_bf98_flute2
stopPatSq1
waitRows 6
stopPatAttack
waitRows 42
playPatSq1 PP_argument_bass, 22, PI_bf98_flute2
waitRows 48
playPatSq2 PP_argument_cadenza, 34, PI_bf98_flute2
attackOnSq2
playPatAttack PP_argument_cadenza, 22, PI_bf98_fluteshort
playPatSq1 PP_argument_cadenzabass, 10, PI_tubbass_slow
waitRows 144
playPatSq2 PP_argument_cadenzaend, 15, PI_bf98_flute2
playPatAttack PP_argument_cadenzaend, 3, PI_bf98_fluteshort
waitRows 24
playPatAttack PP_argument_cadenzaend2, 31, PI_bf98_fluteshort
waitRows 22
noteOnSq1 24, PI_argdive
waitRows 2
stopPatSq1
stopPatSq2
stopPatTri
stopPatAttack
playPatNoise PP_argument_drum68
attackOnSq1
playPatAttack PP_argument_drum68top, 12, PI_tubbass
playPatTri PP_argument_bass68, 10, PI_arg2bass
setBeatDuration D_D8
waitRows 192
playPatSq2 PP_argument_harmony68_1, 31, PI_bf98_flute2
waitRows 6
playPatSq1 PP_argument_harmony68_2, 10, PI_bf98_flute2
waitRows 90
playPatAttack PP_argument_harmony68_3, 27, PI_bf98_flute2
waitRows 96
playPatAttack PP_argument_drum68top, 12, PI_tubbass
playPatSq2 PP_argument_melody68, 22, PI_bf98_flute2
playPatNoise PP_argument_drum68allkick
waitRows 96
playPatNoise PP_argument_drum68
playPatSq2 PP_argument_harmony68_1, 31, PI_bf98_flute2
playPatTri PP_argument_harmony68_2, 10, PI_bf98_flute2
waitRows 96
playPatNoise PP_argument_drum68allkick
playPatAttack PP_argument_drum68top, 12, PI_tubbass
playPatSq2 PP_argument_melody68, 22, PI_bf98_flute2
playPatTri PP_argument_bass68, 10, PI_arg2bass
waitRows 96
playPatTri PP_argument_harmony68_2, 10, PI_bf98_flute2
playPatNoise PP_argument_drum68nokick
waitRows 96
stopPatSq1
stopPatSq2
playPatNoise PP_argument_drum68allkick
playPatTri PP_argument_bass68, 10, PI_arg2bass
waitRows 96
playPatNoise PP_argument_drum68
playPatTri PP_argument_bass68end, 10, PI_arg2bass
playPatAttack PP_argument_drum68topend, 12, PI_tubbass
waitRows 96
stopPatTri
dalSegno
PSDAT_sticks:
playPatSq1 PP_sticks_introbanjo1, 24, PI_banjo
playPatSq2 PP_sticks_introch2, 5, PI_toot0
setTempo 600
setBeatDuration D_D4
waitRows 60
playPatSq1 PP_sticks_introbanjo2, 26, PI_banjo
waitRows 12
playPatTri PP_sticks_introbass, 0, PI_bass
playPatNoise PP_sticks_introdrum
waitRows 48
playPatSq2 PP_sticks_chords2, 39, PI_toot0
playPatSq1 PP_sticks_chords1start, 36, PI_toot0
stopPatTri
waitRows 24
stopPatNoise
waitRows 24
playPatTri PP_sticks_bassstart, 44, PI_toot1
waitRows 48
segno
playPatSq1 PP_sticks_chords1, 3, PI_toot0
playPatSq2 PP_sticks_chords2, 39, PI_toot0
playPatTri PP_sticks_bass, 15, PI_toot0
playPatNoise PP_sticks_drum
waitRows 256
waitRows 128
playPatTri PP_sticks_v_iv_bass, 22, PI_toot0
playPatSq1 PP_sticks_v_iv_chords1, 24, PI_toot0
playPatSq2 PP_sticks_v_iv_chords2, 10, PI_tubbass
waitRows 72
stopPatNoise
waitRows 24
dalSegno
PSDAT_twinkle:
playPatSq2 PP_twinkle_melody, 27, PI_bf98_osti
playPatNoise PP_twinkle_beat
playPatTri PP_twinkle_bassline, 22, PI_bass
setTempo 270
setBeatDuration D_D8
waitRows 132
setTempo 225
waitRows 6
playPatTri PP_twinkle_bassfinal, 27, PI_bass
setTempo 180
waitRows 3
stopPatNoise
waitRows 3
fine
PSDAT_canon:
playPatTri PP_canon_bass, 17, PI_bass
setTempo 450
setBeatDuration D_2
waitRows 64
playPatSq2 PP_canon_melody, 26, PI_bf98_osti
waitRows 64
playPatSq1 PP_canon_melody, 26, PI_fiddle2
waitRows 256
waitRows 256
waitRows 256
waitRows 256
waitRows 256
waitRows 256
waitRows 104
setTempo 400
waitRows 8
setTempo 350
waitRows 8
setTempo 300
waitRows 8
playPatSq1 PP_canon_melody, 26, PI_fiddle2
setTempo 250
waitRows 8
fine
PSDAT_bf98:
playPatSq2 PP_bf98_orchhits, 31, PI_orchhit
setTempo 400
setBeatDuration D_D8
waitRows 36
playPatTri PP_bf98_bassA, 17, PI_bass
playPatNoise PP_bf98_drums
noteOnNoise 5, PI_crashcymbal
waitRows 36
segno
playPatSq2 PP_bf98_melodyA, 33, PI_bf98_flute
playPatNoise PP_bf98_drums
waitRows 36
playPatSq1 PP_bf98_thirdsA, 29, PI_bf98_flute2
waitRows 36
stopPatSq2
playPatSq1 PP_bf98_osti1, 41, PI_bf98_osti
playPatSq2 PP_bf98_osti2, 31, PI_orchhit
waitRows 72
playPatSq2 PP_bf98_melodyA, 33, PI_bf98_flute
playPatSq1 PP_bf98_thirdsA, 29, PI_bf98_flute2
waitRows 72
playPatSq2 PP_bf98_melodyB1, 35, PI_bf98_flute
playPatSq1 PP_bf98_counterB1, 28, PI_bf98_flute2
playPatTri PP_bf98_bassB1, 18, PI_bass
waitRows 63
playPatNoise PP_bf98_drums_tripletfill
waitRows 9
playPatNoise PP_bf98_drums
waitRows 18
playPatSq2 PP_bf98_melodyB2, 34, PI_bf98_flute
playPatSq1 PP_bf98_counterB2, 28, PI_bf98_flute2
playPatTri PP_bf98_bassB2, 17, PI_bass
waitRows 45
playPatNoise PP_bf98_drums_quietfill
stopPatSq1
stopPatSq2
waitRows 9
playPatNoise PP_bf98_drums
playPatTri PP_bf98_bassA, 17, PI_bass
waitRows 36
playPatNoise PP_bf98_drums_break
waitRows 27
playPatNoise PP_bf98_drums_resumefill
waitRows 9
dalSegno
PSDAT_arp_waltz:
playPatSq1 PP_arp_waltz_bassintro, 3, PI_toot0
setTempo 180
setBeatDuration 0
waitRows 12
segno
playPatSq2 PP_arp_waltz_melody, 24, PI_stringlead
playPatSq1 PP_arp_waltz_bass1, 1, PI_toot0
waitRows 39
playPatSq1 PP_arp_waltz_bass2, 3, PI_toot0
waitRows 9
playPatSq2 PP_arp_waltz_interlude, 44, PI_argtwinkle
playPatSq1 PP_arp_waltz_bass1, 1, PI_toot0
waitRows 39
playPatSq1 PP_arp_waltz_bass2, 3, PI_toot0
waitRows 9
dalSegno
PSDAT_allfeatures:
playPatSq1 PP_allfeatures_between, 6, PI_feat_power
playPatSq2 PP_allfeatures_between, 13, PI_feat_power
playPatTri PP_allfeatures_between, 30, PI_bass
setTempo 720
setBeatDuration D_D4
waitRows 12
stopPatSq1
playPatNoise PP_allfeatures_drum
waitRows 36
playPatNoise PP_allfeatures_drumfill
waitRows 12
playPatTri PP_allfeatures_bass, 25, PI_bass
playPatNoise PP_allfeatures_drum
playPatSq2 PP_allfeatures_chords, 28, PI_feat_wah
waitRows 84
playPatNoise PP_allfeatures_drumfill
waitRows 12
stopPatNoise
dalSegno
PSDAT_stairs:
playPatSq2 PP_stairs_lead1, 19, PI_banjo
setTempo 300
setBeatDuration D_D8
waitRows 51
playPatSq1 PP_stairs_introg, 34, PI_latebanjo
waitRows 33
playPatSq2 PP_stairs_lead1end, 22, PI_banjo
waitRows 6
stopPatSq1
waitRows 6
segno
playPatSq2 PP_stairs_lead1, 19, PI_banjo
playPatSq1 PP_stairs_bass, 10, PI_tubbass
waitRows 84
playPatSq2 PP_stairs_lead1end, 22, PI_banjo
waitRows 6
playPatSq1 PP_stairs_introg, 10, PI_tubbass
waitRows 6
playPatSq2 PP_stairs_lead2, 17, PI_banjo
playPatSq1 PP_stairs_bass, 10, PI_tubbass
waitRows 84
playPatSq2 PP_stairs_lead2end, 22, PI_banjo
waitRows 6
playPatSq1 PP_stairs_introg, 10, PI_tubbass
waitRows 6
dalSegno
PSDAT_attacktest:
playPatNoise PP_attacktest_drums
playPatTri PP_attacktest_bass, 15, PI_bass
attackOnTri
playPatAttack PP_attacktest_atk, 56, PI_framepop
setTempo 515
setBeatDuration D_D4
waitRows 72
playPatAttack PP_attacktest_atk, 54, PI_framepop
waitRows 18
playPatNoise PP_attacktest_drumfill
waitRows 6
dalSegno

; Make music data available to Pently
.export pently_sfx_table,pently_instruments,pently_drums,pently_patterns
.export pently_songs

; Sound effect, instrument, and song names for your program to .importzp
.exportzp PE_kick,PE_snare,PE_hihat,PE_quiethat,PE_openhat,PE_snarehat
.exportzp PE_trikick,PE_trisnare,PE_tubfloorA,PE_arghatbuzz,PE_stickskick
.exportzp PE_stickshatlo,PI_bass,PI_framepop,PI_banjo,PI_latebanjo,PI_tubbass
.exportzp PI_tubbass_slow,PI_dut,PI_feat_wah,PI_feat_power,PI_bf98_flute
.exportzp PI_bf98_flute2,PI_bf98_osti,PI_orchhit,PI_crashcymbal,PI_fiddle2
.exportzp PI_bf98_fluteshort,PI_vowele,PI_vowela,PI_argtwinkle,PI_argdive
.exportzp PI_arg2bass,PI_toot0,PI_toot1,PI_stringlead,PS_argument,PS_sticks
.exportzp PS_twinkle,PS_canon,PS_bf98,PS_arp_waltz,PS_allfeatures,PS_stairs
.exportzp PS_attacktest

; Total music data size: 4133 bytes
; pently_sfx_table: 250 bytes
;   PE_kick: 24 bytes
;   PE_snare: 24 bytes
;   PE_hihat: 12 bytes
;   PE_quiethat: 8 bytes
;   PE_openhat: 34 bytes
;   PE_snarehat: 34 bytes
;   PE_trikick: 14 bytes
;   PE_trisnare: 12 bytes
;   PE_tubfloorA: 28 bytes
;   PE_arghatbuzz: 16 bytes
;   PE_stickskick: 28 bytes
;   PE_stickshatlo: 16 bytes
; pently_instruments: 466 bytes
;   PI_bass: 5 bytes
;   PI_framepop: 7 bytes
;   PI_banjo: 21 bytes
;   PI_latebanjo: 23 bytes
;   PI_tubbass: 17 bytes
;   PI_tubbass_slow: 21 bytes
;   PI_dut: 23 bytes
;   PI_feat_wah: 29 bytes
;   PI_feat_power: 5 bytes
;   PI_bf98_flute: 19 bytes
;   PI_bf98_flute2: 19 bytes
;   PI_bf98_osti: 13 bytes
;   PI_orchhit: 53 bytes
;   PI_crashcymbal: 5 bytes
;   PI_fiddle2: 15 bytes
;   PI_bf98_fluteshort: 13 bytes
;   PI_vowele: 19 bytes
;   PI_vowela: 19 bytes
;   PI_argtwinkle: 25 bytes
;   PI_argdive: 45 bytes
;   PI_arg2bass: 5 bytes
;   PI_toot0: 25 bytes
;   PI_toot1: 17 bytes
;   PI_stringlead: 23 bytes
; pently_drums: 24 bytes
;   DR_kick: 2 bytes
;   DR_snare: 2 bytes
;   DR_clhat: 2 bytes
;   DR_ohat: 2 bytes
;   DR_tkick: 2 bytes
;   DR_tsnare: 2 bytes
;   DR_tsohat: 2 bytes
;   DR_tubkick: 2 bytes
;   DR_arghatbuzz: 2 bytes
;   DR_quiethat: 2 bytes
;   DR_stickskick: 2 bytes
;   DR_stickshatlo: 2 bytes
; pently_patterns: 2520 bytes
;   PP_argument_drum34: 6 bytes
;   PP_argument_drum34_8: 9 bytes
;   PP_argument_commemorate3: 99 bytes
;   PP_argument_tubbassloop: 12 bytes
;   PP_argument_intro_dut: 18 bytes
;   PP_argument_bass: 31 bytes
;   PP_argument_melody: 13 bytes
;   PP_argument_melodyend: 6 bytes
;   PP_argument_descendingchords: 67 bytes
;   PP_argument_twinkle: 19 bytes
;   PP_argument_cadenzabass: 7 bytes
;   PP_argument_cadenza: 55 bytes
;   PP_argument_cadenzaend: 38 bytes
;   PP_argument_cadenzaend2: 21 bytes
;   PP_argument_drum68: 5 bytes
;   PP_argument_drum68nokick: 6 bytes
;   PP_argument_drum68allkick: 6 bytes
;   PP_argument_drum68top: 4 bytes
;   PP_argument_bass68: 51 bytes
;   PP_argument_harmony68_1: 19 bytes
;   PP_argument_harmony68_2: 11 bytes
;   PP_argument_harmony68_3: 19 bytes
;   PP_argument_melody68: 46 bytes
;   PP_argument_bass68end: 27 bytes
;   PP_argument_drum68topend: 4 bytes
;   PP_sticks_introbanjo1: 9 bytes
;   PP_sticks_introch2: 69 bytes
;   PP_sticks_introbanjo2: 19 bytes
;   PP_sticks_introbass: 10 bytes
;   PP_sticks_introdrum: 14 bytes
;   PP_sticks_bassstart: 10 bytes
;   PP_sticks_bass: 18 bytes
;   PP_sticks_chords1start: 12 bytes
;   PP_sticks_chords1: 45 bytes
;   PP_sticks_chords2: 10 bytes
;   PP_sticks_drum: 7 bytes
;   PP_sticks_v_iv_bass: 29 bytes
;   PP_sticks_v_iv_chords1: 20 bytes
;   PP_sticks_v_iv_chords2: 36 bytes
;   PP_twinkle_melody: 31 bytes
;   PP_twinkle_bassline: 35 bytes
;   PP_twinkle_bassfinal: 4 bytes
;   PP_twinkle_beat: 8 bytes
;   PP_canon_bass: 11 bytes
;   PP_canon_melody: 633 bytes
;   PP_bf98_orchhits: 9 bytes
;   PP_bf98_drums: 14 bytes
;   PP_bf98_drums_resumefill: 9 bytes
;   PP_bf98_drums_tripletfill: 8 bytes
;   PP_bf98_drums_quietfill: 6 bytes
;   PP_bf98_drums_break: 6 bytes
;   PP_bf98_bassA: 26 bytes
;   PP_bf98_melodyA: 27 bytes
;   PP_bf98_thirdsA: 22 bytes
;   PP_bf98_osti1: 31 bytes
;   PP_bf98_osti2: 47 bytes
;   PP_bf98_melodyB1: 43 bytes
;   PP_bf98_counterB1: 41 bytes
;   PP_bf98_bassB1: 26 bytes
;   PP_bf98_melodyB2: 31 bytes
;   PP_bf98_counterB2: 28 bytes
;   PP_bf98_bassB2: 35 bytes
;   PP_arp_waltz_bassintro: 9 bytes
;   PP_arp_waltz_bass1: 27 bytes
;   PP_arp_waltz_bass2: 12 bytes
;   PP_arp_waltz_melody: 84 bytes
;   PP_arp_waltz_interlude: 48 bytes
;   PP_allfeatures_between: 10 bytes
;   PP_allfeatures_drum: 15 bytes
;   PP_allfeatures_drumfill: 9 bytes
;   PP_allfeatures_chords: 12 bytes
;   PP_allfeatures_bass: 17 bytes
;   PP_stairs_lead1: 22 bytes
;   PP_stairs_introg: 5 bytes
;   PP_stairs_lead1end: 7 bytes
;   PP_stairs_bass: 69 bytes
;   PP_stairs_lead2: 35 bytes
;   PP_stairs_lead2end: 9 bytes
;   PP_attacktest_drums: 21 bytes
;   PP_attacktest_bass: 44 bytes
;   PP_attacktest_atk: 19 bytes
;   PP_attacktest_drumfill: 8 bytes
; pently_songs: 873 bytes
;   PS_argument: 325 bytes
;   PS_sticks: 99 bytes
;   PS_twinkle: 38 bytes
;   PS_canon: 56 bytes
;   PS_bf98: 142 bytes
;   PS_arp_waltz: 45 bytes
;   PS_allfeatures: 60 bytes
;   PS_stairs: 75 bytes
;   PS_attacktest: 33 bytes
; Period table of length 76 for pal
.export periodTableLo, periodTableHi
periodTableLo:
.byt $60,$f6,$92,$34,$db,$86,$37,$ec,$a5,$62,$23,$e8,$b0,$7b,$49,$19,$ed,$c3
.byt $9b,$75,$52,$31,$11,$f3,$d7,$bd,$a4,$8c,$76,$61,$4d,$3a,$29,$18,$08,$f9
.byt $eb,$de,$d1,$c6,$ba,$b0,$a6,$9d,$94,$8b,$84,$7c,$75,$6e,$68,$62,$5d,$57
.byt $52,$4e,$49,$45,$41,$3e,$3a,$37,$34,$31,$2e,$2b,$29,$26,$24,$22,$20,$1e
.byt $1d,$1b,$19,$18
periodTableHi:
.byt 7,6,6,6,5,5,5,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0
