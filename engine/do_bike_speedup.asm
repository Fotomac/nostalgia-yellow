DoBikeSpeedup_::
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wCurMap]
	cp ROUTE_17 ; Cycling Road
	jr nz, .goFaster
	ld a, [hJoyHeld]
	and D_UP | D_LEFT | D_RIGHT
	ret nz
.goFaster
	call AdvancePlayerSprite
	ret
