FarCopyData::
; Copy bc bytes from a:hl to de.
	ld [wFarCopyDataSavedROMBank], a
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, [wFarCopyDataSavedROMBank]
	call BankswitchCommon
	call CopyData
	pop af
	call BankswitchCommon
	ret

CopyData::
; Copy bc bytes from hl to de.
	ld a,b
	and a
	jr z, .copybytes
	ld a,c
	and a ; is lower byte 0
	jr z, .loop
	inc b ; if not, increment b as there are <$100 bytes to copy
.loop
	call .copybytes
	dec b
	jr nz,.loop
	ret

.copybytes
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copybytes
	ret

CopyVideoDataAlternate::
	ld a, [rLCDC]
	bit 7,a ; LCD enabled?
	jp nz, CopyVideoData ; if yes, then copy video data
	push hl
	ld h,d
	ld l,e
	pop de
	ld a,b ; save bank
	push af
	swap c
	ld a,$f
	and c
	ld b,a
	ld a,$f0
	and c
	ld c,a
	pop af
	jp FarCopyData

CopyVideoDataDoubleAlternate::
	ld a, [rLCDC]
	bit 7,a ; LCD enabled?
	jp nz, CopyVideoDataDouble ; if yes, then copy video data
	push de
	ld d,h
	ld e,l
	ld a,b
	push af ; save bank to switch to
	ld h,$0
	ld l,c
	add hl,hl ; get raw length of bytes to copy
	add hl,hl
	add hl,hl
	ld b,h
	ld c,l
	pop af
	pop hl
	jp FarCopyDataDouble

FarCopyDataDouble::
; Expand bc bytes of 1bpp image data
; from a:de to 2bpp data at hl.
	ld [wFarCopyDataSavedROMBank],a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[wFarCopyDataSavedROMBank]
	call BankswitchCommon
	ld a,h ; swap hl and de
	ld h,d
	ld d,a
	ld a,l
	ld l,e
	ld e,a
	ld a,b
	and a
	jr z,.eightbitcopyamount
	ld a,c
	and a ; multiple of $100
	jr z, .expandloop ; if so, do not increment b because the first instance of dec c results in underflow
.eightbitcopyamount
	inc b
.expandloop
	ld a,[de]
	inc de
	ld [hli],a
	ld [hli],a
	dec c
	jr nz, .expandloop
	dec b
	jr nz, .expandloop
	pop af
	call BankswitchCommon
	ret
