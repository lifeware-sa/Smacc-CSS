Class {
	#name : #CSSScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #'generated-initialization' }
CSSScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(28 'AND' 15) #(28 'FROM' 16) #(28 'NOT' 17) #(28 'ONLY' 18) #(28 'OR' 19) #(28 'TO' 20))
		do: 
			[:each |
			(keywordMap at: each first ifAbsentPut: [Dictionary new]) at: (each at: 2)
				put: each last].
	^keywordMap
]

{ #category : #generated }
CSSScanner >> emptySymbolTokenId [

	^ 127
]

{ #category : #generated }
CSSScanner >> errorTokenId [

	^ 128
]

{ #category : #generated }
CSSScanner >> keywordFor: aString [

	^ aString asUppercase
]

{ #category : #generated }
CSSScanner >> scan1 [
	
	[self step.
	currentCharacter == $/
		ifTrue: 
			[self step.
			currentCharacter == $* ifTrue: [^self scan2].
			^self reportLastMatch].
	('Ii' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Mm' includes: currentCharacter)
				ifTrue: 
					[self step.
					('Pp' includes: currentCharacter)
						ifTrue: 
							[self step.
							('Oo' includes: currentCharacter)
								ifTrue: 
									[self step.
									('Rr' includes: currentCharacter)
										ifTrue: 
											[self step.
											('Tt' includes: currentCharacter)
												ifTrue: 
													[self step.
													('Aa' includes: currentCharacter)
														ifTrue: 
															[self step.
															('Nn' includes: currentCharacter)
																ifTrue: 
																	[self step.
																	('Tt' includes: currentCharacter)
																		ifTrue: [^self recordAndReportMatch: #(43)]]]]]]]].
			^self reportLastMatch].
	currentCharacter isSeparator]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan10 [
	
	[self recordMatch: #(51).
	self step.
	currentCharacter == $% ifTrue: [^self recordAndReportMatch: #(50)].
	currentCharacter isDigit]
			whileTrue.
	^self scan10X1
]

{ #category : #generated }
CSSScanner >> scan10X1 [
	('Cc' includes: currentCharacter) ifTrue: [^self scan11].
	('Dd' includes: currentCharacter) ifTrue: [^self scan12].
	('Ee' includes: currentCharacter) ifTrue: [^self scan13].
	('Gg' includes: currentCharacter) ifTrue: [^self scan14].
	('Hh' includes: currentCharacter) ifTrue: [^self scan16].
	('Ii' includes: currentCharacter) ifTrue: [^self scan17].
	('Kk' includes: currentCharacter) ifTrue: [^self scan18].
	('Mm' includes: currentCharacter) ifTrue: [^self scan19].
	('Pp' includes: currentCharacter) ifTrue: [^self scan20].
	('Rr' includes: currentCharacter) ifTrue: [^self scan15].
	('Ss' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(48)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan11 [
	self step.
	('Mm' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(46)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan12 [
	self step.
	('Ee' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Gg' includes: currentCharacter)
				ifTrue: [^self recordAndReportMatch: #(47)]].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan13 [
	self step.
	('Mm' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(44)].
	('Xx' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(45)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan14 [
	self step.
	('Rr' includes: currentCharacter) ifTrue: [^self scan15].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan15 [
	self step.
	('Aa' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Dd' includes: currentCharacter)
				ifTrue: [^self recordAndReportMatch: #(47)]].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan16 [
	self step.
	('Zz' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(49)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan17 [
	self step.
	('Nn' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(46)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan18 [
	self step.
	('Hh' includes: currentCharacter) ifTrue: [^self scan16].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan19 [
	self step.
	('Mm' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(46)].
	('Ss' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(48)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan2 [
	
	[self step.
	currentCharacter == $*
		ifTrue: 
			[
			[self step.
			currentCharacter == $*] whileTrue.
			currentCharacter == $/ ifTrue: [^self scan1].
			^self scan2].
	true]
			whileTrue
]

{ #category : #generated }
CSSScanner >> scan20 [
	self step.
	('CTXctx' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(46)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan21 [
	
	[self recordMatch: #(51).
	self step.
	currentCharacter == $% ifTrue: [^self recordAndReportMatch: #(50)].
	currentCharacter == $. ifTrue: [^self scan9].
	currentCharacter isDigit]
			whileTrue.
	^self scan21X1
]

{ #category : #generated }
CSSScanner >> scan21X1 [
	('Cc' includes: currentCharacter) ifTrue: [^self scan11].
	('Dd' includes: currentCharacter) ifTrue: [^self scan12].
	('Ee' includes: currentCharacter) ifTrue: [^self scan13].
	('Gg' includes: currentCharacter) ifTrue: [^self scan14].
	('Hh' includes: currentCharacter) ifTrue: [^self scan16].
	('Ii' includes: currentCharacter) ifTrue: [^self scan17].
	('Kk' includes: currentCharacter) ifTrue: [^self scan18].
	('Mm' includes: currentCharacter) ifTrue: [^self scan19].
	('Pp' includes: currentCharacter) ifTrue: [^self scan20].
	('Rr' includes: currentCharacter) ifTrue: [^self scan15].
	('Ss' includes: currentCharacter)
		ifTrue: [^self recordAndReportMatch: #(48)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan22 [
	
	[self recordMatch: #(28).
	self step.
	currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(42)].
	currentCharacter == $\ ifTrue: [^self scan23].
	currentCharacter == $- or: 
			[(currentCharacter between: $0 and: $9) or: 
					[(currentCharacter between: $A and: $Z)
						or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]]]]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan23 [
	self step.
	^self scan22
]

{ #category : #generated }
CSSScanner >> scan24 [
	
	[self step.
	currentCharacter == $*
		ifTrue: 
			[
			[self step.
			currentCharacter == $*] whileTrue.
			currentCharacter == $/ ifTrue: [^self recordAndReportMatch: #(27)].
			^self scan24].
	true]
			whileTrue
]

{ #category : #generated }
CSSScanner >> scan25 [
	self step.
	currentCharacter == $-
		ifTrue: 
			[self step.
			('Ww' includes: currentCharacter)
				ifTrue: 
					[self step.
					('Ee' includes: currentCharacter)
						ifTrue: 
							[self step.
							('Bb' includes: currentCharacter)
								ifTrue: 
									[self step.
									('Kk' includes: currentCharacter)
										ifTrue: 
											[self step.
											('Ii' includes: currentCharacter)
												ifTrue: 
													[self step.
													('Tt' includes: currentCharacter)
														ifTrue: 
															[self step.
															currentCharacter == $-
																ifTrue: 
																	[self step.
																	('Kk' includes: currentCharacter) ifTrue: [^self scan26]]]]]]]].
			^self reportLastMatch].
	('Cc' includes: currentCharacter) ifTrue: [^self scan25X2].
	('Ff' includes: currentCharacter) ifTrue: [^self scan25X1].
	('Ii' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Mm' includes: currentCharacter)
				ifTrue: 
					[self step.
					('Pp' includes: currentCharacter)
						ifTrue: 
							[self step.
							('Oo' includes: currentCharacter)
								ifTrue: 
									[self step.
									('Rr' includes: currentCharacter)
										ifTrue: 
											[self step.
											('Tt' includes: currentCharacter)
												ifTrue: [^self recordAndReportMatch: #(34)]]]]].
			^self reportLastMatch].
	('Kk' includes: currentCharacter) ifTrue: [^self scan26].
	('Mm' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Ee' includes: currentCharacter)
				ifTrue: 
					[self step.
					('Dd' includes: currentCharacter)
						ifTrue: 
							[self step.
							('Ii' includes: currentCharacter)
								ifTrue: 
									[self step.
									('Aa' includes: currentCharacter)
										ifTrue: [^self recordAndReportMatch: #(36)]]]].
			^self reportLastMatch].
	('Pp' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Aa' includes: currentCharacter)
				ifTrue: 
					[self step.
					('Gg' includes: currentCharacter)
						ifTrue: 
							[self step.
							('Ee' includes: currentCharacter)
								ifTrue: [^self recordAndReportMatch: #(35)]]]].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan25X1 [
	self step.
	('Oo' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Nn' includes: currentCharacter)
				ifTrue: 
					[self step.
					('Tt' includes: currentCharacter)
						ifTrue: 
							[self step.
							currentCharacter == $-
								ifTrue: 
									[self step.
									('Ff' includes: currentCharacter)
										ifTrue: 
											[self step.
											('Aa' includes: currentCharacter)
												ifTrue: 
													[self step.
													('Cc' includes: currentCharacter)
														ifTrue: 
															[self step.
															('Ee' includes: currentCharacter)
																ifTrue: [^self recordAndReportMatch: #(37)]]]]]]]].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan25X2 [
	self step.
	('Hh' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Aa' includes: currentCharacter)
				ifTrue: 
					[self step.
					('Rr' includes: currentCharacter)
						ifTrue: 
							[self step.
							('Ss' includes: currentCharacter)
								ifTrue: 
									[self step.
									('Ee' includes: currentCharacter)
										ifTrue: 
											[self step.
											('Tt' includes: currentCharacter)
												ifTrue: 
													[self step.
													currentCharacter == Character space
														ifTrue: [^self recordAndReportMatch: #(31)]]]]]]].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan26 [
	self step.
	('Ee' includes: currentCharacter)
		ifTrue: 
			[self step.
			('Yy' includes: currentCharacter)
				ifTrue: 
					[self step.
					('Ff' includes: currentCharacter)
						ifTrue: 
							[self step.
							('Rr' includes: currentCharacter)
								ifTrue: 
									[self step.
									('Aa' includes: currentCharacter)
										ifTrue: 
											[self step.
											('Mm' includes: currentCharacter)
												ifTrue: 
													[self step.
													('Ee' includes: currentCharacter)
														ifTrue: 
															[self step.
															('Ss' includes: currentCharacter)
																ifTrue: [^self recordAndReportMatch: #(38)]]]]]]]].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan27 [
	
	[self step.
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(30)].
	currentCharacter == $\ ifTrue: [^self scan29].
	currentCharacter isSeparator ifTrue: [^self scan28].
	currentCharacter == $! or: 
			[(currentCharacter between: $# and: $&)
				or: [currentCharacter between: $* and: $~]]]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan28 [
	
	[self step.
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(30)].
	currentCharacter isSeparator]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan29 [
	
	[self step.
	currentCharacter == $)
		ifTrue: 
			[self recordMatch: #(30).
			self step.
			currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(30)].
			currentCharacter == $\ ifTrue: [^self scan29].
			currentCharacter isSeparator ifTrue: [^self scan28].
			(currentCharacter == $! or: 
					[(currentCharacter between: $# and: $&)
						or: [currentCharacter between: $* and: $~]])
				ifTrue: [^self scan27].
			^self reportLastMatch].
	currentCharacter == $\]
			whileTrue.
	^self scan27
]

{ #category : #generated }
CSSScanner >> scan3 [
	
	[self step.
	currentCharacter == $" ifTrue: [^self recordAndReportMatch: #(29)].
	currentCharacter == $\ ifTrue: [^self scan4].
	currentCharacter <= Character tab or: 
			[currentCharacter == Character pageUp
				or: [currentCharacter >= (Character value: 14)]]]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan30 [
	
	[self step.
	currentCharacter == $" ifTrue: [^self scan28].
	currentCharacter == $\ ifTrue: [^self scan31].
	currentCharacter <= Character tab or: 
			[currentCharacter == Character pageUp
				or: [currentCharacter >= (Character value: 14)]]]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan31 [
	self step.
	currentCharacter == Character cr
		ifTrue: 
			[self step.
			currentCharacter == $" ifTrue: [^self scan28].
			currentCharacter == $\ ifTrue: [^self scan31].
			(currentCharacter <= Character pageUp
				or: [currentCharacter >= (Character value: 14)]) ifTrue: [^self scan30].
			^self reportLastMatch].
	^self scan30
]

{ #category : #generated }
CSSScanner >> scan32 [
	
	[self step.
	currentCharacter == $' ifTrue: [^self scan28].
	currentCharacter == $\ ifTrue: [^self scan33].
	currentCharacter <= Character tab or: 
			[currentCharacter == Character pageUp
				or: [currentCharacter >= (Character value: 14)]]]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan33 [
	self step.
	currentCharacter == Character cr
		ifTrue: 
			[self step.
			currentCharacter == $' ifTrue: [^self scan28].
			currentCharacter == $\ ifTrue: [^self scan33].
			(currentCharacter <= Character pageUp
				or: [currentCharacter >= (Character value: 14)]) ifTrue: [^self scan32].
			^self reportLastMatch].
	^self scan32
]

{ #category : #generated }
CSSScanner >> scan4 [
	self step.
	currentCharacter == Character cr
		ifTrue: 
			[self step.
			currentCharacter == $" ifTrue: [^self recordAndReportMatch: #(29)].
			currentCharacter == $\ ifTrue: [^self scan4].
			(currentCharacter <= Character pageUp
				or: [currentCharacter >= (Character value: 14)]) ifTrue: [^self scan3].
			^self reportLastMatch].
	^self scan3
]

{ #category : #generated }
CSSScanner >> scan5 [
	
	[self recordMatch: #(39).
	self step.
	currentCharacter == $\ ifTrue: [^self scan6].
	currentCharacter == $- or: 
			[(currentCharacter between: $0 and: $9) or: 
					[(currentCharacter between: $A and: $Z)
						or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]]]]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan6 [
	self step.
	^self scan5
]

{ #category : #generated }
CSSScanner >> scan7 [
	
	[self step.
	currentCharacter == $' ifTrue: [^self recordAndReportMatch: #(29)].
	currentCharacter == $\ ifTrue: [^self scan8].
	currentCharacter <= Character tab or: 
			[currentCharacter == Character pageUp
				or: [currentCharacter >= (Character value: 14)]]]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scan8 [
	self step.
	currentCharacter == Character cr
		ifTrue: 
			[self step.
			currentCharacter == $' ifTrue: [^self recordAndReportMatch: #(29)].
			currentCharacter == $\ ifTrue: [^self scan8].
			(currentCharacter <= Character pageUp
				or: [currentCharacter >= (Character value: 14)]) ifTrue: [^self scan7].
			^self reportLastMatch].
	^self scan7
]

{ #category : #generated }
CSSScanner >> scan9 [
	self step.
	currentCharacter isDigit ifTrue: [^self scan10].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForToken [
	self step.
	currentCharacter == $! ifTrue: [^self scan1].
	currentCharacter == $" ifTrue: [^self scan3].
	currentCharacter == $# ifTrue: [^self scanForTokenX3].
	currentCharacter == $' ifTrue: [^self scan7].
	currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(1)].
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(2)].
	currentCharacter == $* ifTrue: [^self recordAndReportMatch: #(3)].
	currentCharacter == $+ ifTrue: [^self scanForTokenX5].
	currentCharacter == $, ifTrue: [^self recordAndReportMatch: #(5)].
	^self scanForTokenX12
]

{ #category : #generated }
CSSScanner >> scanForTokenX1 [
	self recordMatch: #(28).
	self step.
	currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(42)].
	currentCharacter == $\ ifTrue: [^self scan23].
	('Rr' includes: currentCharacter)
		ifTrue: 
			[self recordMatch: #(28).
			self step.
			currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(42)].
			currentCharacter == $\ ifTrue: [^self scan23].
			('Ll' includes: currentCharacter)
				ifTrue: 
					[self recordMatch: #(28).
					self step.
					currentCharacter == $( ifTrue: [^self scanForTokenX1X1].
					currentCharacter == $\ ifTrue: [^self scan23]]].
	(currentCharacter == $- or: 
			[(currentCharacter between: $0 and: $9) or: 
					[(currentCharacter between: $A and: $Z)
						or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]]])
		ifTrue: [^self scan22].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX10 [
	self recordMatch: #(8).
	self step.
	currentCharacter isDigit ifTrue: [^self scan10].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX11 [
	currentCharacter == ${ ifTrue: [^self recordAndReportMatch: #(23)].
	currentCharacter == $| ifTrue: [^self scanForTokenX9].
	currentCharacter == $} ifTrue: [^self recordAndReportMatch: #(24)].
	currentCharacter == $~ ifTrue: [^self scanForTokenX7].
	currentCharacter isDigit ifTrue: [^self scan21].
	('Uu' includes: currentCharacter) ifTrue: [^self scanForTokenX1].
	(currentCharacter isSeparator or: [currentCharacter == Character pageUp])
		ifTrue: [^self scanForTokenX6].
	((currentCharacter between: $A and: $Z)
		or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]])
			ifTrue: [^self scan22].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX12 [
	currentCharacter == $- ifTrue: [^self scanForTokenX2].
	currentCharacter == $. ifTrue: [^self scanForTokenX10].
	currentCharacter == $/ ifTrue: [^self scanForTokenX8].
	currentCharacter == $: ifTrue: [^self recordAndReportMatch: #(10)].
	currentCharacter == $; ifTrue: [^self recordAndReportMatch: #(11)].
	currentCharacter == $< ifTrue: [^self scanForTokenX4].
	currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(13)].
	currentCharacter == $> ifTrue: [^self recordAndReportMatch: #(14)].
	currentCharacter == $@ ifTrue: [^self scan25].
	currentCharacter == $[ ifTrue: [^self recordAndReportMatch: #(21)].
	currentCharacter == $\ ifTrue: [^self scan23].
	currentCharacter == $] ifTrue: [^self recordAndReportMatch: #(22)].
	^self scanForTokenX11
]

{ #category : #generated }
CSSScanner >> scanForTokenX1X1 [
	self recordMatch: #(42).
	self step.
	currentCharacter == $" ifTrue: [^self scan30].
	currentCharacter == $' ifTrue: [^self scan32].
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(30)].
	currentCharacter == $\ ifTrue: [^self scan29].
	currentCharacter isSeparator
		ifTrue: 
			[
			[self step.
			currentCharacter == $" ifTrue: [^self scan30].
			currentCharacter == $' ifTrue: [^self scan32].
			currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(30)].
			currentCharacter == $\ ifTrue: [^self scan29].
			currentCharacter isSeparator]
					whileTrue].
	((currentCharacter between: $! and: $&)
		or: [currentCharacter between: $* and: $~]) ifTrue: [^self scan27].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX2 [
	self recordMatch: #(6).
	self step.
	currentCharacter == $-
		ifTrue: 
			[self recordMatch: #(7).
			self step.
			currentCharacter == $> ifTrue: [^self recordAndReportMatch: #(33)].
			^self reportLastMatch].
	currentCharacter == $. ifTrue: [^self scan9].
	currentCharacter == $\ ifTrue: [^self scan23].
	currentCharacter isDigit ifTrue: [^self scan21].
	((currentCharacter between: $A and: $Z)
		or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]])
			ifTrue: [^self scan22].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX3 [
	self step.
	currentCharacter == $\ ifTrue: [^self scan6].
	(currentCharacter == $- or: 
			[(currentCharacter between: $0 and: $9) or: 
					[(currentCharacter between: $A and: $Z)
						or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]]])
		ifTrue: [^self scan5].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX4 [
	self recordMatch: #(12).
	self step.
	currentCharacter == $!
		ifTrue: 
			[(self scanForString: '--') ifTrue: [^self recordAndReportMatch: #(32)]].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX5 [
	self recordMatch: #(4).
	self step.
	currentCharacter == $. ifTrue: [^self scan9].
	currentCharacter isDigit ifTrue: [^self scan21].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX6 [
	
	[self recordMatch: #(26).
	self step.
	currentCharacter isSeparator or: [currentCharacter == Character pageUp]]
			whileTrue.
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX7 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(41)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX8 [
	self recordMatch: #(9).
	self step.
	currentCharacter == $* ifTrue: [^self scan24].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> scanForTokenX9 [
	self step.
	currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(40)].
	^self reportLastMatch
]

{ #category : #generated }
CSSScanner >> tokenActions [

	^ #( nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil
	     nil nil nil nil nil nil nil nil nil #whitespace #comment )
]

{ #category : #generated }
CSSScanner >> tokenClass [
	^SmaCCCaseInsensitiveToken
]
