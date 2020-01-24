Class {
	#name : #GameBox,
	#superclass : #GameBoxNode,
	#instVars : [
		'#lastUpdate => InitializedSlot default: [ DateAndTime now ]',
		'#process => InitializedSlot default: [ [  ] fork ]',
		'#camera',
		'#eventInst => InitializedSlot default: [ GBStepIncrement new ]'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GameBox >> camera [
	^ camera
]

{ #category : #'as yet unclassified' }
GameBox >> camera: aGBCamera [ 
	camera := aGBCamera
]

{ #category : #initialization }
GameBox >> initialize [
	super initialize.
]

{ #category : #'as yet unclassified' }
GameBox >> newStepFinished [
	^ GBStepFinished new
		model: self;
		yourself
]

{ #category : #'as yet unclassified' }
GameBox >> newStepIncrement [
	| now  |
	now := DateAndTime now.
	{0 seconds.
	(20 milliSeconds - (lastUpdate - now))} max wait.
	now := DateAndTime now.
	eventInst 
		lastUpdate: lastUpdate;
		updateTime: now.
	lastUpdate := now.
	^ eventInst
]

{ #category : #'as yet unclassified' }
GameBox >> pause [
	process terminate
]

{ #category : #'as yet unclassified' }
GameBox >> play [
	process isTerminated
		ifTrue:
			[ process := [ [ self step ] repeat ] fork ]
]

{ #category : #'as yet unclassified' }
GameBox >> step [
	announcer announce: self newStepIncrement.
	^ announcer announce: self newStepFinished
]

{ #category : #'as yet unclassified' }
GameBox >> trachelCanvas [
	| c |
	c := TRCanvas new.
	children do: [ :child |  child initCanvas: c ].
	c
		addAnimation:
			(RTActiveAnimation new
				intervalInMilliseconds: 20;
				blockToExecute: [ | newUpdate delta |
					newUpdate := DateAndTime now.
					delta := (newUpdate - lastUpdate) asNanoSeconds.
					self
						step:
							(GBStepIncrement new
								deltaTime: delta;
								yourself).
					lastUpdate := newUpdate ]).
	^ c
]
