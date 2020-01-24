Class {
	#name : #GBCameraTrachel,
	#superclass : #GBCamera,
	#instVars : [
		'#lastUpdate => InitializedSlot default: [ DateAndTime now ]',
		'#canvas'
	],
	#category : #GameBox
}

{ #category : #accessing }
GBCameraTrachel >> addedTo: aScene [
	canvas := TRCanvas new.
	aScene initCanvas: canvas.
	aScene announcer when: GBStepFinished do: [ canvas signalUpdate ].
	aScene announcer when: GBDrawableAdded  do: [ :evt | evt model initCanvas: canvas ].
	
]

{ #category : #initialization }
GBCameraTrachel >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
GBCameraTrachel >> trachelCanvas [
	^ canvas
]
