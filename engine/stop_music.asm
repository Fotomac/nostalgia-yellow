StopMusic_::
	xor a
	ld [MusicFadeID], a
	ld a, 1
	ld [MusicFade], a
.wait0
	ld a, [MusicFadeCount]
	and a
	jr z, .wait0
.wait1
	ld a, [MusicFadeCount]
	and a
	jr nz, .wait1
	ret
