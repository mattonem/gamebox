Class {
	#name : #GameBox,
	#superclass : #GameBoxNode,
	#instVars : [
		'#lastUpdate => InitializedSlot default: [ DateAndTime now ]',
		'#process => InitializedSlot default: [ [  ] fork ]',
		'#camera',
		'#eventInst => InitializedSlot default: [ :inst | \rGBStepIncrement new\r\tmodel: inst;\r\tyourself ]',
		'#activeKeys => InitializedSlot default: [ Set new ]'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GameBox >> activeKeys [ 
	^ camera activeKeys
]

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
	(20 milliSeconds - (now - lastUpdate))} max wait.
	now := DateAndTime now.
	eventInst 
		lastUpdate: lastUpdate;
		activeKeys: self activeKeys;
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
	lastUpdate := DateAndTime now.
	process isTerminated
		ifTrue:
			[ process := [ [ self step ] repeat ] fork ]
]

{ #category : #'as yet unclassified' }
GameBox >> step [
	| inc finished |
	inc := self newStepIncrement.
	children do: [ :c | c announcer announce: inc ].
	finished := self newStepFinished.
	children do: [ :c | c announcer announce: finished ]
]

{ #category : #'as yet unclassified' }
GameBox >> step100 [
	| inc finished |
	lastUpdate := DateAndTime now - 100 milliSeconds.
	inc := self newStepIncrement.
	children do: [ :c | c announcer announce: inc ].
	finished := self newStepFinished.
	children do: [ :c | c announcer announce: finished ]
]
