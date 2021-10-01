Class {
	#name : #ASTVariableNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'minusMinusToken',
		'identToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTVariableNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitVariable: self
]

{ #category : #generated }
ASTVariableNode >> identToken [

	^ identToken
]

{ #category : #generated }
ASTVariableNode >> identToken: aSmaCCToken [

	identToken := aSmaCCToken
]

{ #category : #generated }
ASTVariableNode >> minusMinusToken [

	^ minusMinusToken
]

{ #category : #generated }
ASTVariableNode >> minusMinusToken: aSmaCCToken [

	minusMinusToken := aSmaCCToken
]

{ #category : #generated }
ASTVariableNode >> tokenVariables [

	^ #( #minusMinusToken #identToken )
]
