Class {
	#name : #ASTFontFaceNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'fONT_FACE_SYMToken',
		'leftBraceToken',
		'semicolonTokens',
		'declarations',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTFontFaceNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitFontFace: self
]

{ #category : #generated }
ASTFontFaceNode >> compositeNodeVariables [

	^ #( #declarations )
]

{ #category : #generated }
ASTFontFaceNode >> compositeTokenVariables [

	^ #( #semicolonTokens )
]

{ #category : #generated }
ASTFontFaceNode >> declarations [

	^ declarations
]

{ #category : #generated }
ASTFontFaceNode >> declarations: anOrderedCollection [

	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
ASTFontFaceNode >> fONT_FACE_SYMToken [

	^ fONT_FACE_SYMToken
]

{ #category : #generated }
ASTFontFaceNode >> fONT_FACE_SYMToken: aSmaCCToken [

	fONT_FACE_SYMToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
ASTFontFaceNode >> initialize [
	super initialize.
	semicolonTokens := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
ASTFontFaceNode >> leftBraceToken [

	^ leftBraceToken
]

{ #category : #generated }
ASTFontFaceNode >> leftBraceToken: aSmaCCToken [

	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTFontFaceNode >> rightBraceToken [

	^ rightBraceToken
]

{ #category : #generated }
ASTFontFaceNode >> rightBraceToken: aSmaCCToken [

	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTFontFaceNode >> semicolonTokens [

	^ semicolonTokens
]

{ #category : #generated }
ASTFontFaceNode >> semicolonTokens: anOrderedCollection [

	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
ASTFontFaceNode >> tokenVariables [

	^ #( #fONT_FACE_SYMToken #leftBraceToken #rightBraceToken )
]
