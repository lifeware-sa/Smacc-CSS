Trait {
	#name : #TASTCSSNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #generated }
TASTCSSNodeVisitor >> visitArgument: anArgument [

	^ self visitCSS: anArgument
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitArgumentList: anArgumentList [

	^ self visitCSS: anArgumentList
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitAttribute: anAttribute [

	^ self visitCSS: anAttribute
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitCSS: aCSS [

	^ self visitSmaCCParseNode: aCSS
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitClass: aClass [

	^ self visitCSS: aClass
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitDeclaration: aDeclaration [

	^ self visitCSS: aDeclaration
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitFontFace: aFontFace [

	^ self visitCSS: aFontFace
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitFunction: aFunction [

	^ self visitCSS: aFunction
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitImport: anImport [

	^ self visitCSS: anImport
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitKeyFrame: aKeyFrame [

	^ self visitCSS: aKeyFrame
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitKeyFrameBlock: aKeyFrameBlock [

	^ self visitCSS: aKeyFrameBlock
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitKeyFrameSelector: aKeyFrameSelector [

	^ self visitCSS: aKeyFrameSelector
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitKeyFrameSelectorList: aKeyFrameSelectorList [

	^ self visitCSS: aKeyFrameSelectorList
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMedia: aMedia [

	^ self visitCSS: aMedia
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaBooleanValue: aMediaBooleanValue [

	^ self visitCSS: aMediaBooleanValue
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaCondition: aMediaCondition [

	^ self visitCSS: aMediaCondition
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaFeature: aMediaFeature [

	^ self visitCSS: aMediaFeature
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaGeneralEnclosedFunction: aMediaGeneralEnclosedFunction [

	^ self visitCSS: aMediaGeneralEnclosedFunction
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaGeneralEnclosedIdentifiers: aMediaGeneralEnclosedIdentifiers [

	^ self visitCSS: aMediaGeneralEnclosedIdentifiers
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaInParetheses: aMediaInParetheses [

	^ self visitCSS: aMediaInParetheses
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaList: aMediaList [

	^ self visitCSS: aMediaList
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaNot: aMediaNot [

	^ self visitCSS: aMediaNot
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaPlainValue: aMediaPlainValue [

	^ self visitCSS: aMediaPlainValue
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaQuery: aMediaQuery [

	^ self visitCSS: aMediaQuery
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaRangeValue: aMediaRangeValue [

	^ self visitCSS: aMediaRangeValue
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitMediaValue: aMediaValue [

	^ self visitCSS: aMediaValue
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitPage: aPage [

	^ self visitCSS: aPage
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitPseudo: aPseudo [

	^ self visitCSS: aPseudo
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitPseudoPageName: aPseudoPageName [

	^ self visitCSS: aPseudoPageName
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitRuleSet: aRuleSet [

	^ self visitCSS: aRuleSet
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitRuleSetSelector: aRuleSetSelector [

	^ self visitCSS: aRuleSetSelector
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitRuleSetSelectorList: aRuleSetSelectorList [

	^ self visitCSS: aRuleSetSelectorList
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitSelector: aSelector [

	^ self visitCSS: aSelector
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitStyleSheet: aStyleSheet [

	^ self visitCSS: aStyleSheet
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitTerm: aTerm [

	^ self visitCSS: aTerm
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitUnarySelector: anUnarySelector [

	^ self visitCSS: anUnarySelector
]

{ #category : #generated }
TASTCSSNodeVisitor >> visitVariable: aVariable [

	^ self visitCSS: aVariable
]
