Class {
	#name : #GBRectangle,
	#superclass : #GBDrawable,
	#instVars : [
		'#extends => InitializedSlot default: [ 10 @ 20 ]',
		'#color => InitializedSlot default: Color paleBlue'
	],
	#category : #GameBox
}

{ #category : #initialization }
GBRectangle >> drawOn: canvas [
	canvas
		setPaint: color;
		drawShape: (0 @ 0 corner: extends)
]

{ #category : #'as yet unclassified' }
GBRectangle >> extends: aPoint [ 
	extends := aPoint
]

{ #category : #initialization }
GBRectangle >> initialize [
	super initialize.
]
