as yet unclassified
sumarUna
    "Suma una vida sin pasar el máximo permitido"

    | maximo |
    maximo := 5.  

    (cantidad < maximo)
        ifTrue: [
            cantidad := cantidad + 1.
				UIManager default inform: 'Vida extra!'.
        ]
        ifFalse: [
            cantidad := maximo.
        ].
