Class {
	#name : #ASTMediaListNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'identTokens',
		'commaTokens'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaListNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaList: self
]

{ #category : #generated }
ASTMediaListNode >> commaTokens [

	^ commaTokens
]

{ #category : #generated }
ASTMediaListNode >> commaTokens: anOrderedCollection [

	commaTokens := anOrderedCollection
]

{ #category : #generated }
ASTMediaListNode >> compositeTokenVariables [

	^ #( #identTokens #commaTokens )
]

{ #category : #generated }
ASTMediaListNode >> identTokens [

	^ identTokens
]

{ #category : #generated }
ASTMediaListNode >> identTokens: anOrderedCollection [

	identTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
ASTMediaListNode >> initialize [
	super initialize.
	identTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]
