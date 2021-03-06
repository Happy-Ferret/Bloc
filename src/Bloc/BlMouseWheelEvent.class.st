Class {
	#name : #BlMouseWheelEvent,
	#superclass : #BlMouseEvent,
	#instVars : [
		'direction',
		'vector'
	],
	#category : 'Bloc-Event'
}

{ #category : #'instance creation' }
BlMouseWheelEvent class >> down [
	^ self new
		position: 0@0;
		screenPosition: 0@0;
		direction: Character arrowDown
]

{ #category : #'instance creation' }
BlMouseWheelEvent class >> left [
	^ self new
		position: 0@0;
		screenPosition: 0@0;
		direction: Character arrowLeft
]

{ #category : #'instance creation' }
BlMouseWheelEvent class >> right [
	^ self new
		position: 0@0;
		screenPosition: 0@0;
		direction: Character arrowRight
]

{ #category : #'instance creation' }
BlMouseWheelEvent class >> up [
	^ self new
		position: 0@0;
		screenPosition: 0@0;
		direction: Character arrowUp
]

{ #category : #accessing }
BlMouseWheelEvent >> direction [
	^ direction
]

{ #category : #accessing }
BlMouseWheelEvent >> direction: anObject [
	direction := anObject
]

{ #category : #testing }
BlMouseWheelEvent >> isHorizontal [
	"Return true if this event has a horizontal scrolling component"
	<return: #Boolean>
	
	^ self isScrollLeft or: [ self isScrollRight ]
]

{ #category : #testing }
BlMouseWheelEvent >> isScrollDown [
	^ direction = Character arrowDown
]

{ #category : #testing }
BlMouseWheelEvent >> isScrollLeft [
	"We scroll to the left when direction vector has negative x component,
	because the content should move in the same direction as a hand on a touchpad.
	When hand is moved from right to left (left scroll) the content should moved by a negative delta"
	<return: #Boolean>

	^ vector x < 0
]

{ #category : #testing }
BlMouseWheelEvent >> isScrollRight [
	"We scroll to the right when direction vector has positive x component,
	because the content should move in the same direction as a hand on a touchpad.
	When hand is moved from left to right (right scroll) the content should moved by a positive delta"
	<return: #Boolean>

	^ vector x > 0
]

{ #category : #testing }
BlMouseWheelEvent >> isScrollUp [
	^ direction = Character arrowUp
]

{ #category : #sending }
BlMouseWheelEvent >> sendTo: anObject [
	anObject scrollEvent: self
]

{ #category : #printing }
BlMouseWheelEvent >> storeOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' new'.
	aStream cr; tab.
	aStream nextPutAll: 'modifiers: '.
	aStream store: self modifiers.
	aStream nextPut: $;.
	aStream cr; tab.
	aStream nextPutAll: 'position: '.
	aStream nextPutAll: self position asString.
	aStream nextPut: $;.
	aStream cr; tab.
	aStream nextPutAll: 'screenPosition: '.
	aStream nextPutAll: self screenPosition asString.
	aStream nextPut: $;.
	aStream cr; tab.
	aStream nextPutAll: 'direction: '.
	aStream store: self direction.
	aStream nextPut: $;.
	aStream cr; tab.
	aStream nextPutAll: 'timestamp: ('.
	aStream nextPutAll: DateAndTime name.
	aStream nextPutAll: ' fromString: '''.
	aStream nextPutAll: self timestamp printString.
	aStream nextPutAll: ''')'.
	aStream nextPutAll: ')'
]

{ #category : #accessing }
BlMouseWheelEvent >> vector [
	<return: #BlVector>

	^ vector
]

{ #category : #accessing }
BlMouseWheelEvent >> vector: anObject [
	vector := anObject
]
