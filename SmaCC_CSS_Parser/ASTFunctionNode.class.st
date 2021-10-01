Class {
	#name : #ASTFunctionNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'functionName',
		'argumentList',
		'rightParenToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTFunctionNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitFunction: self
]

{ #category : #generated }
ASTFunctionNode >> argumentList [

	^ argumentList
]

{ #category : #generated }
ASTFunctionNode >> argumentList: anASTArgumentListNode [

	self argumentList notNil ifTrue: [ self argumentList parent: nil ].
	argumentList := anASTArgumentListNode.
	self argumentList notNil ifTrue: [ self argumentList parent: self ]
]

{ #category : #generated }
ASTFunctionNode >> functionName [

	^ functionName
]

{ #category : #generated }
ASTFunctionNode >> functionName: aSmaCCToken [

	functionName := aSmaCCToken
]

{ #category : #generated }
ASTFunctionNode >> nodeVariables [

	^ #( #argumentList )
]

{ #category : #generated }
ASTFunctionNode >> rightParenToken [

	^ rightParenToken
]

{ #category : #generated }
ASTFunctionNode >> rightParenToken: aSmaCCToken [

	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTFunctionNode >> tokenVariables [

	^ #( #functionName #rightParenToken )
]
