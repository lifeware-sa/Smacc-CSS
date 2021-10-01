Class {
	#name : #ASTMediaValueNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'nUMBERToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaValueNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaValue: self
]

{ #category : #generated }
ASTMediaValueNode >> nUMBERToken [

	^ nUMBERToken
]

{ #category : #generated }
ASTMediaValueNode >> nUMBERToken: aSmaCCToken [

	nUMBERToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaValueNode >> tokenVariables [

	^ #( #nUMBERToken )
]
