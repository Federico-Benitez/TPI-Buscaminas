as yet unclassified
checkWinCondition
	| todasReveladas |
	todasReveladas := true.
	1 to: cellsPerSide do: [:i |
		1 to: cellsPerSide do: [:j |
			| cel bom |
			cel := cells at: i at: j.
			bom := bombs at: i at: j.
			((bom tieneBomba) and: [ cel bandera not ]) ifTrue: [ todasReveladas := false ].
			((bom tieneBomba not) and: [ cel isOn not ]) ifTrue: [ todasReveladas := false ].
		].
	].
	todasReveladas ifTrue: [
		gameState := false.
		UIManager default inform: '🎉 ¡Ganaste! Puntaje final: ', puntos Puntaje printString.
		UIManager default inform: 'Hacé clic en cualquier parte del tablero para cerrar.'.
		self activarCierrePorClick.
	].
		
