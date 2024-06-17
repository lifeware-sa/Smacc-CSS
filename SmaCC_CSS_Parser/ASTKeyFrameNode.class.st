Class {
	#name : #ASTKeyFrameNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'kEYFRAMES_SYMToken',
		'name',
		'leftBraceToken',
		'keyframeBlocks',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTKeyFrameNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitKeyFrame: self
]

{ #category : #generated }
ASTKeyFrameNode >> compositeNodeVariables [

	^ #( #keyframeBlocks )
]

{ #category : #'generated-initialize-release' }
ASTKeyFrameNode >> initialize [
	super initialize.
	keyframeBlocks := OrderedCollection new: 2.
]

{ #category : #generated }
ASTKeyFrameNode >> keyframeBlocks [

	^ keyframeBlocks
]

{ #category : #generated }
ASTKeyFrameNode >> keyframeBlocks: anOrderedCollection [

	self setParents: self keyframeBlocks to: nil.
	keyframeBlocks := anOrderedCollection.
	self setParents: self keyframeBlocks to: self
]

{ #category : #generated }
ASTKeyFrameNode >> kEYFRAMES_SYMToken [

	^ kEYFRAMES_SYMToken
]

{ #category : #generated }
ASTKeyFrameNode >> kEYFRAMES_SYMToken: aSmaCCToken [

	kEYFRAMES_SYMToken := aSmaCCToken
]

{ #category : #generated }
ASTKeyFrameNode >> leftBraceToken [

	^ leftBraceToken
]

{ #category : #generated }
ASTKeyFrameNode >> leftBraceToken: aSmaCCToken [

	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTKeyFrameNode >> name [

	^ name
]

{ #category : #generated }
ASTKeyFrameNode >> name: aSmaCCToken [

	name := aSmaCCToken
]

{ #category : #generated }
ASTKeyFrameNode >> rightBraceToken [

	^ rightBraceToken
]

{ #category : #generated }
ASTKeyFrameNode >> rightBraceToken: aSmaCCToken [

	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTKeyFrameNode >> tokenVariables [

	^ #( #kEYFRAMES_SYMToken #name #leftBraceToken #rightBraceToken )
]
