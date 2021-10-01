Class {
	#name : #ASTImportNode,
	#superclass : #ASTCSSNode,
	#instVars : [
		'iMPORT_SYMToken',
		'name',
		'semicolonToken',
		'mediaList'
	],
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTImportNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitImport: self
]

{ #category : #generated }
ASTImportNode >> iMPORT_SYMToken [

	^ iMPORT_SYMToken
]

{ #category : #generated }
ASTImportNode >> iMPORT_SYMToken: aSmaCCToken [

	iMPORT_SYMToken := aSmaCCToken
]

{ #category : #generated }
ASTImportNode >> mediaList [

	^ mediaList
]

{ #category : #generated }
ASTImportNode >> mediaList: anASTMediaListNode [

	self mediaList notNil ifTrue: [ self mediaList parent: nil ].
	mediaList := anASTMediaListNode.
	self mediaList notNil ifTrue: [ self mediaList parent: self ]
]

{ #category : #generated }
ASTImportNode >> name [

	^ name
]

{ #category : #generated }
ASTImportNode >> name: aSmaCCToken [

	name := aSmaCCToken
]

{ #category : #generated }
ASTImportNode >> nodeVariables [

	^ #( #mediaList )
]

{ #category : #generated }
ASTImportNode >> semicolonToken [

	^ semicolonToken
]

{ #category : #generated }
ASTImportNode >> semicolonToken: aSmaCCToken [

	semicolonToken := aSmaCCToken
]

{ #category : #generated }
ASTImportNode >> tokenVariables [

	^ #( #iMPORT_SYMToken #name #semicolonToken )
]
