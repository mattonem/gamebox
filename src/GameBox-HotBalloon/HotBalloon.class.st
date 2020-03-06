Class {
	#name : #HotBalloon,
	#superclass : #GameBoxNode,
	#category : #'GameBox-HotBalloon'
}

{ #category : #accessing }
HotBalloon class >> buildBalloon [
	<gbPrefab: #BalloonFab>
	| balloon refBase basket temp script speed |
	balloon := self buildHotBalloon.
	refBase := GBDrawingReference new
		position: 100 @ 100;
		name: 'Balloon';
		yourself.
	refBase addElement: balloon.
	balloon position: 0 @ -70.
	basket := self buildBasket.
	refBase addElement: basket.
	temp := 121.
	speed := 0 @ 0.
	script := GBStepScriptBloc new
		bloc: [ :inc | 
			temp := temp - (0.001 * inc deltaTime asMilliSeconds).
			temp := temp max: 60.
			(inc activeKeys includes: Character space)
				ifTrue: [ temp := temp + (0.002 * inc deltaTime asMilliSeconds) ].
			speed := 0 @ ((120 - temp) * 0.01 * inc deltaTime asMilliSeconds).
			refBase position: refBase position + speed.
			refBase
				position:
					(refBase position
						min: refBase position x @ 576).
			balloon announcer
				announce:
					(HBTemperaturChanged new
						temp: temp;
						yourself) ];
		yourself.
	refBase addElement: script.
	^ refBase
]

{ #category : #'as yet unclassified' }
HotBalloon class >> buildBasket [
	<gbPrefab: #BasketFab>
	| bascket refBase |
	
	bascket := GBRectangle new extends: 20@20.
	refBase := GBDrawingReference new
	position: -10@ -20 ;
		name: 'basket';
		yourself.
	refBase addElement: bascket.
	^ refBase
]

{ #category : #'as yet unclassified' }
HotBalloon class >> buildHotBalloon [
	<gbPrefab: #HotBalloonFab>
	| circle refCenter labeltemp  |
	circle := GBCircle new
		radius: 30;
		color: Color red;
		yourself.
	labeltemp := GBLabel new.
	refCenter := GBDrawingReference new
		name: 'balloon';
		yourself.
	
	refCenter announcer
		when: HBTemperaturChanged
		do: [ :tempChanged | labeltemp text: (tempChanged temp roundTo: 0.01) asString , '°' ].
	refCenter addElement: circle.
	refCenter addElement: labeltemp.
	^ refCenter
]
