Class {
	#name : #GBCircle,
	#superclass : #GBDrawable,
	#instVars : [
		'#radius => InitializedSlot default: 5',
		'#color => InitializedSlot default: Color paleBlue'
	],
	#category : #GameBox
}

{ #category : #'as yet unclassified' }
GBCircle >> color: aColor [ 
	color := aColor
]

{ #category : #initialization }
GBCircle >> drawOn: acanvas [
	| ellipsePath |
	ellipsePath := acanvas
		createPath: [ :builder | 
			builder
				moveTo: 0 @ radius;
				cwArcTo: 0 @ (-2 * radius) angle: Float pi;
				cwArcTo: 0 @ (2 * radius) angle: Float pi ].
	acanvas setPaint: color.
	acanvas drawShape: ellipsePath
]

{ #category : #initialization }
GBCircle >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #'as yet unclassified' }
GBCircle >> radius: anInteger [ 
	radius := anInteger
]
