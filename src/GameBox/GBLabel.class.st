Class {
	#name : #GBLabel,
	#superclass : #GBDrawable,
	#instVars : [
		'#text => InitializedSlot default: \'0\''
	],
	#category : #GameBox
}

{ #category : #initialization }
GBLabel >> drawOn: acanvas [
	| textModel c |
	textModel := text asText.
	c := AthensTextComposer scan: textModel for: AthensTextScanner new.
	c renderOn: acanvas
]

{ #category : #initialization }
GBLabel >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #initialization }
GBLabel >> step: increment [
	text := ((1000000000 / increment deltaTime) asFloat round: 2)
		asString
]

{ #category : #'as yet unclassified' }
GBLabel >> text: aString [ 
	text := aString
]
