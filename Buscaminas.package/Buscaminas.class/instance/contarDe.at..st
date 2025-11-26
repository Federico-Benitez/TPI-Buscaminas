as yet unclassified
contarDe: i at: j
	| conta |
	conta := 0.
	-1 to: 1 do: [:x |
		-1 to: 1 do: [:y |
			| ni nj |
			ni := i + x.
			nj := j + y.
			((ni between: 1 and: cellsPerSide)
				and: [ nj between: 1 and: cellsPerSide ]) ifTrue: [
					((bombs at: ni at: nj) tieneBomba)
						ifTrue: [ conta := conta + 1 ].
			].
		].
	].
	^ conta
