as yet unclassified
click: evt to: selfRef
	| i j button |
	i := evt first.
	j := evt second.
	button := evt third.

	button = 1 ifTrue: [ self checkNeighbour: i at: j ].
	button = 2 ifTrue: [ self toggleFlagAt: i at: j ].
