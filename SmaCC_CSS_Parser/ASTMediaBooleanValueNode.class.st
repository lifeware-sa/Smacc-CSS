Class {
	#name : #ASTMediaBooleanValueNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'identToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaBooleanValueNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaBooleanValue: self
]

{ #category : #generated }
ASTMediaBooleanValueNode >> identToken [

	^ identToken
]

{ #category : #generated }
ASTMediaBooleanValueNode >> identToken: aSmaCCToken [

	identToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaBooleanValueNode >> tokenVariables [

	^ #( #identToken )
]
