Class {
	#name : #ASTKeyFrameBlockNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'selectorList',
		'leftBraceToken',
		'semicolonTokens',
		'declarations',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTKeyFrameBlockNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitKeyFrameBlock: self
]

{ #category : #generated }
ASTKeyFrameBlockNode >> compositeNodeVariables [

	^ #( #declarations )
]

{ #category : #generated }
ASTKeyFrameBlockNode >> compositeTokenVariables [

	^ #( #semicolonTokens )
]

{ #category : #generated }
ASTKeyFrameBlockNode >> declarations [

	^ declarations
]

{ #category : #generated }
ASTKeyFrameBlockNode >> declarations: anOrderedCollection [

	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #'generated-initialize-release' }
ASTKeyFrameBlockNode >> initialize [
	super initialize.
	semicolonTokens := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
ASTKeyFrameBlockNode >> leftBraceToken [

	^ leftBraceToken
]

{ #category : #generated }
ASTKeyFrameBlockNode >> leftBraceToken: aSmaCCToken [

	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTKeyFrameBlockNode >> nodeVariables [

	^ #( #selectorList )
]

{ #category : #generated }
ASTKeyFrameBlockNode >> rightBraceToken [

	^ rightBraceToken
]

{ #category : #generated }
ASTKeyFrameBlockNode >> rightBraceToken: aSmaCCToken [

	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTKeyFrameBlockNode >> selectorList [

	^ selectorList
]

{ #category : #generated }
ASTKeyFrameBlockNode >> selectorList: anASTKeyFrameSelectorListNode [

	self selectorList notNil ifTrue: [ self selectorList parent: nil ].
	selectorList := anASTKeyFrameSelectorListNode.
	self selectorList notNil ifTrue: [ self selectorList parent: self ]
]

{ #category : #generated }
ASTKeyFrameBlockNode >> semicolonTokens [

	^ semicolonTokens
]

{ #category : #generated }
ASTKeyFrameBlockNode >> semicolonTokens: anOrderedCollection [

	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
ASTKeyFrameBlockNode >> tokenVariables [

	^ #( #leftBraceToken #rightBraceToken )
]
