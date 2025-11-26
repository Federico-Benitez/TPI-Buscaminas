as yet unclassified
colocarBombas
	| totalBombas colocadas |
	totalBombas := cellsPerSide * cellsPerSide // 6.
	colocadas := 0.
	[ colocadas < totalBombas ] whileTrue: [
		| i j b |
		i := (1 to: cellsPerSide) atRandom.
		j := (1 to: cellsPerSide) atRandom.
		b := bombs at: i at: j.
		b tieneBomba ifFalse: [
			b tieneBomba: true.
			colocadas := colocadas + 1.
		].
	].
