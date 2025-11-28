initialization
initialize
    super initialize.
	 vidas := Vidas new.
	 puntos:= Puntos new.
	 contadorBanderas := 0.
	 bombasTotales:=0.

opcion := UIManager default 
	chooseFrom: #('Fácil (10x10)' 'Normal (15x15)' 'Difícil (25x25)' 'Personalizado')
	title: 'Seleccione el nivel de dificultad'.

"Si cancela, usar Normal por defecto"
(opcion isNil or: [ opcion = 0 ]) ifTrue: [ opcion := 2 ].

"Diccionario de tamaños"
mapping := Dictionary new
	at: 1 put: 10;
	at: 2 put: 15;
	at: 3 put: 25;
	yourself.

"Diccionario de vidas"
vidasMapping := Dictionary new
	at: 1 put: 4;
	at: 2 put: 3;
	at: 3 put: 1;
	yourself.


"-----------------------"
"Definir tamaño tablero"
"-----------------------"
cellsPerSide := (opcion = 4)
	ifTrue: [
		| input valor |
		input := UIManager default request: 'Ingrese el tamaño del tablero:'.
		valor := input ifNil: [ 0 ] ifNotNil: [ input asInteger ].
		valor > 0
			ifTrue: [ valor ]
			ifFalse: [ 15 ].  "Valor seguro por defecto"
	]
	ifFalse: [
		mapping at: opcion
	].


"-----------------------"
"Definir vidas"
"-----------------------"
(opcion = 4)
	ifTrue: [
		| input valor |
		input := UIManager default request: 'Ingrese la cantidad de vidas:'.
		valor := input ifNil: [ 0 ] ifNotNil: [ input asInteger ].
		valor > 0
			ifTrue: [ vidas cantidad: valor ]
			ifFalse: [ vidas cantidad: 3 ].  "Valor seguro por defecto"
	]
	ifFalse: [
		vidas cantidad: (vidasMapping at: opcion)
	].

	 "self color: Color white.
	 self extent: 400@400."
    gameState := true.
    self crearTablero.
	 self position: (World center - (self extent // 2)).	
	 self actualizarBanderas
	 

