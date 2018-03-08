HandleBlackOut_::
; For when all the player's pokemon faint.
; Does not print the "blacked out" message.

	call GBFadeOutToBlack
	ld a, $08
	call StopMusic
	ld hl, wd72e
	res 5, [hl]
	switchbank SpecialWarpIn ; also Bank(SpecialEnterMap)
	callab ResetStatusAndHalveMoneyOnBlackout
	call SpecialWarpIn
	call PlayDefaultMusicFadeOutCurrent
	jp SpecialEnterMap
