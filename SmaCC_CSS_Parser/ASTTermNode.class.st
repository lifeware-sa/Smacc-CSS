Class {
	#name : #ASTTermNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'terms',
		'operators'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTTermNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitTerm: self
]

{ #category : #generated }
ASTTermNode >> compositeTokenVariables [

	^ #( #operators )
]

{ #category : #'generated-initialize-release' }
ASTTermNode >> initialize [
	super initialize.
	terms := OrderedCollection new: 2.
	operators := OrderedCollection new: 2.
]

{ #category : #generated }
ASTTermNode >> operators [

	^ operators
]

{ #category : #generated }
ASTTermNode >> operators: anOrderedCollection [

	operators := anOrderedCollection
]

{ #category : #generated }
ASTTermNode >> otherVariables [

	^ #( #terms )
]

{ #category : #generated }
ASTTermNode >> terms [

	^ terms
]

{ #category : #generated }
ASTTermNode >> terms: anOrderedCollection [

	self setParent: self terms to: nil.
	terms := anOrderedCollection.
	self setParent: self terms to: self
]
