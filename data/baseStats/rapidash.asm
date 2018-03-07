db DEX_RAPIDASH ; pokedex id
db 65 ; base hp
db 100 ; base attack
db 70 ; base defense
db 105 ; base speed
db 80 ; base special
db FIRE ; species type 1
db FIRE ; species type 2
db 60 ; catch rate
db 192 ; base exp yield
INCBIN "pic/ymon/rapidash.pic",0,1 ; 77, sprite dimensions
dw RapidashPicFront
dw RapidashPicBack
; attacks known at lvl 0
db TACKLE
db GROWL
db TAIL_WHIP
db EMBER
db 0 ; growth rate
; learnset
	tmlearn 6,7,8
	tmlearn 10,15
	tmlearn 20
	tmlearn 31,32
	tmlearn 33,34,38,40
	tmlearn 44
	tmlearn 50
db BANK(RapidashPicFront)
