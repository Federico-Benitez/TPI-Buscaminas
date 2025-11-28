accessing
toggleFlagAt: i at: j
    | cel |
    cel := cells at: i at: j.

    "No permitir poner/quitar si la cel ya está abierta"
    cel isOn ifTrue: [ ^ self ].

    cel bandera
        ifTrue: [
            "Quitar bandera"
            contadorBanderas := (contadorBanderas - 1) max: 0.  "evitar negativo"
            cel bandera: false.
            cel color: Color gray.
        ]
        ifFalse: [
            "Poner bandera: sólo si no superamos el total de bombas"
            (contadorBanderas < bombasTotales)
                ifTrue: [
                    contadorBanderas := contadorBanderas + 1.
                    cel bandera: true.
                    cel color: Color lightGreen darker.

                    ((bombs at: i at: j) tieneBomba
                        and: [ (bombs at: i at: j) noExploto ])
                        ifTrue: [
                            cel color: Color green.
                            ((bombs at: i at: j) vecesMarcada = 0) ifTrue: [
                                puntos sumar: 100.
                                (bombs at: i at: j) vecesMarcada: (bombs at: i at: j) vecesMarcada + 1.
                                
                            ].
                        ].
                ]
                ifFalse: [
                    UIManager default inform: 'No podés colocar más banderas (límite alcanzado).'
                ].
        ].
	 self actualizarVidas.
	 self actualizarPuntos.
	 self actualizarBanderas.
    self checkWinCondition.
