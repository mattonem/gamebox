Class {
	#name : #GameBoxElement,
	#superclass : #Object,
	#category : #GameBox
}

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

{ #category : #'as yet unclassified' }
GameBoxElement >> withParentOf: aSpTreeTablePresenter do: aBlockClosure [ 
	
]
