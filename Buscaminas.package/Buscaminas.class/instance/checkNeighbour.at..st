as yet unclassified
checkNeighbour: i at: j
    | cel ady |
    gameState ifFalse: [ ^ self ].
    cel := cells at: i at: j.
    (bombs at: i at: j) noExploto ifFalse: [ ^ self ].
    cel isOn ifTrue: [ ^ self ].

    (((bombs at: i at: j) tieneBomba) and: [(bombs at: i at: j) noExploto ]) ifTrue: [
        vidas restarUna.
        puntos restar: 50.

        (bombs at: i at: j) noExploto: false.
        "Si la cel tenía bandera, actualizar contador"
        cel bandera ifTrue: [ contadorBanderas := (contadorBanderas - 1) max: 0 ].
        vidas quedan
            ifFalse: [
                self perder.
                ^ self
            ]
            ifTrue: [
                UIManager default inform: 'Perdiste una vida. Te quedan: ', vidas cantidad asString.
                cel color: Color red.
                cel turnOn.
					self actualizarVidas.
            ].

        "LLAMAR a checkWinCondition aun cuando quedan vidas"
        self checkWinCondition.
        ^ self
    ].

    ady := self contarDe: i at: j.

    (ady > 0)
        ifTrue: [
            cel turnOn.
				cel color: Color white.
				cel tieneVida ifTrue: [
   					vidas sumarUna.
					
					(vidas = 5) ifTrue: [ 
							puntos sumar: 50.
							].
               cel color: (Color r: 1.0 g: 0.75 b: 0.8).
    				cel tieneVida: false.
				
					].
            cel bandera ifTrue: [ contadorBanderas := (contadorBanderas - 1) max: 0 ].
            
            self mostrarNumeroOn: cel value: ady.
            self checkWinCondition.
        ]
        ifFalse: [
            [ self abrirRegionDesde: i at: j ] forkAt: Processor userBackgroundPriority.
        ].
    self actualizarPuntos.
    self actualizarVidas.
	 self actualizarBanderas.
    ^ self
