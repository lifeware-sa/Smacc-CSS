Class {
	#name : #ASTPseudoPageNameNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'colonToken',
		'identToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTPseudoPageNameNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitPseudoPageName: self
]

{ #category : #generated }
ASTPseudoPageNameNode >> colonToken [

	^ colonToken
]

{ #category : #generated }
ASTPseudoPageNameNode >> colonToken: aSmaCCToken [

	colonToken := aSmaCCToken
]

{ #category : #generated }
ASTPseudoPageNameNode >> identToken [

	^ identToken
]

{ #category : #generated }
ASTPseudoPageNameNode >> identToken: aSmaCCToken [

	identToken := aSmaCCToken
]

{ #category : #generated }
ASTPseudoPageNameNode >> tokenVariables [

	^ #( #colonToken #identToken )
]
