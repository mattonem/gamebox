Class {
	#name : #GameBoxNode,
	#superclass : #GameBoxElement,
	#instVars : [
		'#children => InitializedSlot default: [ OrderedCollection new ]'
	],
	#category : #GameBox
}

{ #category : #'ston-core' }
GameBoxNode class >> stonAllInstVarNames [ 
	^super stonAllInstVarNames asOrderedCollection remove: #announcer; yourself
	
]

{ #category : #'as yet unclassified' }
GameBoxNode >> addElement: aGBFPSCount [ 
	children add: aGBFPSCount.
	aGBFPSCount addedTo: self.
	
	
]

{ #category : #'as yet unclassified' }
GameBoxNode >> addedTo: aNode [

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

{ #category : #'as yet unclassified' }
GameBoxNode >> includesElement: aGBCircle [
	^ self == aGBCircle
		ifTrue: [ true ]
		ifFalse: [ ^ children anySatisfy: [ :c | c includesElement: aGBCircle ] ]
]

{ #category : #initialization }
GameBoxNode >> initCanvas: aCanvas [
	children do: [ :child | child initCanvas: aCanvas ]
]

{ #category : #initialization }
GameBoxNode >> initialize [
	self class initializeSlots: self.
	super initialize.
	announcer
		when: self forwardEvent
		do: [ :evt | children do: [ :c | c announcer announce: evt ] ]
]

{ #category : #'as yet unclassified' }
GameBoxNode >> removeElement: aGBCircle [ 
	children remove: aGBCircle.
	aGBCircle deleteFrom: self
]

{ #category : #'as yet unclassified' }
GameBoxNode >> withParentOf: aSpTreeTablePresenter do: aBlockClosure [
	^ (children includes: aSpTreeTablePresenter)
		ifTrue: [ aBlockClosure value: self ]
		ifFalse: [ children
				do: [ :c | c withParentOf: aSpTreeTablePresenter do: aBlockClosure ] ]
]
