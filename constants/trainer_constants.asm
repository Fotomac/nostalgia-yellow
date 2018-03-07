trainer_const: MACRO
\1     EQU const_value
OPP_\1 EQU const_value + 204
const_value = const_value + 1
ENDM

const_value = 1

	trainer_const YOUNGSTER     ; $01 | OPP = $CD
	trainer_const BUG_CATCHER   ; $02 | OPP = $CE
	trainer_const LASS          ; $03 | OPP = $CF
	trainer_const SAILOR        ; $04 | OPP = $D0
	trainer_const JR_TRAINER_M  ; $05 | OPP = $D1
	trainer_const JR_TRAINER_F  ; $06 | OPP = $D2
	trainer_const POKEMANIAC    ; $07 | OPP = $D3
	trainer_const SUPER_NERD    ; $08 | OPP = $D4
	trainer_const HIKER         ; $09 | OPP = $D5
	trainer_const BIKER         ; $0A | OPP = $D6
	trainer_const BURGLAR       ; $0B | OPP = $D7
	trainer_const ENGINEER      ; $0C | OPP = $D8
	trainer_const SWIMMER_F     ; $0D | OPP = $D9
	trainer_const FISHER        ; $0E | OPP = $DA
	trainer_const SWIMMER       ; $0F | OPP = $DB
	trainer_const CUE_BALL      ; $10 | OPP = $DC
	trainer_const GAMBLER       ; $11 | OPP = $DD
	trainer_const BEAUTY        ; $12 | OPP = $DE
	trainer_const PSYCHIC_TR    ; $13 | OPP = $DF
	trainer_const ROCKER        ; $14 | OPP = $E0
	trainer_const JUGGLER       ; $15 | OPP = $E1
	trainer_const TAMER         ; $16 | OPP = $E2
	trainer_const BIRD_KEEPER   ; $17 | OPP = $E3
	trainer_const BLACKBELT     ; $18 | OPP = $E4
	trainer_const SONY1         ; $19 | OPP = $E5
	trainer_const PROF_OAK      ; $1A | OPP = $E6
	trainer_const CHIEF         ; $1B | OPP = $E7
	trainer_const SCIENTIST     ; $1C | OPP = $E8
	trainer_const GIOVANNI      ; $1D | OPP = $E9
	trainer_const ROCKET        ; $1E | OPP = $EA
	trainer_const COOLTRAINER_M ; $1F | OPP = $EB
	trainer_const COOLTRAINER_F ; $20 | OPP = $EC
	trainer_const BRUNO         ; $21 | OPP = $ED
	trainer_const BROCK         ; $22 | OPP = $EE
	trainer_const MISTY         ; $23 | OPP = $EF
	trainer_const LT_SURGE      ; $24 | OPP = $F0
	trainer_const ERIKA         ; $25 | OPP = $F1
	trainer_const KOGA          ; $26 | OPP = $F2
	trainer_const BLAINE        ; $27 | OPP = $F3
	trainer_const SABRINA       ; $28 | OPP = $F4
	trainer_const GENTLEMAN     ; $29 | OPP = $F5
	trainer_const SONY2         ; $2A | OPP = $F6
	trainer_const SONY3         ; $2B | OPP = $F7
	trainer_const LORELEI       ; $2C | OPP = $F8
	trainer_const CHANNELER     ; $2D | OPP = $F9
	trainer_const AGATHA        ; $2E | OPP = $FA
	trainer_const LANCE         ; $2F | OPP = $FB
	trainer_const JANINE        ; $30 | OPP = $FC
