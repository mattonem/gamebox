Class {
	#name : #GameBoxNode,
	#superclass : #GameBoxElement,
	#instVars : [
		'#announcer => InitializedSlot default: [ Announcer new ]',
		'#children => InitializedSlot default: [ OrderedCollection new ]'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GameBoxNode >> addElement: aGBFPSCount [ 
	children add: aGBFPSCount.
	aGBFPSCount addedTo: self.
	
	
]

{ #category : #'as yet unclassified' }
GameBoxNode >> addedTo: aNode [
	aNode announcer when: self forwardEvent   do: [:evt | announcer announce: evt ] 
]

{ #category : #initialization }
GameBoxNode >> announcer [
	^ announcer
]

{ #category : #initialization }
GameBoxNode >> children [ 	
	^ children 
]

{ #category : #'as yet unclassified' }
GameBoxNode >> drawableAdded: aGBFPSCount [
	announcer
		announce:
			(GBDrawableAdded new
				model: aGBFPSCount;
				yourself)
]

{ #category : #'as yet unclassified' }
GameBoxNode >> forwardEvent [
	^ GBAnnouncement 
]

{ #category : #initialization }
GameBoxNode >> initCanvas: aCanvas [
	children do: [ :child | child initCanvas: aCanvas ]
]

{ #category : #initialization }
GameBoxNode >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]
