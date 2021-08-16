Class {
	#name : #GBStepScriptBloc,
	#superclass : #GBStepScript,
	#instVars : [
		'bloc'
	],
	#category : #GameBox
}

{ #category : #initialization }
GBStepScriptBloc >> bloc: abloc [
	bloc := abloc
]

{ #category : #initialization }
GBStepScriptBloc >> step: increment [
	bloc cull: increment
]
