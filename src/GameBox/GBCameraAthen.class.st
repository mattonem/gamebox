Class {
	#name : #GBCameraAthen,
	#superclass : #GBCamera,
	#instVars : [
		'#lastUpdate => InitializedSlot default: [ DateAndTime now ]',
		'#surface => InitializedSlot default: [ :inst | inst initSurface ]',
		'#morph => LazySlot default: [ :inst | inst initMorph ]',
		'#drawIngEvent => InitializedSlot default: [ GBCameraDrawing new ]'
	],
	#category : #GameBox
}

{ #category : #accessing }
GBCameraAthen >> addedTo: aScene [
	aScene announcer
		when: GBStepFinished
		do: [ :evt | self refreshView: evt ].
]

{ #category : #accessing }
GBCameraAthen >> drawingInstanceOn: can [
	^ drawIngEvent
		canvas: can;
		yourself
]

{ #category : #accessing }
GBCameraAthen >> initMorph [
	^ surface asMorph
]

{ #category : #accessing }
GBCameraAthen >> initSurface [
	^ AthensCairoSurface extent: 500 @ 300.
]

{ #category : #initialization }
GBCameraAthen >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #'as yet unclassified' }
GBCameraAthen >> morph [
	^ morph
]

{ #category : #accessing }
GBCameraAthen >> refreshView [
	^ surface
		drawDuring:
			[ :can | GBStepFinished model announcer announce: (GBCameraDrawing canvas: can) ]
]

{ #category : #accessing }
GBCameraAthen >> refreshView: evt [
	surface
		drawDuring: [ :can | 
			surface clear.
			can
				setPaint: Color white;
				drawShape: (0 @ 0 corner: surface extent).
			evt model announcer announce: (self drawingInstanceOn: can).
			morph changed ]
]

{ #category : #'as yet unclassified' }
GBCameraAthen >> surface [
	^ surface
]
