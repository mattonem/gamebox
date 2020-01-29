Class {
	#name : #GBCircle,
	#superclass : #GBDrawable,
	#instVars : [
		'shape',
		'radius',
		'position'
	],
	#category : #GameBox
}

{ #category : #initialization }
GBCircle >> drawOn: acanvas [
	| ellipsePath |
	"acanvas paintTransform loadIdentity."
	ellipsePath := acanvas
		createPath: [ :builder | 
			builder
				moveTo: position;
				moveTo: 0 @ radius;
				cwArcTo: 0 @ (-2 * radius) angle: Float pi;
				cwArcTo: 0 @ (2 * radius) angle: Float pi ].
	acanvas setPaint: Color black.
	acanvas drawShape: ellipsePath
]

{ #category : #initialization }
GBCircle >> initCanvas: aCanvas [
	shape := TREllipseShape new from: 0 @ 0 to: 2* (radius @ radius).
	aCanvas addShape: shape
]

{ #category : #'as yet unclassified' }
GBCircle >> position [
	^ position
]

{ #category : #'as yet unclassified' }
GBCircle >> position: aPoint [ 
	position := aPoint
]

{ #category : #'as yet unclassified' }
GBCircle >> radius: anInteger [ 
	radius := anInteger
]
