AdvancePlayerSprite_::
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $FF
	ld [wUpdateSpritesEnabled], a
	ld hl, _AdvancePlayerSprite
	ld b, BANK(_AdvancePlayerSprite)
	call Bankswitch
	pop af
	ld [wUpdateSpritesEnabled], a
	ret
