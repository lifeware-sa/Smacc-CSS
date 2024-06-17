Class {
	#name : #ASTAttributeNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'leftBracketToken',
		'identTokens',
		'rightBracketToken',
		'equalToken',
		'stringToken',
		'iNCLUDESToken',
		'dASHMATCHToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTAttributeNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitAttribute: self
]

{ #category : #generated }
ASTAttributeNode >> compositeTokenVariables [

	^ #( #identTokens )
]

{ #category : #generated }
ASTAttributeNode >> dASHMATCHToken [

	^ dASHMATCHToken
]

{ #category : #generated }
ASTAttributeNode >> dASHMATCHToken: aSmaCCToken [

	dASHMATCHToken := aSmaCCToken
]

{ #category : #generated }
ASTAttributeNode >> equalToken [

	^ equalToken
]

{ #category : #generated }
ASTAttributeNode >> equalToken: aSmaCCToken [

	equalToken := aSmaCCToken
]

{ #category : #generated }
ASTAttributeNode >> identTokens [

	^ identTokens
]

{ #category : #generated }
ASTAttributeNode >> identTokens: anOrderedCollection [

	identTokens := anOrderedCollection
]

{ #category : #generated }
ASTAttributeNode >> iNCLUDESToken [

	^ iNCLUDESToken
]

{ #category : #generated }
ASTAttributeNode >> iNCLUDESToken: aSmaCCToken [

	iNCLUDESToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
ASTAttributeNode >> initialize [
	super initialize.
	identTokens := OrderedCollection new: 2.
]

{ #category : #generated }
ASTAttributeNode >> leftBracketToken [

	^ leftBracketToken
]

{ #category : #generated }
ASTAttributeNode >> leftBracketToken: aSmaCCToken [

	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
ASTAttributeNode >> rightBracketToken [

	^ rightBracketToken
]

{ #category : #generated }
ASTAttributeNode >> rightBracketToken: aSmaCCToken [

	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
ASTAttributeNode >> stringToken [

	^ stringToken
]

{ #category : #generated }
ASTAttributeNode >> stringToken: aSmaCCToken [

	stringToken := aSmaCCToken
]

{ #category : #generated }
ASTAttributeNode >> tokenVariables [

	^ #( #leftBracketToken #rightBracketToken #equalToken #stringToken
	     #iNCLUDESToken #dASHMATCHToken )
]
