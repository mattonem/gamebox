Class {
	#name : #GBPhysicalObject,
	#superclass : #GameBoxElement,
	#instVars : [
		'masse',
		'reference',
		'forces',
		'speed'
	],
	#category : #GameBox
}

{ #category : #accessing }
GBPhysicalObject >> forces [
	^ forces
]

{ #category : #accessing }
GBPhysicalObject >> forces: anObject [
	forces := anObject
]

{ #category : #accessing }
GBPhysicalObject >> initialize [
	super initialize.
	announcer when: GBPhysicsMove do: [ :evt | self step: evt ]
]

{ #category : #accessing }
GBPhysicalObject >> masse [
	^ masse
]

{ #category : #accessing }
GBPhysicalObject >> masse: anObject [
	masse := anObject
]

{ #category : #accessing }
GBPhysicalObject >> reference [
	^ reference
]

{ #category : #accessing }
GBPhysicalObject >> reference: anObject [
	reference := anObject
]

{ #category : #initialization }
GBPhysicalObject >> step: increment [
	speed := speed + (forces / masse).
	reference position: reference position + speed.
	forces := 0
]
