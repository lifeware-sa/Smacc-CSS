Class {
	#name : #ASTCSSNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
ASTCSSNode >> acceptVisitor: aCSSVisitor [

	^ aCSSVisitor visitCSS: self
]
