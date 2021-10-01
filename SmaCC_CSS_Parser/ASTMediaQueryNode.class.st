Class {
	#name : #ASTMediaQueryNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'condition',
		'identifier',
		'andToken',
		'notToken',
		'onlyToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaQueryNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaQuery: self
]

{ #category : #generated }
ASTMediaQueryNode >> andToken [

	^ andToken
]

{ #category : #generated }
ASTMediaQueryNode >> andToken: aSmaCCToken [

	andToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaQueryNode >> condition [

	^ condition
]

{ #category : #generated }
ASTMediaQueryNode >> condition: anASTCSSNode [

	self condition notNil ifTrue: [ self condition parent: nil ].
	condition := anASTCSSNode.
	self condition notNil ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
ASTMediaQueryNode >> identifier [

	^ identifier
]

{ #category : #generated }
ASTMediaQueryNode >> identifier: aSmaCCToken [

	identifier := aSmaCCToken
]

{ #category : #generated }
ASTMediaQueryNode >> nodeVariables [

	^ #( #condition )
]

{ #category : #generated }
ASTMediaQueryNode >> notToken [

	^ notToken
]

{ #category : #generated }
ASTMediaQueryNode >> notToken: aSmaCCToken [

	notToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaQueryNode >> onlyToken [

	^ onlyToken
]

{ #category : #generated }
ASTMediaQueryNode >> onlyToken: aSmaCCToken [

	onlyToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaQueryNode >> tokenVariables [

	^ #( #identifier #andToken #notToken #onlyToken )
]
