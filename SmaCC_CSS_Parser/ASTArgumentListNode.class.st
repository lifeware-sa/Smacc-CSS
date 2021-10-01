Class {
	#name : #ASTArgumentListNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'args',
		'commaTokens'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTArgumentListNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitArgumentList: self
]

{ #category : #generated }
ASTArgumentListNode >> args [

	^ args
]

{ #category : #generated }
ASTArgumentListNode >> args: anOrderedCollection [

	self setParents: self args to: nil.
	args := anOrderedCollection.
	self setParents: self args to: self
]

{ #category : #generated }
ASTArgumentListNode >> commaTokens [

	^ commaTokens
]

{ #category : #generated }
ASTArgumentListNode >> commaTokens: anOrderedCollection [

	commaTokens := anOrderedCollection
]

{ #category : #generated }
ASTArgumentListNode >> compositeNodeVariables [

	^ #( #args )
]

{ #category : #generated }
ASTArgumentListNode >> compositeTokenVariables [

	^ #( #commaTokens )
]

{ #category : #'generated-initialize-release' }
ASTArgumentListNode >> initialize [
	super initialize.
	args := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]
