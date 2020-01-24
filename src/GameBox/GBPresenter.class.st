Class {
	#name : #GBPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'play',
		'pause',
		'morph',
		'model',
		'ft',
		'ds'
	],
	#category : #GameBox
}

{ #category : #specs }
GBPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #morph;
				add: #ft;
				yourself);
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
	ft := self newMorph.
	ds := FTBasicTreeListDataSource new
		root: nil;
		children: [ :item | item children ];
		display: [ :item :cell | cell addMorphBack: item printString asMorph ];
		yourself.
	ft morph: (FTTableMorph new extent: 200 @ 200; dataSource: ds; yourself).
	morph
		morph:
			(Morph new
				extent: 400 @ 400;
				yourself).
	play
		icon: GLMUIThemeExtraIcons glamorousPlay;
		action: [ model play ].
	pause
		icon: GLMUIThemeExtraIcons glamorousRemove;
		action: [ model pause ].
	self focusOrder
		add: play;
		add: pause
]

{ #category : #'as yet unclassified' }
GBPresenter >> model: aGameBox [ 
	model := aGameBox.
	morph morph: model camera morph.
	ds root: model.
]
