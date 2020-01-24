Class {
	#name : #GBDrawable,
	#superclass : #GameBoxElement,
	#category : #GameBox
}

{ #category : #initialization }
GBDrawable >> addedTo: aNode [
	aNode drawableAdded: self
]
