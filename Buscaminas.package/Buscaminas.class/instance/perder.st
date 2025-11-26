as yet unclassified
perder
	gameState := false.

	"Mostrar mensaje de derrota"
	UIManager default inform: '💥 ¡Perdiste! Puntaje final: ',puntos Puntaje printString,' 
Hacé clic en cualquier parte del tablero para cerrar.'.

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

	"Esperar un clic para cerrar"
	self activarCierrePorClick.

