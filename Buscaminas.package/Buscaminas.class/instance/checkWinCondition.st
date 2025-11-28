as yet unclassified
checkWinCondition
    | todasReveladas |

    todasReveladas := true.

    1 to: cellsPerSide do: [:i |
        1 to: cellsPerSide do: [:j |
            | cel bom |
            cel := cells at: i at: j.
            bom := bombs at: i at: j.

            "✅ Si tiene bomba Y NO explotó → debe tener bandera"
            ((bom tieneBomba and: [ bom noExploto ])
                and: [ cel bandera not ])
                    ifTrue: [ todasReveladas := false ].

            "✅ Si NO tiene bomba → debe estar abierta"
            ((bom tieneBomba not) and: [ cel isOn not ])
                ifTrue: [ todasReveladas := false ].
        ].
    ].

    todasReveladas ifTrue: [
        gameState := false.
        self actualizarPuntos.
        self actualizarVidas.

        [
            UIManager default
                alert: ('¡Ganaste! Puntaje final: ',
                puntos Puntaje printString,
                ' Para volver a jugar click en Reiniciar ;)')
                title: 'Victoria'
        ] forkAt: Processor userBackgroundPriority.
    ].
