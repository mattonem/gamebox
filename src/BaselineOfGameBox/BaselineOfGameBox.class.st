Class {
	#name : #BaselineOfGameBox,
	#superclass : #BaselineOf,
	#category : #BaselineOfGameBox
}

{ #category : #baselines }
BaselineOfGameBox >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec baseline: 'AthensSVG' with: [ 
			spec
				loads: #( 'default' );
				repository: 'github://pharo-contributions/Athens-SVG' ].
		spec package: 'GameBox' with: [ spec requires: #(  ) ].
		spec package: 'GameBox-Hexa' with: [ spec requires: #( GameBox ) ].
		spec
			package: 'GameBox-HotBalloon'
			with: [ spec requires: #( GameBox ) ] ].
	spec group: 'default' with: #( GameBox 'GameBox-Hexa' )
]
