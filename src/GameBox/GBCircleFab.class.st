Class {
	#name : #GBCircleFab,
	#superclass : #GBFab,
	#instVars : [
		'ref',
		'circle'
	],
	#category : #GameBox
}

{ #category : #building }
GBCircleFab class >> build [
	| circle ref |
	circle := GBCircle new.
	ref := GBDrawingReference new.
	ref addElement: circle.
	^ ref
]
