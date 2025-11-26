accessing
toggleFlagAt: i at: j
	| cel |
	cel := cells at: i at: j.
	cel bandera
		ifTrue: [
			cel bandera: false.
			cel color: Color gray.
		]
		ifFalse: [
			cel bandera: true.
			cel color: Color green.
			(bombs at: i at: j) tieneBomba 
				ifTrue: [ 
					cel color: Color lightGreen darker.
					puntos sumar: 100.
				 ]
		].
	self checkWinCondition.
