Class {
	#name : #GameBoxElement,
	#superclass : #Object,
	#instVars : [
		'#name => InitializedSlot default: [ :obj | obj asString ]'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GameBoxElement >> accept: aGBPresenter [ 
	self subclassResponsibility.
]

{ #category : #initialization }
GameBoxElement >> addedTo: aNode [
]

{ #category : #initialization }
GameBoxElement >> children [
	^ {}
]

{ #category : #'as yet unclassified' }
GameBoxElement >> deleteFrom: aGBDrawingReference [ 
	aGBDrawingReference announcer unsubscribe: self
]

{ #category : #'as yet unclassified' }
GameBoxElement >> includesElement: aGBCircle [ 
	^ self == aGBCircle
]

{ #category : #initialization }
GameBoxElement >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #initialization }
GameBoxElement >> name [ 	
	^ name
]

{ #category : #initialization }
GameBoxElement >> name: aString [
	^ name := aString
]

{ #category : #'as yet unclassified' }
GameBoxElement >> withParentOf: aSpTreeTablePresenter do: aBlockClosure [ 
	
]
