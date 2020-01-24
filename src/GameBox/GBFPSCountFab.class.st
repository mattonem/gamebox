Class {
	#name : #GBFPSCountFab,
	#superclass : #GameBoxNode,
	#instVars : [
		'script',
		'label'
	],
	#category : #GameBox
}

{ #category : #initialization }
GBFPSCountFab >> initialize [ 	
	|  |
	super initialize.
	label := GBLabel new.
	script := GBFPSCount new label: label; yourself.
	self addElement: script.
	self addElement: label.
]
