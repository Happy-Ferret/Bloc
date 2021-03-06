Class {
	#name : #BrTextAttribute,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'isOverwritableByStyler'
	],
	#category : 'Bloc-Text-Text-Attributes'
}

{ #category : #comparing }
BrTextAttribute >> = anObject [
	"Return true if I am equal to a given object"
	<return: #Boolean>
	
	self == anObject
		ifTrue: [ ^ true ].
	(anObject class = self class)
		ifFalse: [ ^ false ].
	
	^ self equals: anObject
]

{ #category : #style }
BrTextAttribute >> beNotOverwritableByStyler [
	isOverwritableByStyler := false
]

{ #category : #style }
BrTextAttribute >> beOverwritableByStyler [
	isOverwritableByStyler := true
]

{ #category : #comparing }
BrTextAttribute >> equals: aTextAttribute [
	"Return true if I am equal to a given text attribute assuming that
	it has the same type as me"
	<return: #Boolean>

	self subclassResponsibility
]

{ #category : #comparing }
BrTextAttribute >> hash [
	"Compute and return a hash code.
	Two objects for which equals: returns true must have the same hash"
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : #initialization }
BrTextAttribute >> initialize [
	super initialize.
	
	isOverwritableByStyler := true
]

{ #category : #testing }
BrTextAttribute >> isAdornment [
	"Return true if attribute influences text structure, for examples if it replaces one or more characters
	with any amount of other arbitrary items, false otherwise"
	<return: #Boolean>

	^ false
]

{ #category : #testing }
BrTextAttribute >> isEventHandler [
	"Return true if attribute is designed to handle UI events such as mouse,
	false otherwise"
	<return: #Boolean>

	^ false
]

{ #category : #testing }
BrTextAttribute >> isOverwritableByStyler [
	"Return true if attribute is overwritable by stylers, false otherwise.
	By default all attributes are treated as style ones"
	<return: #Boolean>

	^ isOverwritableByStyler
]

{ #category : #testing }
BrTextAttribute >> isParagraphAttribute [
	"Return true if I am a special paragraph attribute, false otherwise"
	<return: #Boolean>

	^ false
]

{ #category : #testing }
BrTextAttribute >> isStyle [
	"Return true if attribute represents a text or font style attribute that only changes how text looks,
	for example foreground, background, weight, emphasis etc.
	By default all attributes are treated as style ones. Action attributes should return false"
	<return: #Boolean>

	^ true
]
