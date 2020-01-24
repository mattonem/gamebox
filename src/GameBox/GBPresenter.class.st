Class {
	#name : #GBPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'play',
		'pause',
		'morph',
		'model'
	],
	#category : #GameBox
}

{ #category : #specs }
GBPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #morph;
		add:
			(SpBoxLayout newHorizontal
				add: #play;
				add: #pause;
				yourself)
			withConstraints: [ :constraints | constraints height: self toolbarHeight ];
		yourself
]

{ #category : #'as yet unclassified' }
GBPresenter class >> open: aGameBox [ 
	^ self new model: aGameBox; openWithSpec; yourself.
]

{ #category : #initialization }
GBPresenter >> initializeWidgets [
	play := self newButton.
	pause := self newButton.
	morph := self newMorph.

	morph morph: TRMorph new.

	play
		icon: GLMUIThemeExtraIcons glamorousPlay;
		action: [ model play ].
	pause
		icon: GLMUIThemeExtraIcons glamorousRemove;
		action: [ model pause].

	self focusOrder
		add: play;
		add: pause
]

{ #category : #'as yet unclassified' }
GBPresenter >> model: aGameBox [ 
	model := aGameBox.
"	morph morph: model camera trachelCanvas morph."
]
