Class {
	#name : #GBStepScript,
	#superclass : #GameBoxElement,
	#category : #GameBox
}

{ #category : #initialization }
GBStepScript >> initialize [
	super initialize.
	announcer when: GBStepIncrement do: [ :evt | self step: evt ]
]

{ #category : #initialization }
GBStepScript >> step: anEvt [
	
]
