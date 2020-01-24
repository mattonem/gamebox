Class {
	#name : #GBCircle,
	#superclass : #GBDrawable,
	#instVars : [
		'shape',
		'radius'
	],
	#category : #GameBox
}

{ #category : #initialization }
GBCircle >> initCanvas: aCanvas [
	shape := TREllipseShape new from: 0 @ 0 to: 2* (radius @ radius).
	aCanvas addShape: shape
]

{ #category : #'as yet unclassified' }
GBCircle >> radius: anInteger [ 
	radius := anInteger
]
