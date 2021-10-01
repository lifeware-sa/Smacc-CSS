Class {
	#name : #ASTKeyFrameSelectorListNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'selectors',
		'commaTokens'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTKeyFrameSelectorListNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitKeyFrameSelectorList: self
]

{ #category : #generated }
ASTKeyFrameSelectorListNode >> commaTokens [

	^ commaTokens
]

{ #category : #generated }
ASTKeyFrameSelectorListNode >> commaTokens: anOrderedCollection [

	commaTokens := anOrderedCollection
]

{ #category : #generated }
ASTKeyFrameSelectorListNode >> compositeTokenVariables [

	^ #( #commaTokens )
]

{ #category : #'generated-initialize-release' }
ASTKeyFrameSelectorListNode >> initialize [
	super initialize.
	selectors := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
ASTKeyFrameSelectorListNode >> otherVariables [

	^ #( #selectors )
]

{ #category : #generated }
ASTKeyFrameSelectorListNode >> selectors [

	^ selectors
]

{ #category : #generated }
ASTKeyFrameSelectorListNode >> selectors: anOrderedCollection [

	self setParent: self selectors to: nil.
	selectors := anOrderedCollection.
	self setParent: self selectors to: self
]
