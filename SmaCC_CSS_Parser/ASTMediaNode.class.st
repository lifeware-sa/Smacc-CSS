Class {
	#name : #ASTMediaNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'mediaSym',
		'queries',
		'commaTokens',
		'leftBraceToken',
		'rules',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMedia: self
]

{ #category : #generated }
ASTMediaNode >> commaTokens [

	^ commaTokens
]

{ #category : #generated }
ASTMediaNode >> commaTokens: anOrderedCollection [

	commaTokens := anOrderedCollection
]

{ #category : #generated }
ASTMediaNode >> compositeNodeVariables [

	^ #( #queries #rules )
]

{ #category : #generated }
ASTMediaNode >> compositeTokenVariables [

	^ #( #commaTokens )
]

{ #category : #'generated-initialize-release' }
ASTMediaNode >> initialize [
	super initialize.
	queries := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	rules := OrderedCollection new: 2.
]

{ #category : #generated }
ASTMediaNode >> leftBraceToken [

	^ leftBraceToken
]

{ #category : #generated }
ASTMediaNode >> leftBraceToken: aSmaCCToken [

	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaNode >> mediaSym [

	^ mediaSym
]

{ #category : #generated }
ASTMediaNode >> mediaSym: aSmaCCToken [

	mediaSym := aSmaCCToken
]

{ #category : #generated }
ASTMediaNode >> queries [

	^ queries
]

{ #category : #generated }
ASTMediaNode >> queries: anOrderedCollection [

	self setParents: self queries to: nil.
	queries := anOrderedCollection.
	self setParents: self queries to: self
]

{ #category : #generated }
ASTMediaNode >> rightBraceToken [

	^ rightBraceToken
]

{ #category : #generated }
ASTMediaNode >> rightBraceToken: aSmaCCToken [

	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTMediaNode >> rules [

	^ rules
]

{ #category : #generated }
ASTMediaNode >> rules: anOrderedCollection [

	self setParents: self rules to: nil.
	rules := anOrderedCollection.
	self setParents: self rules to: self
]

{ #category : #generated }
ASTMediaNode >> tokenVariables [

	^ #( #mediaSym #leftBraceToken #rightBraceToken )
]
