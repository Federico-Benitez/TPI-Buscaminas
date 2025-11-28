event handling
mouseDown: evt
	| pos i j boton buscaminas |
	pos := self valueOfProperty: #posicion ifAbsent: [ ^ self ].
	i := pos x.
	j := pos y.
	buscaminas := self owner.

	"Detectar botón (izq / der)"
	boton := (evt yellowButtonPressed ifTrue: [ 2 ] ifFalse: [ 1 ]).

	"Si el juego sigue activo, procesar normalmente"
	boton = 1 ifTrue: [ buscaminas checkNeighbour: i at: j ].
	boton = 2 ifTrue: [ buscaminas toggleFlagAt: i at: j ].
