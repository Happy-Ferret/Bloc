Extension { #name : #BlTextElement }

{ #category : #'*Bloc-Sparta' }
BlTextElement >> drawOnSpartaCanvas: aCanvas [
	super drawOnSpartaCanvas: aCanvas.

	paragraph
		ifNil: [ ^ self ].

	paragraph selection: self selection.
	paragraph containerExtent: self extent.

	paragraph drawOn: aCanvas
]
