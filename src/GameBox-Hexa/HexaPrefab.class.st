Class {
	#name : #HexaPrefab,
	#superclass : #Object,
	#category : #'GameBox-Hexa'
}

{ #category : #'as yet unclassified' }
HexaPrefab class >> buildHexa [
	<gbPrefab: #HexaTile>
	| shape refCenter |
	shape := GBPathBasedShape new
		path: { 
		(10*((Float pi/6) cos) )@(10*((Float pi/6) sin) ).
		0@10.
		(-10 * (3 sqrt) )/2@ 5.
		(-10 * (3 sqrt) )/2@ -5.
		0@(-10).
		(10 * (3 sqrt) )/2@ -5.
		(10*((Float pi/6) cos) )@(10*((Float pi/6) sin) ).};
		color: Color red;
		yourself.

	refCenter := GBDrawingReference new
		name: 'tile';
		yourself.
	
	
	refCenter addElement: shape.
	^ refCenter
]
