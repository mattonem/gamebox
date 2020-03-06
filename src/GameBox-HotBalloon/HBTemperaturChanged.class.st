Class {
	#name : #HBTemperaturChanged,
	#superclass : #Announcement,
	#instVars : [
		'temp'
	],
	#category : #'GameBox-HotBalloon'
}

{ #category : #accessing }
HBTemperaturChanged >> temp [
	^ temp
]

{ #category : #accessing }
HBTemperaturChanged >> temp: anObject [
	temp := anObject
]
