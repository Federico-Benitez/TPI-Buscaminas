Class {
	#name : 'Celda',
	#superclass : 'Object',
	#instVars : [
		'tieneMina',
		'estaAbierta',
		'estaMarcada',
		'minasVecinas'
	],
	#category : 'Buscaminas-tpi',
	#package : 'Buscaminas-tpi'
}

{ #category : 'accessing' }
Celda >> estaAbierta [
    ^ estaAbierta ifNil: [ estaAbierta := false ]
]

{ #category : 'accessing' }
Celda >> estaAbierta: unBooleano [
    estaAbierta := unBooleano
]

{ #category : 'accessing' }
Celda >> estaMarcada [
    ^ estaMarcada ifNil: [ estaMarcada := false ]
]

{ #category : 'accessing' }
Celda >> estaMarcada: unBooleano [
    estaMarcada := unBooleano
]

{ #category : 'accessing' }
Celda >> minasVecinas [
    ^ minasVecinas ifNil: [ minasVecinas := 0 ]
]

{ #category : 'accessing' }
Celda >> minasVecinas: unNumero [
    minasVecinas := unNumero
]

{ #category : 'accessing' }
Celda >> tieneMina [
    "Responde true si la celda tiene una mina."
    ^ tieneMina ifNil: [ tieneMina := false ]
]

{ #category : 'accessing' }
Celda >> tieneMina: unBooleano [
    "Establece si la celda tiene una mina."
    tieneMina := unBooleano
]
