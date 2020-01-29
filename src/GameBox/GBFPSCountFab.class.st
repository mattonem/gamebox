Class {
	#name : #GBFPSCountFab,
	#superclass : #GBFab,
	#instVars : [
		'script',
		'label',
		'ref'
	],
	#category : #GameBox
}

{ #category : #building }
GBFPSCountFab class >> build [ 	
	| label script ref |
	label := GBLabel new.
	script := GBFPSCount new label: label; yourself.
	ref := GBDrawingReference new.
	ref addElement: label.
	ref addElement: script.
	^ ref.
]
