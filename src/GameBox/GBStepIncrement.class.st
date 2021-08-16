Class {
	#name : #GBStepIncrement,
	#superclass : #GBAnnouncement,
	#instVars : [
		'lastTime',
		'updateTime',
		'lastUpdate',
		'activeKeys',
		'model'
	],
	#category : #GameBox
}

{ #category : #accessing }
GBStepIncrement >> activeKeys [
	^ activeKeys
]

{ #category : #accessing }
GBStepIncrement >> activeKeys: anObject [
	activeKeys := anObject
]

{ #category : #'as yet unclassified' }
GBStepIncrement >> deltaTime [
	^ (updateTime - lastUpdate) 
]

{ #category : #initialization }
GBStepIncrement >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #'as yet unclassified' }
GBStepIncrement >> lastUpdate: aDateAndTime [ 
	lastUpdate := aDateAndTime 
]

{ #category : #accessing }
GBStepIncrement >> model [
	^ model
]

{ #category : #accessing }
GBStepIncrement >> model: anObject [
	model := anObject
]

{ #category : #'as yet unclassified' }
GBStepIncrement >> updateTime: aDateAndTime [ 
	updateTime := aDateAndTime
]
