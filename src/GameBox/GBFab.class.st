Class {
	#name : #GBFab,
	#superclass : #Object,
	#category : #GameBox
}

{ #category : #building }
GBFab class >> buildCircle [
	<gbPrefab: #CircleFab>
	| circle ref |
	circle := GBCircle new.
	ref := GBDrawingReference new
		name: 'Circle';
		yourself.
	ref addElement: circle.
	^ ref
]

{ #category : #building }
GBFab class >> buildFPSCounter [
	<gbPrefab: #FPSCountFab>
	| label script ref |
	label := GBLabel new.
	script := GBFPSCount new
		label: label;
		yourself.
	ref := GBDrawingReference new
		name: 'FPSCountFab';
		yourself.
	ref addElement: label.
	ref addElement: script.
	^ ref
]
