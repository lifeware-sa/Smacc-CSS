Class {
	#name : #ASTKeyFrameSelectorNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'pERCENTAGEToken'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTKeyFrameSelectorNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitKeyFrameSelector: self
]

{ #category : #generated }
ASTKeyFrameSelectorNode >> pERCENTAGEToken [

	^ pERCENTAGEToken
]

{ #category : #generated }
ASTKeyFrameSelectorNode >> pERCENTAGEToken: aSmaCCToken [

	pERCENTAGEToken := aSmaCCToken
]

{ #category : #generated }
ASTKeyFrameSelectorNode >> tokenVariables [

	^ #( #pERCENTAGEToken )
]
