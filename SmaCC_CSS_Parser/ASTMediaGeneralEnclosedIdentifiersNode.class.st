Class {
	#name : #ASTMediaGeneralEnclosedIdentifiersNode,
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
ASTMediaGeneralEnclosedIdentifiersNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaGeneralEnclosedIdentifiers: self
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> identifierLeft [

	^ identifierLeft
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> identifierLeft: aSmaCCToken [

	identifierLeft := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> identifierRight [

	^ identifierRight
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> identifierRight: aSmaCCToken [

	identifierRight := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> leftParenToken [

	^ leftParenToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> leftParenToken: aSmaCCToken [

	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> rightParenToken [

	^ rightParenToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> rightParenToken: aSmaCCToken [

	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedIdentifiersNode >> tokenVariables [

	^ #( #leftParenToken #identifierLeft #identifierRight
	     #rightParenToken )
]
