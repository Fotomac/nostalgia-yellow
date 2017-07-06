_DaisyInitialText::
	text "Hi <PLAYER>!"
	line "My brother"
	cont "<RIVAL> is out at"
	cont "Grandpa's lab."
	done

_DaisyOfferMapText::
	text "Grandpa asked you"
	line "to run an errand?"
	cont "Gee, that's lazy"
	cont "of him!"

	para "Here, this will"
	line "help you!"
	prompt

_GotMapText::
	text "<PLAYER> got a"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_DaisyBagFullText::
	text "You have too much"
	line "stuff with you."
	done

_DaisyUseMapText::
	text "You can use the"
	line "TOWN MAP to find"
	cont "out where you are"
	cont "or check the"
	cont "names of places."
	done

_BluesHouseText2::
	text "Spending time"
	line "with your #MON"
	cont "makes them more"
	cont "friendly to you."
	done

_BluesHouseText3::
	text "A map of the KANTO"
	line "region! I hope"
	cont "she gives it to"
	cont "me..."
	done
