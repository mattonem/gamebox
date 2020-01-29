Class {
	#name : #GBPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'play',
		'pause',
		'morph',
		'model',
		'step',
		'sceneft',
		'fabft'
	],
	#category : #GameBox
}

{ #category : #specs }
GBPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add:
			(SpPanedLayout newHorizontal
				add:
					(SpPanedLayout newVertical
						add: #sceneft;
						add: #fabft;
						yourself);
				add: #morph;
				yourself);
		add:
			(SpBoxLayout newHorizontal
				add: #play;
				add: #step;
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
GBPresenter >> createNewFab: selection [
	sceneft selectedItem addElement: selection new.
	
	sceneft roots: sceneft roots
]

{ #category : #initialization }
GBPresenter >> initializeWidgets [
	play := self newButton.
	pause := self newButton.
	step := self newButton.
	morph := self newMorph.
	sceneft := self newTreeTable.
	fabft := self newTreeTable.
	sceneft
		roots: {};
		children: [ :item | item children ].
	fabft
		roots: {GBFab};
		activateOnDoubleClick;
		whenActivatedDo:
				[ :selection | self createNewFab: selection selectedItem];
		children: [ :aClass | aClass subclasses ].
	morph
		morph:
			(Morph new
				extent: 400 @ 400;
				yourself).
	step
		icon: GLMUIThemeExtraIcons glamorousInto;
		action: [ model step ].
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
	sceneft roots: {model}.
]
