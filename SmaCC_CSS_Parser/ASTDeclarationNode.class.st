Class {
	#name : #ASTDeclarationNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'variable',
		'colonToken',
		'arguments',
		'isImportant'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTDeclarationNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitDeclaration: self
]

{ #category : #generated }
ASTDeclarationNode >> arguments [

	^ arguments
]

{ #category : #generated }
ASTDeclarationNode >> arguments: anASTArgumentListNode [

	self arguments notNil ifTrue: [ self arguments parent: nil ].
	arguments := anASTArgumentListNode.
	self arguments notNil ifTrue: [ self arguments parent: self ]
]

{ #category : #generated }
ASTDeclarationNode >> colonToken [

	^ colonToken
]

{ #category : #generated }
ASTDeclarationNode >> colonToken: aSmaCCToken [

	colonToken := aSmaCCToken
]

{ #category : #generated }
ASTDeclarationNode >> isImportant [

	^ isImportant
]

{ #category : #generated }
ASTDeclarationNode >> isImportant: aSmaCCToken [

	isImportant := aSmaCCToken
]

{ #category : #generated }
ASTDeclarationNode >> nodeVariables [

	^ #( #arguments )
]

{ #category : #generated }
ASTDeclarationNode >> otherVariables [

	^ #( #variable )
]

{ #category : #generated }
ASTDeclarationNode >> tokenVariables [

	^ #( #colonToken #isImportant )
]

{ #category : #generated }
ASTDeclarationNode >> variable [

	^ variable
]

{ #category : #generated }
ASTDeclarationNode >> variable: anObject [

	self setParent: self variable to: nil.
	variable := anObject.
	self setParent: self variable to: self
]
