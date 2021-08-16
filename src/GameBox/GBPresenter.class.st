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
	sceneft selectedItem
		addElement: (selection methodClass instanceSide perform: selection methodSelector).
	sceneft roots: sceneft roots
]

{ #category : #'as yet unclassified' }
GBPresenter >> deleteSelectedElement [
	sceneft roots
		detect: [ :aroot | aroot includesElement: sceneft selectedItem ]
		ifFound: [ :aroot | 
			aroot
				withParentOf: sceneft selectedItem
				do: [ :parent | parent removeElement: sceneft selectedItem ] ].
	sceneft roots: sceneft roots
]

{ #category : #'as yet unclassified' }
GBPresenter >> export: aGBDrawingReference [
	^ (STON toString: aGBDrawingReference) inspect
]

{ #category : #'as yet unclassified' }
GBPresenter >> exportSelectedElement [
	self export: sceneft selectedItem
]

{ #category : #initialization }
GBPresenter >> initializeWidgets [
	| menu fabs |
	play := self newButton.
	pause := self newButton.
	step := self newButton.
	morph := self newMorph.
	sceneft := self newTreeTable.
	fabft := self newTable.
	menu := self newMenu.
	menu
		title: 'edit';
		addGroup: [ :group | 
			group
				addItem: [ :anItem | 
					anItem
						name: 'delete';
						action: [ self deleteSelectedElement ] ].
			group
				addItem: [ :anItem | 
					anItem
						name: 'export';
						action: [ self exportSelectedElement ] ] ].
	sceneft
		roots: {};
		activateOnDoubleClick;
		addColumn: (SpStringTableColumn evaluated: #name);
		contextMenu: menu;
		whenActivatedDo: [ :selection | selection selectedItem inspect ];
		children: [ :item | item children ].
	fabs := (PragmaCollector
		filter: [ :prg | prg selector = 'gbPrefab:' ]) reset collected.
	fabft
		items: fabs;
		addColumn:
			(SpStringTableColumn
				title: 'Name'
				evaluated: [ :e | e arguments first ]);
		activateOnDoubleClick;
		whenActivatedDo: [ :selection | self createNewFab: selection selectedItem ].
	morph
		morph:
			(Morph new
				extent: 1024 @ 576;
				yourself).
	step
		icon: GLMUIThemeExtraIcons glamorousInto;
		action: [ model step100 ].
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
