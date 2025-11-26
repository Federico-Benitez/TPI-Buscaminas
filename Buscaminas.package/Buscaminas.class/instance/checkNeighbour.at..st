as yet unclassified
checkNeighbour: i at: j
	| cel ady |
	gameState ifFalse: [ ^ self ].
	cel := cells at: i at: j.
	cel isOn ifTrue: [ ^ self ].

	((bombs at: i at: j) tieneBomba) ifTrue: [
    vidas restarUna.
	puntos restar: 50.
    vidas quedan
        ifFalse: [
            self perder.
            ^ self
        ]
        ifTrue: [
            UIManager default inform: 'Perdiste una vida. Te quedan: ', vidas cantidad asString.
				cel bandera: true.
				cel color: Color red.

        ].

    ^ self
].


	ady := self contarDe: i at: j.

	(ady > 0)
		ifTrue: [
			cel turnOn.
			cel color: Color white.
			self mostrarNumeroOn: cel value: ady.
			self checkWinCondition.
		]
		ifFalse: [
			[ self abrirRegionDesde: i at: j ] forkAt: Processor userBackgroundPriority.
		].
