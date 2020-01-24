Class {
	#name : #GBStepIncrement,
	#superclass : #Announcement,
	#instVars : [
		'lastTime',
		'updateTime',
		'lastUpdate'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GBStepIncrement >> deltaTime [
	^ (updateTime - lastTime) nanoSeconds 
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

{ #category : #'as yet unclassified' }
GBStepIncrement >> updateTime: aDateAndTime [ 
	updateTime := aDateAndTime
]
