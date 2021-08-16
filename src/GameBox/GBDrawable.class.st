Class {
	#name : #GBDrawable,
	#superclass : #GameBoxElement,
	#category : #GameBox
}

{ #category : #initialization }
GBDrawable >> addedTo: aNode [
	announcer when: GBCameraDrawing do: [ :evt | self drawOn: evt canvas ].
	
]

{ #category : #initialization }
GBDrawable >> drawOn: canvas [
]
