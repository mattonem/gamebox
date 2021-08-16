Class {
	#name : #GBCameraDrawing,
	#superclass : #GBAnnouncement,
	#instVars : [
		'canvas'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GBCameraDrawing >> canvas [
	^ canvas
]

{ #category : #'as yet unclassified' }
GBCameraDrawing >> canvas: anAthensCairoCanvas [ 
	canvas := anAthensCairoCanvas 
]
