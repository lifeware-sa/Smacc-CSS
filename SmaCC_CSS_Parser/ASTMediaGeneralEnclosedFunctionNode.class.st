Class {
	#name : #ASTMediaGeneralEnclosedFunctionNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'functionName',
		'identifierRight',
		'rightParenToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaGeneralEnclosedFunctionNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaGeneralEnclosedFunction: self
]

{ #category : #generated }
ASTMediaGeneralEnclosedFunctionNode >> functionName [

	^ functionName
]

{ #category : #generated }
ASTMediaGeneralEnclosedFunctionNode >> functionName: aSmaCCToken [

	functionName := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedFunctionNode >> identifierRight [

	^ identifierRight
]

{ #category : #generated }
ASTMediaGeneralEnclosedFunctionNode >> identifierRight: aSmaCCToken [

	identifierRight := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedFunctionNode >> rightParenToken [

	^ rightParenToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedFunctionNode >> rightParenToken: aSmaCCToken [

	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaGeneralEnclosedFunctionNode >> tokenVariables [

	^ #( #functionName #identifierRight #rightParenToken )
]
