Class {
	#name : #ASTMediaConditionNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'leftCondition',
		'booleans',
		'rightConditions'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaConditionNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaCondition: self
]

{ #category : #generated }
ASTMediaConditionNode >> booleans [

	^ booleans
]

{ #category : #generated }
ASTMediaConditionNode >> booleans: anOrderedCollection [

	booleans := anOrderedCollection
]

{ #category : #generated }
ASTMediaConditionNode >> compositeNodeVariables [

	^ #( #rightConditions )
]

{ #category : #generated }
ASTMediaConditionNode >> compositeTokenVariables [

	^ #( #booleans )
]

{ #category : #'generated-initialize-release' }
ASTMediaConditionNode >> initialize [
	super initialize.
	booleans := OrderedCollection new: 2.
	rightConditions := OrderedCollection new: 2.
]

{ #category : #generated }
ASTMediaConditionNode >> leftCondition [

	^ leftCondition
]

{ #category : #generated }
ASTMediaConditionNode >> leftCondition: anASTMediaInParethesesNode [

	self leftCondition notNil ifTrue: [ self leftCondition parent: nil ].
	leftCondition := anASTMediaInParethesesNode.
	self leftCondition notNil ifTrue: [ self leftCondition parent: self ]
]

{ #category : #generated }
ASTMediaConditionNode >> nodeVariables [

	^ #( #leftCondition )
]

{ #category : #generated }
ASTMediaConditionNode >> rightConditions [

	^ rightConditions
]

{ #category : #generated }
ASTMediaConditionNode >> rightConditions: anOrderedCollection [

	self setParents: self rightConditions to: nil.
	rightConditions := anOrderedCollection.
	self setParents: self rightConditions to: self
]
