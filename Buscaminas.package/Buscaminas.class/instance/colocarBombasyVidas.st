as yet unclassified
colocarBombasyVidas
    | totalBombas colocadas totalVidas colocadasVidas |

    "Cantidad de bombas"
    totalBombas := cellsPerSide * cellsPerSide // 6.
    colocadas := 0.
    bombasTotales := totalBombas.

    "1️⃣ COLOCAR BOMBAS"
    [ colocadas < totalBombas ] whileTrue: [
        | i j b |
        i := (1 to: cellsPerSide) atRandom.
        j := (1 to: cellsPerSide) atRandom.
        b := bombs at: i at: j.

        b tieneBomba ifFalse: [
            b tieneBomba: true.
            colocadas := colocadas + 1.
        ].
    ].

    "2️⃣ COLOCAR VIDAS SOLO EN CELDAS SIN BOMBA"
    totalVidas := totalBombas // 4.  "ajustá esta proporción si querés"
    colocadasVidas := 0.

    [ colocadasVidas < totalVidas ] whileTrue: [
        | i j b cel |
        i := (1 to: cellsPerSide) atRandom.
        j := (1 to: cellsPerSide) atRandom.
        b := bombs at: i at: j.
        cel := cells at: i at: j.

        ((b tieneBomba not) and: [ cel tieneVida not ]) ifTrue: [
            cel tieneVida: true.
            colocadasVidas := colocadasVidas + 1.
        ].
    ].
