Class {
	#name : #GBFPSCount,
	#superclass : #GBStepScript,
	#instVars : [
		'label'
	],
	#category : #GameBox
}

{ #category : #initialization }
GBFPSCount >> label: aLabel [
	label := aLabel
]

{ #category : #initialization }
GBFPSCount >> step: increment [
	label
		text: ((1000/increment deltaTime asMilliSeconds asFloat) roundTo: 0.01)  asString
]
