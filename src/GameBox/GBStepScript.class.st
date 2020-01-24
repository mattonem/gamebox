Class {
	#name : #GBStepScript,
	#superclass : #GameBoxNode,
	#category : #GameBox
}

{ #category : #initialization }
GBStepScript >> addedTo: aNode [
	super addedTo: aNode.
	aNode announcer when: GBStepIncrement do: [ :evt | self step: evt ]
]

{ #category : #initialization }
GBStepScript >> step: anEvt [
	
]
