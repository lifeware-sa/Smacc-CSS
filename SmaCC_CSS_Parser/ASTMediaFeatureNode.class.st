Class {
	#name : #ASTMediaFeatureNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'leftParenToken',
		'value',
		'rightParenToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaFeatureNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaFeature: self
]

{ #category : #generated }
ASTMediaFeatureNode >> leftParenToken [

	^ leftParenToken
]

{ #category : #generated }
ASTMediaFeatureNode >> leftParenToken: aSmaCCToken [

	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaFeatureNode >> nodeVariables [

	^ #( #value )
]

{ #category : #generated }
ASTMediaFeatureNode >> rightParenToken [

	^ rightParenToken
]

{ #category : #generated }
ASTMediaFeatureNode >> rightParenToken: aSmaCCToken [

	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaFeatureNode >> tokenVariables [

	^ #( #leftParenToken #rightParenToken )
]

{ #category : #generated }
ASTMediaFeatureNode >> value [

	^ value
]

{ #category : #generated }
ASTMediaFeatureNode >> value: anASTCSSNode [

	self value notNil ifTrue: [ self value parent: nil ].
	value := anASTCSSNode.
	self value notNil ifTrue: [ self value parent: self ]
]
