Class {
	#name : 'Tablero',
	#superclass : 'Object',
	#instVars : [
		'celdas',
		'ancho',
		'alto',
		'numeroMinas',
		'celdasAbiertas',
		'estadoJuego'
	],
	#category : 'Buscaminas-tpi',
	#package : 'Buscaminas-tpi'
}

{ #category : 'logica de minas' }
Tablero >> contarMinasVecinas [
    "Itera sobre todas las celdas y asigna el conteo de minas vecinas."

    1 to: alto do: [ :fila |
        1 to: ancho do: [ :columna |
            | celda minas |
            celda := celdas at: fila at: columna.
            
            "Solo contamos si la celda NO tiene mina"
            celda tieneMina ifFalse: [
                minas := self minasVecinasParaFila: fila columna: columna.
                celda minasVecinas: minas.
            ]
        ]
    ].
]

{ #category : 'logica de minas' }
Tablero >> distribuirMinas [
    "Coloca el 'numeroMinas' de forma aleatoria en el tablero."

    | celdasPlanar minasColocadas |
    
    "1. Aplanamos la matriz (la convertimos en una lista simple)"
    celdasPlanar := celdas flatCollect: [ :fila | fila ].
    
    "2. Mezclamos la lista"
    celdasPlanar shuffled. 
    
    minasColocadas := 0.
    
    "3. Asignamos las minas a las primeras 'numeroMinas' celdas de la lista mezclada"
    celdasPlanar do: [ :celda |
        (minasColocadas < numeroMinas) ifTrue: [
            celda tieneMina: true.
            minasColocadas := minasColocadas + 1.
        ]
    ].
]

{ #category : 'inicializacion' }
Tablero >> initializeWithWidth: w height: h mines: m [
    "Crea la matriz de celdas, establece los parámetros iniciales."

    "1. Inicializar slots básicos"
    ancho := w.
    alto := h.
    numeroMinas := m.
    celdasAbiertas := 0.
    estadoJuego := #jugando.
    
    "2. Crear y llenar la matriz usando 'collect:' (Esto satisface al linter)"
    "Esto crea el array 'celdas' (filas) de una vez."
    celdas := (1 to: alto) collect: [ :fila |
        
        "Y esto crea cada array interno (columnas) lleno de Celdas nuevas."
        (1 to: ancho) collect: [ :columna |
            Celda new
        ]
    ].

    "NOTA: Aún no llamamos a los métodos de minas"
    "self distribuirMinas."
    "self contarMinasVecinas."
    
    ^ self
]

{ #category : 'logica de minas' }
Tablero >> minasVecinasParaFila: fila columna: columna [
    "Devuelve la cantidad de minas en las celdas adyacentes."
    | contador |
    contador := 0.
    
    -1 to: 1 do: [ :df | "Delta Fila"
        -1 to: 1 do: [ :dc | "Delta Columna"
            | nuevaFila nuevaColumna |
            
            "No contar la celda actual (donde df=0 y dc=0)"
            (df = 0 and: [ dc = 0 ]) ifFalse: [
                nuevaFila := fila + df.
                nuevaColumna := columna + dc.

                "VERSIÓN CORREGIDA: Usamos 'between:and:' para el linter"
                ( (nuevaFila between: 1 and: alto) and: [ nuevaColumna between: 1 and: ancho ] )
                    ifTrue: [
                        ((celdas at: nuevaFila) at: nuevaColumna) tieneMina ifTrue: [
                            contador := contador + 1.
                        ]
                    ]
            ]
        ]
    ].
    
    ^ contador
]
