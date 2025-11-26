api
toggleState
	isOn := isOn not.
	self color: (isOn ifTrue: [ Color white ] ifFalse: [ Color gray ]).