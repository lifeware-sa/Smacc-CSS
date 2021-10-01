Class {
	#name : #ASTRuleSetNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'selectors',
		'commaTokens',
		'leftBraceToken',
		'semicolonTokens',
		'declarations',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTRuleSetNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitRuleSet: self
]

{ #category : #generated }
ASTRuleSetNode >> commaTokens [

	^ commaTokens
]

{ #category : #generated }
ASTRuleSetNode >> commaTokens: anOrderedCollection [

	commaTokens := anOrderedCollection
]

{ #category : #generated }
ASTRuleSetNode >> compositeNodeVariables [

	^ #( #selectors #declarations )
]

{ #category : #generated }
ASTRuleSetNode >> compositeTokenVariables [

	^ #( #commaTokens #semicolonTokens )
]

{ #category : #generated }
ASTRuleSetNode >> declarations [

	^ declarations
]

{ #category : #generated }
ASTRuleSetNode >> declarations: anOrderedCollection [

	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #'generated-initialize-release' }
ASTRuleSetNode >> initialize [
	super initialize.
	selectors := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	semicolonTokens := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
ASTRuleSetNode >> leftBraceToken [

	^ leftBraceToken
]

{ #category : #generated }
ASTRuleSetNode >> leftBraceToken: aSmaCCToken [

	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTRuleSetNode >> rightBraceToken [

	^ rightBraceToken
]

{ #category : #generated }
ASTRuleSetNode >> rightBraceToken: aSmaCCToken [

	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTRuleSetNode >> selectors [

	^ selectors
]

{ #category : #generated }
ASTRuleSetNode >> selectors: anOrderedCollection [

	self setParents: self selectors to: nil.
	selectors := anOrderedCollection.
	self setParents: self selectors to: self
]

{ #category : #generated }
ASTRuleSetNode >> semicolonTokens [

	^ semicolonTokens
]

{ #category : #generated }
ASTRuleSetNode >> semicolonTokens: anOrderedCollection [

	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
ASTRuleSetNode >> tokenVariables [

	^ #( #leftBraceToken #rightBraceToken )
]
