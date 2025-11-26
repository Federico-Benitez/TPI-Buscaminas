as yet unclassified
abrirRegionDesde: i0 at: j0
	| cola pos fila col cel ady celAbiertas|
	cola := OrderedCollection new.
	cola add: (i0 @ j0).
	celAbiertas:= 0.

	[ cola isEmpty ] whileFalse: [
		(cola size \\ 100 = 0) ifTrue: [ Processor yield ].
		pos := cola removeFirst.
		fila := pos x.
		col := pos y.

		((fila between: 1 and: cellsPerSide)
			and: [ col between: 1 and: cellsPerSide ]) ifTrue: [

			cel := cells at: fila at: col.

			((cel isOn not)
				and: [ (bombs at: fila at: col) tieneBomba not ]) ifTrue: [

				ady := self contarDe: fila at: col.

				cel turnOn.
				
				celAbiertas:= celAbiertas + 1.
				
				cel color: (ady = 0 ifTrue: [ Color veryLightGray ] ifFalse: [ Color white ]).

				ady > 0
					ifTrue: [ self mostrarNumeroOn: cel value: ady ]
					ifFalse: [
						"Agregar todos los vecinos si la celda no tiene minas alrededor"
						-1 to: 1 do: [:dx |
							-1 to: 1 do: [:dy |
								((dx = 0) and: [ dy = 0 ]) ifFalse: [
									| ni nj vecino |
									ni := fila + dx.
									nj := col + dy.
									((ni between: 1 and: cellsPerSide)
										and: [ nj between: 1 and: cellsPerSide ]) ifTrue: [
										vecino := cells at: ni at: nj.
										(vecino isOn not and: [ (bombs at: ni at: nj) tieneBomba not ])
											ifTrue: [ cola add: (ni @ nj) ].
									].
								].
							].
						].
					].
			].
		].
	].
	puntos sumar: (celAbiertas * 3).
	self checkWinCondition.
