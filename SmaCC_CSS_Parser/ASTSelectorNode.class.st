Class {
	#name : #ASTSelectorNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'item'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTSelectorNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitSelector: self
]

{ #category : #generated }
ASTSelectorNode >> item [

	^ item
]

{ #category : #generated }
ASTSelectorNode >> item: anASTPseudoNode [

	self item notNil ifTrue: [ self item parent: nil ].
	item := anASTPseudoNode.
	self item notNil ifTrue: [ self item parent: self ]
]

{ #category : #generated }
ASTSelectorNode >> nodeVariables [

	^ #( #item )
]
