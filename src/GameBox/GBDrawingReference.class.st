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
	announcer
		when: GBCameraDrawing
		do: [ :evt | self drawChildren: evt canvas evt: evt]
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
GBDrawingReference >> drawChildren: anAthensCairoCanvas evt: evt [
	anAthensCairoCanvas pathTransform rotateByRadians: angle.
	anAthensCairoCanvas pathTransform translateBy: position.
	children do: [ :child | child announcer announce: evt ].
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
GBDrawingReference >> position [
	^ position
]

{ #category : #'as yet unclassified' }
GBDrawingReference >> position: aPoint [ 
	position := aPoint
]
