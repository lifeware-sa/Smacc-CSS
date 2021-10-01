Class {
	#name : #ASTRuleSetSelectorListNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'leftSelector',
		'rightSelector',
		'combinator'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTRuleSetSelectorListNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitRuleSetSelectorList: self
]

{ #category : #generated }
ASTRuleSetSelectorListNode >> combinator [

	^ combinator
]

{ #category : #generated }
ASTRuleSetSelectorListNode >> combinator: aSmaCCToken [

	combinator := aSmaCCToken
]

{ #category : #generated }
ASTRuleSetSelectorListNode >> leftSelector [

	^ leftSelector
]

{ #category : #generated }
ASTRuleSetSelectorListNode >> leftSelector: anASTRuleSetSelectorNode [

	self leftSelector notNil ifTrue: [ self leftSelector parent: nil ].
	leftSelector := anASTRuleSetSelectorNode.
	self leftSelector notNil ifTrue: [ self leftSelector parent: self ]
]

{ #category : #generated }
ASTRuleSetSelectorListNode >> nodeVariables [

	^ #( #leftSelector #rightSelector )
]

{ #category : #generated }
ASTRuleSetSelectorListNode >> rightSelector [

	^ rightSelector
]

{ #category : #generated }
ASTRuleSetSelectorListNode >> rightSelector: anASTRuleSetSelectorListNode [

	self rightSelector notNil ifTrue: [ self rightSelector parent: nil ].
	rightSelector := anASTRuleSetSelectorListNode.
	self rightSelector notNil ifTrue: [ self rightSelector parent: self ]
]

{ #category : #generated }
ASTRuleSetSelectorListNode >> tokenVariables [

	^ #( #combinator )
]
