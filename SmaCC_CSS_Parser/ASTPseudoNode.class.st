Class {
	#name : #ASTPseudoNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'colonTokens',
		'name',
		'function',
		'rightParenToken',
		'functionArguments'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTPseudoNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitPseudo: self
]

{ #category : #generated }
ASTPseudoNode >> colonTokens [

	^ colonTokens
]

{ #category : #generated }
ASTPseudoNode >> colonTokens: anOrderedCollection [

	colonTokens := anOrderedCollection
]

{ #category : #generated }
ASTPseudoNode >> compositeTokenVariables [

	^ #( #colonTokens )
]

{ #category : #generated }
ASTPseudoNode >> function [

	^ function
]

{ #category : #generated }
ASTPseudoNode >> function: aSmaCCToken [

	function := aSmaCCToken
]

{ #category : #generated }
ASTPseudoNode >> functionArguments [

	^ functionArguments
]

{ #category : #generated }
ASTPseudoNode >> functionArguments: aSmaCCToken [

	functionArguments := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
ASTPseudoNode >> initialize [
	super initialize.
	colonTokens := OrderedCollection new: 2.
]

{ #category : #generated }
ASTPseudoNode >> name [

	^ name
]

{ #category : #generated }
ASTPseudoNode >> name: aSmaCCToken [

	name := aSmaCCToken
]

{ #category : #generated }
ASTPseudoNode >> rightParenToken [

	^ rightParenToken
]

{ #category : #generated }
ASTPseudoNode >> rightParenToken: aSmaCCToken [

	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTPseudoNode >> tokenVariables [

	^ #( #name #function #rightParenToken #functionArguments )
]
