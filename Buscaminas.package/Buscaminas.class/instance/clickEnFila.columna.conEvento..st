as yet unclassified
clickEnFila: i columna: j conEvento: event
	| boton |
	boton := event yellowButtonPressed
		ifTrue: [ 2 ]
		ifFalse: [ 1 ].
	boton = 1
		ifTrue: [ self checkNeighbour: i at: j ].
	boton = 2
		ifTrue: [ self toggleFlagAt: i at: j ].
