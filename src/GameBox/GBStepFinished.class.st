Class {
	#name : #GBStepFinished,
	#superclass : #GBAnnouncement,
	#instVars : [
		'model'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GBStepFinished class >> model [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
GBStepFinished >> model [
	^ model
]

{ #category : #'as yet unclassified' }
GBStepFinished >> model: aGameBox [ 
	model := aGameBox 
]
