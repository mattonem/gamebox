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

{ #category : #'as yet unclassified' }
GBLabel >> text [
	^ text
]

{ #category : #'as yet unclassified' }
GBLabel >> text: aString [ 
	text := aString
]
