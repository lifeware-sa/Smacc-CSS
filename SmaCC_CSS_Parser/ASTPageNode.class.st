Class {
	#name : #ASTPageNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'pAGE_SYMToken',
		'leftBraceToken',
		'semicolonTokens',
		'declarations',
		'rightBraceToken',
		'name'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTPageNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitPage: self
]

{ #category : #generated }
ASTPageNode >> compositeNodeVariables [

	^ #( #declarations )
]

{ #category : #generated }
ASTPageNode >> compositeTokenVariables [

	^ #( #semicolonTokens )
]

{ #category : #generated }
ASTPageNode >> declarations [

	^ declarations
]

{ #category : #generated }
ASTPageNode >> declarations: anOrderedCollection [

	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #'generated-initialize-release' }
ASTPageNode >> initialize [
	super initialize.
	semicolonTokens := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
ASTPageNode >> leftBraceToken [

	^ leftBraceToken
]

{ #category : #generated }
ASTPageNode >> leftBraceToken: aSmaCCToken [

	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTPageNode >> name [

	^ name
]

{ #category : #generated }
ASTPageNode >> name: anASTPseudoPageNameNode [

	self name notNil ifTrue: [ self name parent: nil ].
	name := anASTPseudoPageNameNode.
	self name notNil ifTrue: [ self name parent: self ]
]

{ #category : #generated }
ASTPageNode >> nodeVariables [

	^ #( #name )
]

{ #category : #generated }
ASTPageNode >> pAGE_SYMToken [

	^ pAGE_SYMToken
]

{ #category : #generated }
ASTPageNode >> pAGE_SYMToken: aSmaCCToken [

	pAGE_SYMToken := aSmaCCToken
]

{ #category : #generated }
ASTPageNode >> rightBraceToken [

	^ rightBraceToken
]

{ #category : #generated }
ASTPageNode >> rightBraceToken: aSmaCCToken [

	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTPageNode >> semicolonTokens [

	^ semicolonTokens
]

{ #category : #generated }
ASTPageNode >> semicolonTokens: anOrderedCollection [

	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
ASTPageNode >> tokenVariables [

	^ #( #pAGE_SYMToken #leftBraceToken #rightBraceToken )
]
