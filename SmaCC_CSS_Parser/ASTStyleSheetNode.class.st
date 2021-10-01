Class {
	#name : #ASTStyleSheetNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'commentTokens',
		'imports',
		'types',
		'charsetSym',
		'charsetName',
		'semicolonToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTStyleSheetNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitStyleSheet: self
]

{ #category : #generated }
ASTStyleSheetNode >> charsetName [

	^ charsetName
]

{ #category : #generated }
ASTStyleSheetNode >> charsetName: aSmaCCToken [

	charsetName := aSmaCCToken
]

{ #category : #generated }
ASTStyleSheetNode >> charsetSym [

	^ charsetSym
]

{ #category : #generated }
ASTStyleSheetNode >> charsetSym: aSmaCCToken [

	charsetSym := aSmaCCToken
]

{ #category : #generated }
ASTStyleSheetNode >> commentTokens [

	^ commentTokens
]

{ #category : #generated }
ASTStyleSheetNode >> commentTokens: anOrderedCollection [

	commentTokens := anOrderedCollection
]

{ #category : #generated }
ASTStyleSheetNode >> compositeNodeVariables [

	^ #( #imports #types )
]

{ #category : #generated }
ASTStyleSheetNode >> compositeTokenVariables [

	^ #( #commentTokens )
]

{ #category : #generated }
ASTStyleSheetNode >> imports [

	^ imports
]

{ #category : #generated }
ASTStyleSheetNode >> imports: anOrderedCollection [

	self setParents: self imports to: nil.
	imports := anOrderedCollection.
	self setParents: self imports to: self
]

{ #category : #'generated-initialize-release' }
ASTStyleSheetNode >> initialize [
	super initialize.
	commentTokens := OrderedCollection new: 2.
	imports := OrderedCollection new: 2.
	types := OrderedCollection new: 2.
]

{ #category : #generated }
ASTStyleSheetNode >> semicolonToken [

	^ semicolonToken
]

{ #category : #generated }
ASTStyleSheetNode >> semicolonToken: aSmaCCToken [

	semicolonToken := aSmaCCToken
]

{ #category : #generated }
ASTStyleSheetNode >> tokenVariables [

	^ #( #charsetSym #charsetName #semicolonToken )
]

{ #category : #generated }
ASTStyleSheetNode >> types [

	^ types
]

{ #category : #generated }
ASTStyleSheetNode >> types: anOrderedCollection [

	self setParents: self types to: nil.
	types := anOrderedCollection.
	self setParents: self types to: self
]
