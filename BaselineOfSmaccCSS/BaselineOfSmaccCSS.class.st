Class {
	#name : #BaselineOfSmaccCSS,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmaccCSS
}

{ #category : #baselines }
BaselineOfSmaccCSS >> baseline: spec [
	<baseline>
	spec for: #common
		do: 
			[spec baseline: 'SmaCC'
				with: [spec repository: 'github://j-brant/SmaCC/src'].
			spec package: 'SmaCC_CSS_Parser' with: [spec requires: 'SmaCC']]
]
