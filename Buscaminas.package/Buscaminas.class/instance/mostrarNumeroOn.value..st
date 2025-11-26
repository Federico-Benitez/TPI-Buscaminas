as yet unclassified
mostrarNumeroOn: cel value: ady
	| colorNumero texto |
	colorNumero := (ady = 1 ifTrue: [ Color blue ]
		ifFalse: [ ady = 2 ifTrue: [ Color green ]
			ifFalse: [ ady = 3 ifTrue: [ Color red ]
				ifFalse: [ ady = 4 ifTrue: [ Color blue darker ]
					ifFalse: [ ady = 5 ifTrue: [ Color brown ]
						ifFalse: [ ady = 6 ifTrue: [ Color cyan ]
							ifFalse: [ ady = 7 ifTrue: [ Color black ]
								ifFalse: [ Color darkGray ] ] ] ] ] ] ]).

	texto := StringMorph new.
	texto contents: ady asString.
	texto color: colorNumero.
	texto font: (StrikeFont familyName: 'DejaVu Sans' size: 12).
	cel addMorphCentered: texto.

