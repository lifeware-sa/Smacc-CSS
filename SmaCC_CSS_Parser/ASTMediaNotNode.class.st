Class {
	#name : #ASTMediaNotNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'notToken',
		'value'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaNotNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaNot: self
]

{ #category : #generated }
ASTMediaNotNode >> nodeVariables [

	^ #( #value )
]

{ #category : #generated }
ASTMediaNotNode >> notToken [

	^ notToken
]

{ #category : #generated }
ASTMediaNotNode >> notToken: aSmaCCToken [

	notToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaNotNode >> tokenVariables [

	^ #( #notToken )
]

{ #category : #generated }
ASTMediaNotNode >> value [

	^ value
]

{ #category : #generated }
ASTMediaNotNode >> value: anASTMediaInParethesesNode [

	self value notNil ifTrue: [ self value parent: nil ].
	value := anASTMediaInParethesesNode.
	self value notNil ifTrue: [ self value parent: self ]
]
