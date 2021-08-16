Class {
	#name : #GBImageMorph,
	#superclass : #ImageMorph,
	#instVars : [
		'#activeKeys => InitializedSlot default: [ Set new ]'
	],
	#category : #GameBox
}

{ #category : #'event handling' }
GBImageMorph >> activeKeys [
^ activeKeys
]

{ #category : #'event handling' }
GBImageMorph >> handlesKeyDown: evt [
	^ true
]

{ #category : #'event handling' }
GBImageMorph >> handlesKeyUp: evt [
	^ true
]

{ #category : #initialization }
GBImageMorph >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #'event handling' }
GBImageMorph >> keyDown: evt [
	activeKeys add: evt keyCharacter 
]

{ #category : #'event handling' }
GBImageMorph >> keyUp: evt [
	activeKeys remove: evt keyCharacter ifAbsent: [  ]
]

{ #category : #'event handling' }
GBImageMorph >> takesKeyboardFocus [
^ true
]
