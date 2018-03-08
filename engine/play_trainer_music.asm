PlayTrainerMusic_::
	ld a, [wEngagedTrainerClass]
	cp OPP_SONY1
	ret z
	cp OPP_SONY2
	ret z
	cp OPP_SONY3
	ret z
	ld a, [wGymLeaderNo]
	and a
	ret nz
	xor a
	ld [wAudioFadeOutControl], a
	ld a, $ff
	call PlaySound
	ld a, 0 ; BANK(Music_MeetEvilTrainer)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, [wEngagedTrainerClass]
	ld b, a
	ld hl, EvilTrainerList
.evilTrainerListLoop
	ld a, [hli]
	cp $ff
	jr z, .noEvilTrainer
	cp b
	jr nz, .evilTrainerListLoop
	ld a, MUSIC_MEET_EVIL_TRAINER
	jr .PlaySound
.noEvilTrainer
	ld hl, CuteTrainerList
.cuteTrainerListLoop
	ld a, [hli]
	cp $ff
	jr z, .noCuteTrainer
	cp b
	jr nz, .cuteTrainerListLoop
	ld a, MUSIC_MEET_CUTE_TRAINER
	jr .PlaySound
.noCuteTrainer
	ld hl, FemaleTrainerList
.femaleTrainerListLoop
	ld a, [hli]
	cp $ff
	jr z, .maleTrainer
	cp b
	jr nz, .femaleTrainerListLoop
	ld a, MUSIC_MEET_FEMALE_TRAINER
	jr .PlaySound
.maleTrainer
	ld a, MUSIC_MEET_MALE_TRAINER
.PlaySound
	ld [wNewSoundID], a
	jp PlayMusic

INCLUDE "data/trainer_types.asm"
