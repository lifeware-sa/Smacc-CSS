Class {
	#name : #ASTArgumentNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'exprs'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTArgumentNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitArgument: self
]

{ #category : #generated }
ASTArgumentNode >> compositeNodeVariables [

	^ #( #exprs )
]

{ #category : #generated }
ASTArgumentNode >> exprs [

	^ exprs
]

{ #category : #generated }
ASTArgumentNode >> exprs: anOrderedCollection [

	self setParents: self exprs to: nil.
	exprs := anOrderedCollection.
	self setParents: self exprs to: self
]

{ #category : #'generated-initialize-release' }
ASTArgumentNode >> initialize [
	super initialize.
	exprs := OrderedCollection new: 2.
]
