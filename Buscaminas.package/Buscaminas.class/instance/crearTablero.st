as yet unclassified
crearTablero

    | cellSize gridWidth gridHeight offsetX offsetY botonCerrar botonReiniciar|

    "Tamaño real de cada celda"
    cellSize := 25.

    "Tamaño REAL de la grilla"
    gridWidth := cellsPerSide * cellSize.
    gridHeight := cellsPerSide * cellSize.

	 "Crear fondo blanco del tamaño del tablero"
	
	 self color: Color white.
	 self extent: (gridWidth + 50)@ (gridHeight + 100) .

    "Cálculo correcto del centrado"
    offsetX := (self width - gridWidth) / 2.
    offsetY := (self height - gridHeight) - 60.

	"=== Botón Cerrar ==="
	botonCerrar := SimpleButtonMorph new.
	botonCerrar label: 'Cerrar';
   color: Color lightGray;
   extent: 100 @ 40;
   position: (self width / 2 - 120) @ (offsetY + gridHeight + 10);
   target: self;
   actionSelector: #activarCierrePorClick.
	self addMorph: botonCerrar.

	"=== Botón Reiniciar ==="
	botonReiniciar := SimpleButtonMorph new.
	botonReiniciar label: 'Reiniciar';
   color: Color lightGray;
   extent: 100 @ 40;
   position: (self width / 2 + 20) @ (offsetY + gridHeight + 10);
   target: self;
   actionSelector: #initialize.
	self addMorph: botonReiniciar.

    "Crear arrays"
    cells := Array2D new: cellsPerSide tabulate: [:i :j | Celda new ].
    bombs := Array2D new: cellsPerSide tabulate: [:i :j | Bomba new ].

    "Posicionar celdas centradas"
    1 to: cellsPerSide do: [:i |
        1 to: cellsPerSide do: [:j |
            | c |
            c := cells at: i at: j.
            self addMorph: c.

            c position:
                offsetX + ((i - 1) * cellSize)
                @ (offsetY + ((j - 1) * cellSize)).

            c setProperty: #posicion toValue: (i @ j).
        ].
    ].

    self colocarBombas.
