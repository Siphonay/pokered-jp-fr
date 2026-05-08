InGameTrade_CheckForTradeEvo:
	ld a, [wInGameTradeReceiveMonName]
	cp 'G' ; GRAVALANCH
	jr z, .nameMatched
	cp 'S' ; SPECTRUM
	ret nz

.nameMatched
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, TRUE
	ld [wForceEvolution], a
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	callfar TryEvolvingMon
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	jp PlayDefaultMusic
