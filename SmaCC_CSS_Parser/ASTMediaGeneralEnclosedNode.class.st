Class {
	#name : #ASTMediaGeneralEnclosedNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'leftParenToken',
		'identifierLeft',
		'identifierRight',
		'rightParenToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaGeneralEnclosed: self
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> identifierLeft [

	^ identifierLeft
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> identifierLeft: aSmaCCToken [

	identifierLeft := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> identifierRight [

	^ identifierRight
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> identifierRight: aSmaCCToken [

	identifierRight := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> leftParenToken [

	^ leftParenToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> leftParenToken: aSmaCCToken [

	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> rightParenToken [

	^ rightParenToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> rightParenToken: aSmaCCToken [

	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedNode >> tokenVariables [

	^ #( #leftParenToken #identifierLeft #identifierRight
	     #rightParenToken )
]
