ViridianForestScript:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianForestTrainerHeaders
	ld de, ViridianForestScriptPointers
	ld a, [wViridianForestCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianForestCurScript], a
	ret

ViridianForestScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

ViridianForestTextPointers:
	dw ViridianForestText1
	dw ViridianForestText2
	dw ViridianForestText3
	dw ViridianForestText4
	dw ViridianForestText5
	dw ViridianForestText6
	dw ViridianForestText7
	dw ViridianForestText8
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw ViridianForestText10
	dw ViridianForestText11
	dw ViridianForestText12
	dw ViridianForestText13
	dw ViridianForestText14
	dw ViridianForestText15
	dw ViridianForestText16

ViridianForestTrainerHeaders:
ViridianForestTrainerHeader0:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0
	dw ViridianForestBattleText1 ; TextBeforeBattle
	dw ViridianForestAfterBattleText1 ; TextAfterBattle
	dw ViridianForestEndBattleText1 ; TextEndBattle
	dw ViridianForestEndBattleText1 ; TextEndBattle

ViridianForestTrainerHeader1:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1
	dw ViridianForestBattleText2 ; TextBeforeBattle
	dw ViridianForestAfterBattleText2 ; TextAfterBattle
	dw ViridianForestEndBattleText2 ; TextEndBattle
	dw ViridianForestEndBattleText2 ; TextEndBattle

ViridianForestTrainerHeader2:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2
	dw ViridianForestBattleText3 ; TextBeforeBattle
	dw ViridianForestAfterBattleText3 ; TextAfterBattle
	dw ViridianForestEndBattleText3 ; TextEndBattle
	dw ViridianForestEndBattleText3 ; TextEndBattle

ViridianForestTrainerHeader3:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_3
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_3
	dw ViridianForestBattleText4 ; TextBeforeBattle
	dw ViridianForestAfterBattleText4 ; TextAfterBattle
	dw ViridianForestEndBattleText4 ; TextEndBattle
	dw ViridianForestEndBattleText4 ; TextEndBattle

ViridianForestTrainerHeader4:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_4
	dw ViridianForestBattleText5 ; TextBeforeBattle
	dw ViridianForestAfterBattleText5 ; TextAfterBattle
	dw ViridianForestEndBattleText5 ; TextEndBattle
	dw ViridianForestEndBattleText5 ; TextEndBattle

ViridianForestTrainerHeader5:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_5
	dw ViridianForestBattleText6 ; TextBeforeBattle
	dw ViridianForestAfterBattleText6 ; TextAfterBattle
	dw ViridianForestEndBattleText6 ; TextEndBattle
	dw ViridianForestEndBattleText6 ; TextEndBattle

ViridianForestTrainerHeader6:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_6
	dw ViridianForestBattleText7 ; TextBeforeBattle
	dw ViridianForestAfterBattleText7 ; TextAfterBattle
	dw ViridianForestEndBattleText7 ; TextEndBattle
	dw ViridianForestEndBattleText7 ; TextEndBattle

	db $ff

ViridianForestText1:
	TX_FAR _ViridianForestText1
	db "@"

ViridianForestText2:
	TX_ASM
	ld hl, ViridianForestTrainerHeader0
	jr ViridianForestTalkToTrainer

ViridianForestText3:
	TX_ASM
	ld hl, ViridianForestTrainerHeader1
	jr ViridianForestTalkToTrainer

ViridianForestText4:
	TX_ASM
	ld hl, ViridianForestTrainerHeader2
	jr ViridianForestTalkToTrainer

ViridianForestText5:
	TX_ASM
	ld hl, ViridianForestTrainerHeader3
	jr ViridianForestTalkToTrainer

ViridianForestText6:
	TX_ASM
	ld hl, ViridianForestTrainerHeader4
	jr ViridianForestTalkToTrainer

ViridianForestText7:
	TX_ASM
	ld hl, ViridianForestTrainerHeader5
	jr ViridianForestTalkToTrainer

ViridianForestText8:
	TX_ASM
	ld hl, ViridianForestTrainerHeader6
ViridianForestTalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestBattleText1:
	TX_FAR _ViridianForestBattleText1
	db "@"

ViridianForestEndBattleText1:
	TX_FAR _ViridianForestEndBattleText1
	db "@"

ViridianForestAfterBattleText1:
	TX_FAR _ViridianFrstAfterBattleText1
	db "@"

ViridianForestBattleText2:
	TX_FAR _ViridianForestBattleText2
	db "@"

ViridianForestEndBattleText2:
	TX_FAR _ViridianForestEndBattleText2
	db "@"

ViridianForestAfterBattleText2:
	TX_FAR _ViridianFrstAfterBattleText2
	db "@"

ViridianForestBattleText3:
	TX_FAR _ViridianForestBattleText3
	db "@"

ViridianForestEndBattleText3:
	TX_FAR _ViridianForestEndBattleText3
	db "@"

ViridianForestAfterBattleText3:
	TX_FAR _ViridianFrstAfterBattleText3
	db "@"

ViridianForestBattleText4:
	TX_FAR _ViridianForestBattleTextPikaGirl
	db "@"

ViridianForestEndBattleText4:
	TX_FAR _ViridianForestEndBattleTextPikaGirl
	db "@"

ViridianForestAfterBattleText4:
	TX_FAR _ViridianForestAfterBattleTextPikaGirl
	db "@"

ViridianForestBattleText5:
	TX_FAR _ViridianForestBattleTextSamurai
	db "@"

ViridianForestEndBattleText5:
	TX_FAR _ViridianForestEndBattleTextSamurai
	db "@"

ViridianForestAfterBattleText5:
	TX_FAR _ViridianForestAfterBattleTextSamurai
	db "@"

ViridianForestBattleText6:
	TX_FAR _ViridianForestBattleText4
	db "@"

ViridianForestEndBattleText6:
	TX_FAR _ViridianForestEndBattleText4
	db "@"

ViridianForestAfterBattleText6:
	TX_FAR _ViridianFrstAfterBattleText4
	db "@"

ViridianForestBattleText7:
	TX_FAR _ViridianForestBattleText5
	db "@"

ViridianForestEndBattleText7:
	TX_FAR _ViridianForestEndBattleText5
	db "@"

ViridianForestAfterBattleText7:
	TX_FAR _ViridianFrstAfterBattleText5
	db "@"

ViridianForestText10:
	TX_FAR _ViridianForestText8
	db "@"

ViridianForestText11:
	TX_ASM
	ld hl, Func_f2528
	jp ViridianForestScript_6120d

ViridianForestText12:
	TX_ASM
	ld hl, Func_f2534
	jp ViridianForestScript_6120d

ViridianForestText13:
	TX_ASM
	ld hl, Func_f2540
	jp ViridianForestScript_6120d

ViridianForestText14:
	TX_ASM
	ld hl, Func_f254c
	jp ViridianForestScript_6120d

ViridianForestText15:
	TX_ASM
	ld hl, Func_f2558
	jp ViridianForestScript_6120d

ViridianForestText16:
	TX_ASM
	ld hl, Func_f2528
ViridianForestScript_6120d
	ld b, BANK(Func_f2528)
	call Bankswitch
	jp TextScriptEnd
