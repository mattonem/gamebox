Class {
	#name : #GameBox,
	#superclass : #GameBoxNode,
	#instVars : [
		'#lastUpdate => InitializedSlot default: [ DateAndTime now ]',
		'#process => InitializedSlot default: [ [  ] fork ]',
		'#camera'
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
GameBox >> newStepIncrement [
	^ GBStepIncrement new
		lastUpdate: lastUpdate;
		updateTime: DateAndTime now;
		yourself
]

{ #category : #'as yet unclassified' }
GameBox >> pause [
	process terminate
]

{ #category : #'as yet unclassified' }
GameBox >> play [
	process isTerminated
		ifTrue:
			[ [ [ self step ] value ] forkAt: Processor lowestPriority ]
]

{ #category : #'as yet unclassified' }
GameBox >> step [
	announcer announce: self newStepIncrement.
	^ announcer announce: GBStepFinished new
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
