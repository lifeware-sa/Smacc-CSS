Class {
	#name : #ASTMediaRangeValueNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'leftValue',
		'lessThanTokens',
		'equalTokens',
		'rightValue',
		'greaterThanTokens',
		'midValue'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTMediaRangeValueNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitMediaRangeValue: self
]

{ #category : #generated }
ASTMediaRangeValueNode >> compositeTokenVariables [

	^ #( #lessThanTokens #equalTokens #greaterThanTokens )
]

{ #category : #generated }
ASTMediaRangeValueNode >> equalTokens [

	^ equalTokens
]

{ #category : #generated }
ASTMediaRangeValueNode >> equalTokens: anOrderedCollection [

	equalTokens := anOrderedCollection
]

{ #category : #generated }
ASTMediaRangeValueNode >> greaterThanTokens [

	^ greaterThanTokens
]

{ #category : #generated }
ASTMediaRangeValueNode >> greaterThanTokens: anOrderedCollection [

	greaterThanTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
ASTMediaRangeValueNode >> initialize [
	super initialize.
	lessThanTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
]

{ #category : #generated }
ASTMediaRangeValueNode >> leftValue [

	^ leftValue
]

{ #category : #generated }
ASTMediaRangeValueNode >> leftValue: anObject [

	self setParent: self leftValue to: nil.
	leftValue := anObject.
	self setParent: self leftValue to: self
]

{ #category : #generated }
ASTMediaRangeValueNode >> lessThanTokens [

	^ lessThanTokens
]

{ #category : #generated }
ASTMediaRangeValueNode >> lessThanTokens: anOrderedCollection [

	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
ASTMediaRangeValueNode >> midValue [

	^ midValue
]

{ #category : #generated }
ASTMediaRangeValueNode >> midValue: aSmaCCToken [

	midValue := aSmaCCToken
]

{ #category : #generated }
ASTMediaRangeValueNode >> otherVariables [

	^ #( #leftValue #rightValue )
]

{ #category : #generated }
ASTMediaRangeValueNode >> rightValue [

	^ rightValue
]

{ #category : #generated }
ASTMediaRangeValueNode >> rightValue: anObject [

	self setParent: self rightValue to: nil.
	rightValue := anObject.
	self setParent: self rightValue to: self
]

{ #category : #generated }
ASTMediaRangeValueNode >> tokenVariables [

	^ #( #midValue )
]
