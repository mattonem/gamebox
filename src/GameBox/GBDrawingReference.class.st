Class {
	#name : #GBDrawingReference,
	#superclass : #GameBoxNode,
	#instVars : [
		'#position => InitializedSlot default: (0@0)'
	],
	#category : #GameBox
}

{ #category : #initialization }
GBDrawingReference >> addedTo: aNode [
	aNode announcer
		when: GBCameraDrawing
		do: [ :evt | self drawChildren: evt canvas ]
]

{ #category : #'as yet unclassified' }
GBDrawingReference >> drawChildren: anAthensCairoCanvas [
	anAthensCairoCanvas pathTransform translateBy: (position).
	announcer announce: (GBCameraDrawing new canvas: anAthensCairoCanvas).
	anAthensCairoCanvas pathTransform translateBy: -1 * (position)
]

{ #category : #initialization }
GBDrawingReference >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #'as yet unclassified' }
GBDrawingReference >> position: aPoint [ 
	position := aPoint
]
