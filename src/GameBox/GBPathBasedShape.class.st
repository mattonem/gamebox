Class {
	#name : #GBPathBasedShape,
	#superclass : #GBDrawable,
	#instVars : [
		'#path => InitializedSlot default: #()',
		'#color => InitializedSlot default: Color paleBlue'
	],
	#category : #GameBox
}

{ #category : #accessing }
GBPathBasedShape >> color: aColor [ 
	color := aColor
]

{ #category : #initialization }
GBPathBasedShape >> drawOn: canvas [
	canvas
		setPaint: color;
	   drawShape: (
			canvas createPath: [:aPath |
				aPath absolute.
				path do: [ :dot | aPath lineTo: dot ]
			])	
]

{ #category : #initialization }
GBPathBasedShape >> initialize [
	super initialize.
]

{ #category : #accessing }
GBPathBasedShape >> path: aCollection [ 
	path := aCollection
]
