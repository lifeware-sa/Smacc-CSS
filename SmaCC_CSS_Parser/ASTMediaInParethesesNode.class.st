Class {
	#name : #ASTMediaInParethesesNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'leftParenToken',
		'condition',
		'rightParenToken',
		'feature',
		'generalEnclosed'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaInParethesesNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaInParetheses: self
]

{ #category : #generated }
ASTMediaInParethesesNode >> condition [

	^ condition
]

{ #category : #generated }
ASTMediaInParethesesNode >> condition: anASTCSSNode [

	self condition notNil ifTrue: [ self condition parent: nil ].
	condition := anASTCSSNode.
	self condition notNil ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
ASTMediaInParethesesNode >> feature [

	^ feature
]

{ #category : #generated }
ASTMediaInParethesesNode >> feature: anASTMediaFeatureNode [

	self feature notNil ifTrue: [ self feature parent: nil ].
	feature := anASTMediaFeatureNode.
	self feature notNil ifTrue: [ self feature parent: self ]
]

{ #category : #generated }
ASTMediaInParethesesNode >> generalEnclosed [

	^ generalEnclosed
]

{ #category : #generated }
ASTMediaInParethesesNode >> generalEnclosed: anASTCSSNode [

	self generalEnclosed notNil ifTrue: [ 
		self generalEnclosed parent: nil ].
	generalEnclosed := anASTCSSNode.
	self generalEnclosed notNil ifTrue: [ 
		self generalEnclosed parent: self ]
]

{ #category : #generated }
ASTMediaInParethesesNode >> leftParenToken [

	^ leftParenToken
]

{ #category : #generated }
ASTMediaInParethesesNode >> leftParenToken: aSmaCCToken [

	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaInParethesesNode >> nodeVariables [

	^ #( #condition #feature #generalEnclosed )
]

{ #category : #generated }
ASTMediaInParethesesNode >> rightParenToken [

	^ rightParenToken
]

{ #category : #generated }
ASTMediaInParethesesNode >> rightParenToken: aSmaCCToken [

	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaInParethesesNode >> tokenVariables [

	^ #( #leftParenToken #rightParenToken )
]
