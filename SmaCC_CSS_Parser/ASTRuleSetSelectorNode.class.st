Class {
	#name : #ASTRuleSetSelectorNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'unarySelector',
		'selectors'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTRuleSetSelectorNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitRuleSetSelector: self
]

{ #category : #'generated-initialize-release' }
ASTRuleSetSelectorNode >> initialize [
	super initialize.
	selectors := OrderedCollection new: 2.
]

{ #category : #generated }
ASTRuleSetSelectorNode >> nodeVariables [

	^ #( #unarySelector )
]

{ #category : #generated }
ASTRuleSetSelectorNode >> otherVariables [

	^ #( #selectors )
]

{ #category : #generated }
ASTRuleSetSelectorNode >> selectors [

	^ selectors
]

{ #category : #generated }
ASTRuleSetSelectorNode >> selectors: anOrderedCollection [

	self setParent: self selectors to: nil.
	selectors := anOrderedCollection.
	self setParent: self selectors to: self
]

{ #category : #generated }
ASTRuleSetSelectorNode >> unarySelector [

	^ unarySelector
]

{ #category : #generated }
ASTRuleSetSelectorNode >> unarySelector: anASTUnarySelectorNode [

	self unarySelector notNil ifTrue: [ self unarySelector parent: nil ].
	unarySelector := anASTUnarySelectorNode.
	self unarySelector notNil ifTrue: [ self unarySelector parent: self ]
]
