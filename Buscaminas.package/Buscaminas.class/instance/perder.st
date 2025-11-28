as yet unclassified
perder
	gameState := false.

	[
		UIManager default 
			alert: ('¡Perdiste! Puntaje final: ', puntos Puntaje printString,
			' Has click en Reiniciar para intentarlo de nuevo ;)')
			title: 'Derrota'
	] forkAt: Processor userBackgroundPriority.

	"Revelar todas las minas"
	1 to: cellsPerSide do: [:i |
		1 to: cellsPerSide do: [:j |
			| bom cel |
			bom := bombs at: i at: j.
			cel := cells at: i at: j.
			bom tieneBomba ifTrue: [
				cel color: Color red
			].
		].
	].
