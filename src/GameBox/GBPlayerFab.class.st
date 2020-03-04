Class {
	#name : #GBPlayerFab,
	#superclass : #GBFab,
	#instVars : [
		'ref',
		'circle'
	],
	#category : #GameBox
}

{ #category : #building }
GBPlayerFab class >> build [
	<gbPrefab: #PlayerFab>
	| circle refc center refp script |
	circle := GBCircle new.
	refc := GBDrawingReference new.
	center := 512 @ 360.
	refc position: center.
	circle radius: 100.
	circle color: (Color red alpha: 0.5).
	refc addElement: circle.
	refp := GBDrawingReference new.
	refp position: 120 @ 0.
	circle := GBCircle new.
	circle color: Color blue.
	circle radius: 10.
	refp addElement: circle.
	refc addElement: refp.
	script := GBStepScriptBloc new
		bloc: [ :inc | 
			(inc activeKeys includes: $Q)
				ifTrue: [ refp angle: refp angle + (0.0002 * inc deltaTime asMilliSeconds) ] ];
		yourself.
	refc addElement: script.
	^ refc
]
