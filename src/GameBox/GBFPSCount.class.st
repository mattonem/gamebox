Class {
	#name : #GBFPSCount,
	#superclass : #GBDrawable,
	#instVars : [
		'label'
	],
	#category : #GameBox
}

{ #category : #initialization }
GBFPSCount >> initCanvas: aCanvas [
	label := TRLabelShape new.
	aCanvas addShape: label.
]

{ #category : #initialization }
GBFPSCount >> step: increment [
	label
		text: ((1000000000 / increment deltaTime) asFloat round: 2) asString
]
