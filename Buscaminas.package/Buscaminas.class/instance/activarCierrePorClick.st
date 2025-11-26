as yet unclassified
activarCierrePorClick
	"Activa la detección de un clic en cualquier celda para cerrar el juego."
	1 to: cellsPerSide do: [:i |
		1 to: cellsPerSide do: [:j |
			| cel |
			cel := cells at: i at: j.
			cel setProperty: #cerrar toValue: true.
		].
	].


