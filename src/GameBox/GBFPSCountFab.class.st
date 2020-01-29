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

{ #category : #initialization }
GBFPSCountFab >> initialize [ 	
	|  |
	super initialize.
	label := GBLabel new.
	script := GBFPSCount new label: label; yourself.
	ref := GBDrawingReference new.
	ref addElement: label.
	self addElement: script.
	self addElement: ref.
]
