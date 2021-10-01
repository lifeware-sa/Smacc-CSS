Class {
	#name : #ASTUnarySelectorNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'selector'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTUnarySelectorNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitUnarySelector: self
]

{ #category : #generated }
ASTUnarySelectorNode >> otherVariables [

	^ #( #selector )
]

{ #category : #generated }
ASTUnarySelectorNode >> selector [

	^ selector
]

{ #category : #generated }
ASTUnarySelectorNode >> selector: anObject [

	self setParent: self selector to: nil.
	selector := anObject.
	self setParent: self selector to: self
]
