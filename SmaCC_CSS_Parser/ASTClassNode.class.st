Class {
	#name : #ASTClassNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'periodToken',
		'identToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTClassNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitClass: self
]

{ #category : #generated }
ASTClassNode >> identToken [

	^ identToken
]

{ #category : #generated }
ASTClassNode >> identToken: aSmaCCToken [

	identToken := aSmaCCToken
]

{ #category : #generated }
ASTClassNode >> periodToken [

	^ periodToken
]

{ #category : #generated }
ASTClassNode >> periodToken: aSmaCCToken [

	periodToken := aSmaCCToken
]

{ #category : #generated }
ASTClassNode >> tokenVariables [

	^ #( #periodToken #identToken )
]
