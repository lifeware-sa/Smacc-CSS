Class {
	#name : #ASTMediaPlainValueNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'key',
		'colonToken',
		'value'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaPlainValueNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaPlainValue: self
]

{ #category : #generated }
ASTMediaPlainValueNode >> colonToken [

	^ colonToken
]

{ #category : #generated }
ASTMediaPlainValueNode >> colonToken: aSmaCCToken [

	colonToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaPlainValueNode >> key [

	^ key
]

{ #category : #generated }
ASTMediaPlainValueNode >> key: aSmaCCToken [

	key := aSmaCCToken
]

{ #category : #generated }
ASTMediaPlainValueNode >> otherVariables [

	^ #( #value )
]

{ #category : #generated }
ASTMediaPlainValueNode >> tokenVariables [

	^ #( #key #colonToken )
]

{ #category : #generated }
ASTMediaPlainValueNode >> value [

	^ value
]

{ #category : #generated }
ASTMediaPlainValueNode >> value: anObject [

	self setParent: self value to: nil.
	value := anObject.
	self setParent: self value to: self
]
