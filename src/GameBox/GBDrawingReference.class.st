Class {
	#name : #GBDrawingReference,
	#superclass : #GameBoxNode,
	#instVars : [
		'#position => InitializedSlot default: (0@0)',
		'#angle => InitializedSlot default: 0'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GBDrawingReference >> accept: aGBPresenter [ 
	^ aGBPresenter visitGBDrawingReference: self
]

{ #category : #initialization }
GBDrawingReference >> addedTo: aNode [
	super addedTo: aNode.
	aNode announcer
		when: GBCameraDrawing
		do: [ :evt | self drawChildren: evt canvas ]
]

{ #category : #'as yet unclassified' }
GBDrawingReference >> angle [
	^ angle
]

{ #category : #'as yet unclassified' }
GBDrawingReference >> angle: deg [ 
	Transcript show: angle.
	angle := deg 
]

{ #category : #'as yet unclassified' }
GBDrawingReference >> drawChildren: anAthensCairoCanvas [
	anAthensCairoCanvas pathTransform rotateByRadians: angle.
	anAthensCairoCanvas pathTransform translateBy: position.
	announcer announce: (GBCameraDrawing new canvas: anAthensCairoCanvas).
	anAthensCairoCanvas pathTransform translateBy: -1 * position.
	anAthensCairoCanvas pathTransform rotateByRadians: -1 * angle
]

{ #category : #initialization }
GBDrawingReference >> forwardEvent [
	^ super forwardEvent - GBCameraDrawing 
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
