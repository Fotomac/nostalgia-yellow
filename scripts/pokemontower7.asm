PokemonTower7Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower7ScriptPointers
	ld a, [wPokemonTower7CurScript]
	call JumpTable
	ret

PokemonTower7Script_60d01:
	xor a
	ld [wJoyIgnore], a
PokemonTower7Script_60d05:
	ld [wPokemonTower7CurScript], a
	ret

PokemonTower7ScriptPointers:
	dw PokemonTower7Script0
	dw PokemonTower7Script1
	dw PokemonTower7Script2
	dw PokemonTower7Script3
	dw PokemonTower7Script4
	dw PokemonTower7Script5
	dw PokemonTower7Script6
	dw PokemonTower7Script7
	dw PokemonTower7Script8
	dw PokemonTower7Script9
	dw PokemonTower7Script10
	dw PokemonTower7Script11

PokemonTower7Script0:
	CheckEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_0
	call z, PokemonTower7Script_60d2a
	ret

PokemonTower7Script_60d2a:
	ld a, [wYCoord]
	cp $c
	ret nz
	ResetEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	ld a, [wXCoord]
	cp $a
	jr z, .asm_60d47
	ld a, [wXCoord] ; why?
	cp $b
	ret nz
	SetEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
.asm_60d47
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	xor a
	ld [hJoyHeld], a
	ld a, $FF ^ (A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, HS_POKEMONTOWER_7_JESSIE
	call PokemonTower7Script_60eaf
	ld a, HS_POKEMONTOWER_7_JAMES
	call PokemonTower7Script_60eaf
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $4
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $1
	call PokemonTower7Script_60d05
	ret

PokemonTower7MovementData_60d7a:
	db $4
PokemonTower7MovementData_60d7b:
	db $4
	db $4
	db $4
	db $FF

PokemonTower7Script1:
	ld de, PokemonTower7MovementData_60d7b
	CheckEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	jr z, .asm_60d8c
	ld de, PokemonTower7MovementData_60d7a
.asm_60d8c
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $2
	call PokemonTower7Script_60d05
	ret

PokemonTower7Script2:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd730]
	bit 0, a
	ret nz
PokemonTower7Script3:
	ld a, $0
	ld [wSpriteStateData1 + 1 * $10 + 9], a
	CheckEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	jr z, .asm_60dba
	ld a, $c
	ld [wSpriteStateData1 + 1 * $10 + 9], a
.asm_60dba
	ld a, $2
	ld [wSpriteStateData1 + 1 * $10 + 1], a
PokemonTower7Script4:
	ld de, PokemonTower7MovementData_60d7a
	CheckEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	jr z, .asm_60dcc
	ld de, PokemonTower7MovementData_60d7b
.asm_60dcc
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $5
	call PokemonTower7Script_60d05
	ret
PokemonTower7Script5:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd730]
	bit 0, a
	ret nz
PokemonTower7Script6:
	ld a, $2
	ld [wSpriteStateData1 + $2 * $10 + $1], a
	ld a, $8
	ld [wSpriteStateData1 + $2 * $10 + $9], a
	CheckEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	jr z, .asm_60dff
	ld a, $0
	ld [wSpriteStateData1 + $2 * $10 + $9], a
.asm_60dff
	call Delay3
	ld a, $FF ^ (A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
PokemonTower7Script7:
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, PokemonTower7JessieJamesEndBattleText
	ld de, PokemonTower7JessieJamesEndBattleText
	call SaveEndBattleTextPointers
	ld a, OPP_ROCKET
	ld [wCurOpponent], a
	ld a, $2c
	ld [wTrainerNo], a
	xor a
	ld [hJoyHeld], a
	ld [wJoyIgnore], a
	ld a, $8
	call PokemonTower7Script_60d05
	ret

PokemonTower7Script8:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower7Script_60d01
	ld a, $2
	ld [wSpriteStateData1 + 1 * $10 + 1], a
	ld [wSpriteStateData1 + 2 * $10 + 1], a
	xor a
	ld [wSpriteStateData1 + 1 * $10 + 9], a
	ld [wSpriteStateData1 + 2 * $10 + 9], a
	ld a, $FF ^ (A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $6
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $9
	call PokemonTower7Script_60d05
	ret

PokemonTower7Script9:
	ld a, $ff
	ld [wJoyIgnore], a
	call GBFadeOutToBlack
	ld a, HS_POKEMONTOWER_7_JESSIE
	call PokemonTower7Script_60ebe
	ld a, HS_POKEMONTOWER_7_JAMES
	call PokemonTower7Script_60ebe
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld a, $a
	call PokemonTower7Script_60d05
	ret

PokemonTower7Script10:
	call PlayDefaultMusic
	xor a
	ld [hJoyHeld], a
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_0
	ld a, $0
	call PokemonTower7Script_60d05
	ret

PokemonTower7Script_60eaf:
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call Delay3
	ret

PokemonTower7Script_60ebe
	ld [wMissableObjectIndex], a
	predef HideObject
	ret

PokemonTower7Script11:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, HS_POKEMONTOWER_7_MR_FUJI
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, SPRITE_FACING_UP
	ld [wPlayerFacingDirection], a
	ld a, LAVENDER_HOUSE_1
	ld [hWarpDestinationMap], a
	ld a, $1
	ld [wDestinationWarpID], a
	ld a, LAVENDER_TOWN
	ld [wLastMap], a
	ld hl, wd72d
	set 3, [hl]
	ld a, $0
	ld [wPokemonTower7CurScript], a
	ret

PokemonTower7TextPointers:
	dw PokemonTower7Text1
	dw PokemonTower7Text2
	dw PokemonTower7Text3
	dw PokemonTower7Text4
	dw PokemonTower7Text5
	dw PokemonTower7Text6

PokemonTower7Text1:
PokemonTower7Text2:
	db "@"

PokemonTower7Text4:
	TX_FAR _PokemonTowerJessieJamesText1
	TX_ASM
	ld c, 10
	call DelayFrames
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, $0
	ld [wEmotionBubbleSpriteIndex], a
	ld a, EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld c, 20
	call DelayFrames
	jp TextScriptEnd

PokemonTower7Text5:
	TX_FAR _PokemonTowerJessieJamesText2
	db "@"

PokemonTower7JessieJamesEndBattleText:
	TX_FAR _PokemonTowerJessieJamesText3
	db "@"

PokemonTower7Text6:
	TX_FAR _PokemonTowerJessieJamesText4
	TX_ASM
	ld c, 64
	call DelayFrames
	jp TextScriptEnd

PokemonTower7Text3:
	TX_ASM
	ld hl, PokemonTower7Text_60f75
	call PrintText
	SetEvent EVENT_RESCUED_MR_FUJI
	SetEvent EVENT_RESCUED_MR_FUJI_2
	ld a, HS_LAVENDER_HOUSE_1_MR_FUJI
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_SAFFRON_CITY_E
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_SAFFRON_CITY_F
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, $b
	ld [wPokemonTower7CurScript], a
	jp TextScriptEnd

PokemonTower7Text_60f75:
	TX_FAR _TowerRescueFujiText
	db "@"
