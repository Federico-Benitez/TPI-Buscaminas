initialization
initialize
    super initialize.
	 vidas := Vidas new.
	 puntos:= Puntos new.

	 opcion := UIManager default 
    	chooseFrom: #('Fácil (10x10)' 'Medio (15x15)' 'Difícil (25x25)' 'Personalizado')
    	title: 'Seleccione el nivel de dificultad'.

	 "Diccionario de tamaños"
	 mapping := Dictionary new
    	at: 1 put: 10;   "Fácil"
    	at: 2 put: 15;   "Medio"
    	at: 3 put: 25;   "Difícil"
    	yourself.

	"Diccionario de vidas"
	vidasMapping := Dictionary new
    	at: 1 put: 4;   "Fácil"
    	at: 2 put: 3;   "Medio"
    	at: 3 put: 1;   "Difícil"
    	yourself.
	

	"Definir tamaño"
	cellsPerSide := (mapping at: opcion ifAbsent: [
    	(UIManager default request: 'Ingrese el tamaño del tablero:') asInteger ifNil: [15]
		]).

	"Definir vidas"
	(opcion = 4)
    	ifTrue: [
        	vidas cantidad: (
            	(UIManager default request: 'Ingrese la cantidad de vidas:') asInteger
                ifNil: [3]
        )
    ]
    	ifFalse: [
        	vidas cantidad: (vidasMapping at: opcion).
    ].
	 "self color: Color white.
	 self extent: 400@400."
    gameState := true.
    self crearTablero.
	 self position: (World center - (self extent // 2)).	
	 

