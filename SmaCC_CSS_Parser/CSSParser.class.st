Class {
	#name : #CSSParser,
	#superclass : #SmaCCParser,
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #'generated-accessing' }
CSSParser class >> cacheId [
	^'2021-10-01T16:15:06.021+02:00'
]

{ #category : #generated }
CSSParser class >> definitionComment [
"%ignorecase;
%annotate_tokens;
%root CSS;
%prefix AST;
%suffix Node;
%ignore_variables mediaSymToken;

<whitespace> : \s+;
<comment> : \/\*[^*]*\*+([^/*][^*]*\*+)*\/;

<unicode>:  \\[0-9a-f]{1,6} ;
<escape> :  <unicode>|\\[^0-9a-f];
<nmstart> :  [_a-z]|<escape>;
<nmchar> :  [_a-z0-9\-]|<escape>;
<string1> :  ""([^\n\r\f\\""]|\\<nl>|<escape>)*\"";
<string2> :  \'([^\n\r\f\\']|\\<nl>|<escape>)*\';
<badstring1> :  \""([^\n\r\f\\""]|\\<nl>|<escape>)*\\?;
<badstring2> :  \'([^\n\r\f\\']|\\<nl>|<escape>)*\\?;
<badcomment1> :  \/\*[^*]*\*+([^/*][^*]*\*+)*;
<badcomment2> :  \/\*[^*]*(\*+[^/*][^*]*)*;
<baduri1> :  url\(<w>([!#$%&*-\[\]-~]|<escape>)*<w>;
<baduri2> :  url\(<w><string><w>;
<baduri3> :  url\(<w><badstring>;
<comment2> :  \/\*[^*]*\*+([^/*][^*]*\*+)*\/;
<ident> : \-?<nmstart><nmchar>*;
<name> :  <nmchar>+;
<num> :  ([0-9]*\.)?[0-9]+;
<string> :  <string1>|<string2>;
<badstring> :  <badstring1>|<badstring2>;
<badcomment> :  <badcomment1>|<badcomment2>;
<baduri> :  <baduri1>|<baduri2>|<baduri3>;
<url> :  ([!#$%&*-~]|<escape>)*;
<s> : \t\r\n\f]+ \[;
<w> :  <s>?;
<nl> :  \n|\r\n|\r|\f;
<sign> : (\-|+)? ;

<uri> : url\(<w><string><w>\) | url\(<w><url><w>\) ;

<CHARSET_SYM> : @charset[ ];
<CDO> : \<!\-\-;
<CDC> : \-\-\>;
<IMPORT_SYM> : @import;
<PAGE_SYM> : @page ;
<MEDIA_SYM> : @media	;
<FONT_FACE_SYM> : @font\-face	;
<KEYFRAMES_SYM> : @\-webkit\-keyframes | @keyframes ;

<HASH> : \#<name> ;

<DASHMATCH> : \|= ;

<INCLUDES> : \~= ;
<FUNCTION> : <ident>\(;
<IMPORTANT_SYM> : !(<w>|<comment2>)*!important ;

<EMS> : <sign><num>em ; 
<EXS> : <sign><num>ex ; 
<LENGTH> : <sign><num>(px|cm|mm|in|pt|pc) ; 
<ANGLE> : <sign><num>(deg|rad|grad) ; 
<TIME> : <sign><num>(ms|s) ; 
<FREQ> : <sign><num>(hz|khz) ; 
<DIMENSION> : <sign><num><ident> ; 

<PERCENTAGE> : <sign><num>\% ; 
<NUMBER> : <sign><num> ; 

%left ""["" "":"" ""."" <HASH> ""{"";



stylesheet
  : ( <CHARSET_SYM> 'charsetSym' <string> 'charsetName' "";"" )?
    (<CDO>  'commentToken' |<CDC>  'commentToken')* ( import 'import' ( <CDO> 'commentToken' | <CDC> 'commentToken'  )* )*
    ( ( ruleset 'type' | media 'type' | page 'type' | font_face 'type' | keyframes 'type' ) ( <CDO>   'commentToken' | <CDC>  'commentToken' )* )* {{StyleSheet}}
  ;
  
import
  : <IMPORT_SYM> (<string> 'name'|<uri> 'name') media_list 'mediaList' ? "";""  {{Import}}
  ;
  
media
  : <MEDIA_SYM> 'mediaSym' media_query 'query'(("","") media_query 'query')* ""{""  (ruleset 'rule' | media 'rule')* ""}""  {{Media}}
  ;
  
media_query
  : ( media_condition 'condition'
     | ( ""not"" | ""only"" )? <ident> 'identifier' ( ""and"" media_condition 'condition')?)  {{MediaQuery}}
  ;

media_condition
  : media_not 'not' | media_in_parens 'leftCondition' ( ( ""and"" 'boolean' | ""or"" 'boolean'  ) media_in_parens 'rightCondition' )* {{MediaCondition}}
  ;

media_not
  : ""not"" media_in_parens 'value' {{MediaNot}}
  ;

media_in_parens
  : ((""("" media_condition 'condition' "")"" ) | media_feature 'feature' | general_enclosed 'generalEnclosed') {{MediaInParetheses}}
  ;

media_feature
  : ""("" ( mf_plain 'value' | mf_boolean 'value' | mf_range 'value' ) "")"" {{MediaFeature}}
  ;

mf_plain
  : <ident> 'key' "":"" mf_value 'value' {{MediaPlainValue}}
  ;

mf_boolean
  : <ident> {{MediaBooleanValue}}
  ;
  
mf_range
  : ( <ident> 'leftValue'  (""<"" ""=""? | "">"" ""=""? | ""="") mf_value 'rightValue'
     | mf_value 'leftValue' (""<"" ""=""? | "">"" ""=""? | ""="") <ident> 'rightValue'
     | mf_value 'leftValue' ""<"" ""=""? <ident> 'midValue' ""<"" ""=""? mf_value 'rightValue'
     | mf_value 'leftValue' "">"" ""=""? <ident> 'midValue'  "">"" ""=""? mf_value  'rightValue' ) {{MediaRangeValue}}
  ;

mf_value
  :  <PERCENTAGE>  | <LENGTH> | <EMS>  | <EXS>  | <ANGLE>  | <TIME>  | <FREQ> | <NUMBER>  {{MediaValue}}
  ;

general_enclosed
  : ( <FUNCTION> 'functionName' <ident>  'identifierRight' "")"" )  {{MediaGeneralEnclosedFunction}} | ""("" <ident> 'identifierLeft' <ident> 'identifierRight' "")""  {{MediaGeneralEnclosedIdentifiers}}
  ;
  
media_list
  : medium ( ("","") ?  medium)*  {{MediaList}}
  ;
  
medium
  : <ident> 
  ;
  
page
  : <PAGE_SYM>  pseudo_page 'name' ?
    ""{""  declaration 'declaration' ? ( "";""  declaration 'declaration' ? )* ""}""  {{Page}}
  ;
  
keyframes
  : <KEYFRAMES_SYM> keyframes_name 'name'
    ""{""   keyframe_block 'keyframeBlock' * ""}""  {{KeyFrame}}
  ;

keyframes_name
  : <ident> | <string>
  ;
  

keyframe_block 
  : keyframe_selector_list 'selectorList' ""{""  declaration 'declaration' ? ( "";""  declaration 'declaration' ? )* ""}""  {{KeyFrameBlock}}
  ;
  
keyframe_selector_list
  : keyframe_selector 'selector' ("","" keyframe_selector 'selector' )*  {{KeyFrameSelectorList}}
  ;

keyframe_selector
  : ""from"" | ""to"" | <PERCENTAGE> {{KeyFrameSelector}}
  ;
  
font_face
  : <FONT_FACE_SYM>  
    ""{""  declaration 'declaration' ? ( "";""  declaration 'declaration' ? )* ""}""  {{FontFace}}
  ;

pseudo_page
  : "":"" <ident> {{PseudoPageName}}
  ;
  
operator
  : ""/""  | ""*"" | ""-""
  ;
  
combinator
  : ""+"" 
  | "">"" 
  | ""~"" 
  ;
  
unary_operator
  : ""-"" | ""+""
  ;
  
ruleset
  : selector 'selector' ( "",""  selector 'selector' )*
    ""{""  declaration 'declaration' ? ( "";""  declaration 'declaration' ? )* ""}""  {{RuleSet}}
  ;
  
selector
  : simple_selector 'leftSelector' (combinator 'combinator' ?  selector 'rightSelector' )? {{RuleSetSelectorList}}
  ;
  
simple_selector
  : unary_selector 'unarySelector' (simple_selector_list 'selector')* {{RuleSetSelector}}
  ;

unary_selector
  : (<ident>  'selector'
  | ""*""  'selector'
  | simple_selector_list 'selector')  {{UnarySelector}}
  ;
  
simple_selector_list
  :  <HASH> 'item' | class 'item' | attrib 'item' | pseudo  'item' {{Selector}}
  ;
  
class
  : ""."" <ident> {{Class}}
  ;
  
attrib
  : ""[""  <ident>  ( ( ""="" | <INCLUDES> | <DASHMATCH> ) ( <ident> | <string> )  )? ""]"" {{Attribute}}
  ;
  
pseudo
  : "":"" "":""? ( <ident> 'name' | (<FUNCTION> 'function'  (<ident>  'functionArguments' )? "")"") ) {{Pseudo}}
  ;
  
declaration
  : ( variable 'variable' | <ident> 'variable') "":""  args_list 'arguments' <IMPORTANT_SYM> 'isImportant' ?  {{Declaration}}
  ;

variable
  : ""--"" <ident>  {{Variable}}
  ;
  
args_list
  : arg 'arg' ("","" arg 'arg' ?)*  {{ArgumentList}}
  ;
  
arg
  : expr 'expr' +  {{Argument}}
  ;

expr
  : term 'term' ( operator 'operator' term 'term' )*  {{Term}}
  ;
  
term
  : variable 
  | <NUMBER>  | <PERCENTAGE>  | <LENGTH>  | <EMS>  | <EXS>  | <ANGLE>  | <TIME>  | <FREQ>  
  | <string>
  | <ident>  
  | <uri>  
  | <HASH> 
  | function
  ;
  
function
  : <FUNCTION> 'functionName' args_list 'argumentList' "")""  {{Function}}
  ;"
]

{ #category : #generated }
CSSParser class >> reduceTable [
^#(
	#(55 0 #reduceActionFor__CDO____commentToken____CDC____commentToken___1: 1973249 false) 
	#(57 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 2022401 false) 
	#(54 1 #liftFirstValue: 1973249 false) 
	#(54 1 #liftFirstValue: 1973250 false) 
	#(55 2 #reduceActionFor__CDO____commentToken____CDC____commentToken___2: 1973250 false) 
	#(61 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 2099201 false) 
	#(57 2 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________2: 2022402 false) 
	#(53 3 #reduceActionForstylesheet1: 1893377 false) 
	#(59 0 #reduceActionFor__CDO____commentToken____CDC____commentToken___1: 2040833 false) 
	#(110 1 #reduceActionForunary_selector2: 5525506 false) 
	#(110 1 #reduceActionForunary_selector2: 5525505 false) 
	#(111 1 #liftFirstValue: 5651457 false) 
	#(61 2 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________2: 2099202 false) 
	#(63 0 #reduceActionFor__CDO____commentToken____CDC____commentToken___1: 2189313 false) 
	#(105 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 5145601 false) 
	#(106 1 #reduceActionForselector1: 5277697 false) 
	#(109 0 #reduceActionFor__CDO____commentToken____CDC____commentToken___1: 5464065 false) 
	#(110 1 #reduceActionForunary_selector2: 5525507 false) 
	#(111 1 #liftFirstValue: 5651458 false) 
	#(111 1 #liftFirstValue: 5651459 false) 
	#(111 1 #reduceActionForsimple_selector_list4: 5651460 false) 
	#(56 2 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken_______1: 2022401 false) 
	#(64 3 #reduceActionForimport1: 2268161 false) 
	#(86 1 #liftFirstValue: 4096001 false) 
	#(85 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 4052993 false) 
	#(64 3 #reduceActionForimport1: 2268163 false) 
	#(112 2 #reduceActionForclass1: 5762049 false) 
	#(114 2 #reduceActionForpseudo1: 5918721 false) 
	#(89 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 4204545 false) 
	#(70 1 #reduceActionFormedia_query2: 2518018 false) 
	#(67 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 2426881 false) 
	#(70 1 #reduceActionFormedia_query1: 2518017 false) 
	#(71 1 #liftFirstValue: 2675713 false) 
	#(73 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 2747393 false) 
	#(75 1 #reduceActionFormedia_in_parens2: 2913282 false) 
	#(75 1 #reduceActionFormedia_in_parens3: 2913283 false) 
	#(92 1 #liftFirstValue: 4385793 false) 
	#(92 1 #liftFirstValue: 4385794 false) 
	#(60 2 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken_______1: 2099202 false) 
	#(60 2 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken_______1: 2099203 false) 
	#(60 2 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken_______1: 2099205 false) 
	#(60 2 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken_______1: 2099204 false) 
	#(60 2 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken_______1: 2099201 false) 
	#(101 1 #liftFirstValue: 5029889 false) 
	#(101 1 #liftFirstValue: 5029890 false) 
	#(101 1 #liftFirstValue: 5029891 false) 
	#(106 2 #reduceActionForselector2: 5277698 false) 
	#(107 2 #reduceActionForsimple_selector1: 5411841 false) 
	#(58 1 #liftFirstValue: 2040833 false) 
	#(58 1 #liftFirstValue: 2040834 false) 
	#(59 2 #reduceActionFor__CDO____commentToken____CDC____commentToken___2: 2040834 false) 
	#(53 6 #reduceActionForstylesheet2: 1893378 false) 
	#(64 4 #reduceActionForimport2: 2268162 false) 
	#(83 2 #reduceActionFormedia_list1: 4030465 false) 
	#(64 4 #reduceActionForimport2: 2268164 false) 
	#(114 3 #reduceActionForpseudo4: 5918724 false) 
	#(114 3 #reduceActionForpseudo2: 5918722 false) 
	#(113 3 #reduceActionForattrib1: 5801985 false) 
	#(99 2 #reduceActionForpseudo_page1: 4936705 false) 
	#(78 1 #reduceActionFormf_boolean1: 3254273 false) 
	#(81 1 #liftFirstValue: 3682307 false) 
	#(81 1 #liftFirstValue: 3682308 false) 
	#(81 1 #liftFirstValue: 3682306 false) 
	#(81 1 #liftFirstValue: 3682309 false) 
	#(81 1 #liftFirstValue: 3682310 false) 
	#(81 1 #liftFirstValue: 3682311 false) 
	#(81 1 #liftFirstValue: 3682305 false) 
	#(81 1 #reduceActionFormf_value8: 3682312 false) 
	#(70 2 #reduceActionFormedia_query4: 2518020 false) 
	#(74 2 #reduceActionFormedia_not1: 2849793 false) 
	#(70 2 #reduceActionFormedia_query6: 2518022 false) 
	#(71 2 #reduceActionFormedia_condition2: 2675714 false) 
	#(91 0 #reduceActionFor__CDO____commentToken____CDC____commentToken___1: 4328449 false) 
	#(62 1 #liftFirstValue: 2189313 false) 
	#(62 1 #liftFirstValue: 2189314 false) 
	#(63 2 #reduceActionFor__CDO____commentToken____CDC____commentToken___2: 2189314 false) 
	#(105 2 #reduceActionFor_______selector__selector____2: 5145602 false) 
	#(106 3 #reduceActionForselector3: 5277699 false) 
	#(109 2 #reduceActionFor__CDO____commentToken____CDC____commentToken___2: 5464066 false) 
	#(108 1 #liftFirstValue: 5464065 false) 
	#(85 2 #reduceActionFor___________medium__2: 4052994 false) 
	#(84 1 #reduceActionFor___________medium_1: 4052993 false) 
	#(114 4 #reduceActionForpseudo5: 5918725 false) 
	#(114 4 #reduceActionForpseudo3: 5918723 false) 
	#(116 2 #reduceActionForvariable1: 6187009 false) 
	#(88 1 #reduceActionFor___________medium_1: 4204545 false) 
	#(87 4 #reduceActionForpage1: 4123649 false) 
	#(89 2 #reduceActionFor_______selector__selector____2: 4204546 false) 
	#(80 0 #nil 3349505 false) 
	#(75 3 #reduceActionFormedia_in_parens1: 2913281 false) 
	#(76 3 #reduceActionFormedia_feature1: 3067905 false) 
	#(76 3 #reduceActionFormedia_feature1: 3067906 false) 
	#(76 3 #reduceActionFormedia_feature1: 3067907 false) 
	#(70 3 #reduceActionFormedia_query3: 2518019 false) 
	#(82 3 #reduceActionForgeneral_enclosed1: 3804161 false) 
	#(69 0 #reduceActionFor__CDO____commentToken____CDC____commentToken___1: 2461697 false) 
	#(67 2 #reduceActionFor_______selector__selector____2: 2426882 false) 
	#(73 2 #reduceActionFor_______selector__selector____2: 2747394 false) 
	#(98 4 #reduceActionForfont_face1: 4803585 false) 
	#(104 2 #reduceActionFor_______selector__selector___1: 5145601 false) 
	#(84 2 #reduceActionFor___________medium_2: 4052994 false) 
	#(114 5 #reduceActionForpseudo6: 5918726 false) 
	#(113 5 #reduceActionForattrib2: 5801986 false) 
	#(113 5 #reduceActionForattrib3: 5801987 false) 
	#(113 5 #reduceActionForattrib6: 5801990 false) 
	#(113 5 #reduceActionForattrib7: 5801991 false) 
	#(113 5 #reduceActionForattrib4: 5801988 false) 
	#(113 5 #reduceActionForattrib5: 5801989 false) 
	#(125 1 #liftFirstValue: 6423563 false) 
	#(125 1 #liftFirstValue: 6423562 false) 
	#(125 1 #liftFirstValue: 6423564 false) 
	#(125 1 #liftFirstValue: 6423565 false) 
	#(125 1 #liftFirstValue: 6423557 false) 
	#(125 1 #liftFirstValue: 6423558 false) 
	#(125 1 #liftFirstValue: 6423556 false) 
	#(125 1 #liftFirstValue: 6423559 false) 
	#(125 1 #liftFirstValue: 6423560 false) 
	#(125 1 #liftFirstValue: 6423561 false) 
	#(125 1 #liftFirstValue: 6423555 false) 
	#(125 1 #liftFirstValue: 6423554 false) 
	#(125 1 #liftFirstValue: 6423553 false) 
	#(115 3 #reduceActionFordeclaration3: 6042627 false) 
	#(119 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 6259713 false) 
	#(120 1 #reduceActionForarg1: 6304769 false) 
	#(121 1 #reduceActionForexpr__expr___1: 6312961 false) 
	#(124 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 6368257 false) 
	#(125 1 #liftFirstValue: 6423566 false) 
	#(88 2 #reduceActionFor_______selector__selector___1: 4204546 false) 
	#(87 5 #reduceActionForpage2: 4123650 false) 
	#(115 3 #reduceActionFordeclaration3: 6042625 false) 
	#(87 5 #reduceActionForpage3: 4123651 false) 
	#(77 3 #reduceActionFormf_plain1: 3179521 false) 
	#(80 1 #liftFirstValue: 3349506 false) 
	#(79 3 #reduceActionFormf_range3: 3307523 false) 
	#(82 4 #reduceActionForgeneral_enclosed2: 3804162 false) 
	#(79 3 #reduceActionFormf_range3: 3307526 false) 
	#(70 4 #reduceActionFormedia_query5: 2518021 false) 
	#(70 4 #reduceActionFormedia_query7: 2518023 false) 
	#(66 2 #reduceActionFor_______selector__selector___1: 2426881 false) 
	#(72 2 #reduceActionFor_______selector__selector___1: 2747393 false) 
	#(72 2 #reduceActionFor_______selector__selector___1: 2747394 false) 
	#(98 5 #reduceActionForfont_face2: 4803586 false) 
	#(97 1 #liftFirstValue: 4722689 false) 
	#(97 1 #liftFirstValue: 4722690 false) 
	#(90 5 #reduceActionForkeyframes1: 4264961 false) 
	#(97 1 #reduceActionForkeyframe_selector3: 4722691 false) 
	#(91 2 #reduceActionFor__CDO____commentToken____CDC____commentToken___2: 4328450 false) 
	#(96 0 #reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: 4653057 false) 
	#(103 5 #reduceActionForruleset1: 5112833 false) 
	#(115 4 #reduceActionFordeclaration4: 6042628 false) 
	#(117 2 #reduceActionForargs_list1: 6235137 false) 
	#(121 2 #reduceActionFor__CDO____commentToken____CDC____commentToken___2: 6312962 false) 
	#(122 2 #reduceActionForexpr1: 6346753 false) 
	#(115 4 #reduceActionFordeclaration4: 6042626 false) 
	#(87 6 #reduceActionForpage4: 4123652 false) 
	#(79 4 #reduceActionFormf_range1: 3307521 false) 
	#(79 4 #reduceActionFormf_range2: 3307522 false) 
	#(79 4 #reduceActionFormf_range1: 3307524 false) 
	#(79 4 #reduceActionFormf_range2: 3307525 false) 
	#(65 6 #reduceActionFormedia1: 2373633 false) 
	#(68 1 #liftFirstValue: 2461698 false) 
	#(69 2 #reduceActionFor__CDO____commentToken____CDC____commentToken___2: 2461698 false) 
	#(68 1 #liftFirstValue: 2461697 false) 
	#(94 2 #reduceActionForkeyframe_selector_list1: 4595713 false) 
	#(103 6 #reduceActionForruleset2: 5112834 false) 
	#(126 3 #reduceActionForfunction1: 6609921 false) 
	#(118 1 #reduceActionFor___________medium_1: 6259713 false) 
	#(119 2 #reduceActionFor_______selector__selector____2: 6259714 false) 
	#(100 1 #liftFirstValue: 4992002 false) 
	#(100 1 #liftFirstValue: 4992003 false) 
	#(100 1 #liftFirstValue: 4992001 false) 
	#(124 2 #reduceActionFor_______selector__selector____2: 6368258 false) 
	#(96 2 #reduceActionFor_______selector__selector____2: 4653058 false) 
	#(118 2 #reduceActionFor_______selector__selector___1: 6259714 false) 
	#(123 2 #reduceActionFor_______selector__selector___1: 6368257 false) 
	#(93 4 #reduceActionForkeyframe_block1: 4432897 false) 
	#(95 2 #reduceActionFor_______selector__selector___1: 4653057 false) 
	#(79 7 #reduceActionFormf_range7: 3307527 false) 
	#(79 7 #reduceActionFormf_range8: 3307528 false) 
	#(93 5 #reduceActionForkeyframe_block2: 4432898 false)
	).
]

{ #category : #'generated-accessing' }
CSSParser class >> scannerClass [
	^CSSScanner
]

{ #category : #generated }
CSSParser class >> startingStateForstylesheet [

	^ 1
]

{ #category : #generated }
CSSParser class >> symbolNames [

	^ #( '"("' '")"' '"*"' '"+"' '","' '"-"' '"--"' '"."' '"/"' '":"'
	     '";"' '"<"' '"="' '">"' '"["' '"]"' '"and"' '"from"' '"not"'
	     '"only"' '"or"' '"to"' '"{"' '"}"' '"~"' '<whitespace>'
	     '<comment>' '<ident>' '<string>' '<uri>' '<CHARSET_SYM>'
	     '<CDO>' '<CDC>' '<IMPORT_SYM>' '<PAGE_SYM>' '<MEDIA_SYM>'
	     '<FONT_FACE_SYM>' '<KEYFRAMES_SYM>' '<HASH>' '<DASHMATCH>'
	     '<INCLUDES>' '<FUNCTION>' '<IMPORTANT_SYM>' '<EMS>' '<EXS>'
	     '<LENGTH>' '<ANGLE>' '<TIME>' '<FREQ>' '<PERCENTAGE>'
	     '<NUMBER>' 'B e g i n' 'stylesheet' '(<CDO>  ''commentToken'' |<CDC>  ''commentToken'')'
	     '(<CDO>  ''commentToken'' |<CDC>  ''commentToken'')*'
	     '( import ''import'' ( <CDO> ''commentToken'' | <CDC> ''commentToken''  )* )'
	     '( import ''import'' ( <CDO> ''commentToken'' | <CDC> ''commentToken''  )* )*'
	     '( <CDO> ''commentToken'' | <CDC> ''commentToken''  )'
	     '( <CDO> ''commentToken'' | <CDC> ''commentToken''  )*'
	     '( ( ruleset ''type'' | media ''type'' | page ''type'' | font_face ''type'' | keyframes ''type'' ) ( <CDO>   ''commentToken'' | <CDC>  ''commentToken'' )* )'
	     '( ( ruleset ''type'' | media ''type'' | page ''type'' | font_face ''type'' | keyframes ''type'' ) ( <CDO>   ''commentToken'' | <CDC>  ''commentToken'' )* )*'
	     '( <CDO>   ''commentToken'' | <CDC>  ''commentToken'' )'
	     '( <CDO>   ''commentToken'' | <CDC>  ''commentToken'' )*'
	     'import' 'media' '((",") media_query ''query'')'
	     '((",") media_query ''query'')*'
	     '(ruleset ''rule'' | media ''rule'')'
	     '(ruleset ''rule'' | media ''rule'')*'
	     'media_query' 'media_condition' '( ( "and" ''boolean'' | "or" ''boolean''  ) media_in_parens ''rightCondition'' )'
	     '( ( "and" ''boolean'' | "or" ''boolean''  ) media_in_parens ''rightCondition'' )*'
	     'media_not' 'media_in_parens' 'media_feature' 'mf_plain'
	     'mf_boolean' 'mf_range' '"="?' 'mf_value' 'general_enclosed'
	     'media_list' '( (",") ?  medium)' '( (",") ?  medium)*'
	     'medium' 'page' '( ";"  declaration ''declaration'' ? )'
	     '( ";"  declaration ''declaration'' ? )*'
	     'keyframes' 'keyframe_block ''keyframeBlock'' *'
	     'keyframes_name' 'keyframe_block' 'keyframe_selector_list'
	     '("," keyframe_selector ''selector'' )'
	     '("," keyframe_selector ''selector'' )*'
	     'keyframe_selector' 'font_face' 'pseudo_page' 'operator'
	     'combinator' 'unary_operator' 'ruleset' '( ","  selector ''selector'' )'
	     '( ","  selector ''selector'' )*'
	     'selector' 'simple_selector' '(simple_selector_list ''selector'')'
	     '(simple_selector_list ''selector'')*'
	     'unary_selector' 'simple_selector_list' 'class' 'attrib'
	     'pseudo' 'declaration' 'variable' 'args_list' '("," arg ''arg'' ?)'
	     '("," arg ''arg'' ?)*' 'arg' 'expr ''expr'' +' 'expr' '( operator ''operator'' term ''term'' )'
	     '( operator ''operator'' term ''term'' )*'
	     'term' 'function' 'E O F' 'error' )
]

{ #category : #generated }
CSSParser class >> symbolTypes [

	^ #( #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #ASTStyleSheetNode #ASTStyleSheetNode
	     #SmaCCToken #OrderedCollection #OrderedCollection
	     #OrderedCollection #SmaCCToken #OrderedCollection
	     #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection
	     #ASTImportNode #ASTMediaNode #OrderedCollection
	     #OrderedCollection #ASTCSSNode #OrderedCollection
	     #ASTMediaQueryNode #ASTCSSNode #OrderedCollection
	     #OrderedCollection #ASTMediaNotNode #ASTMediaInParethesesNode
	     #ASTMediaFeatureNode #ASTMediaPlainValueNode
	     #ASTMediaBooleanValueNode #ASTMediaRangeValueNode
	     #SmaCCToken #Object #ASTCSSNode #ASTMediaListNode
	     #OrderedCollection #OrderedCollection #SmaCCToken #ASTPageNode
	     #OrderedCollection #OrderedCollection #ASTKeyFrameNode
	     #OrderedCollection #SmaCCToken #ASTKeyFrameBlockNode
	     #ASTKeyFrameSelectorListNode #OrderedCollection
	     #OrderedCollection #Object #ASTFontFaceNode #ASTPseudoPageNameNode
	     #SmaCCToken #SmaCCToken #SmaCCToken #ASTRuleSetNode
	     #OrderedCollection #OrderedCollection #ASTRuleSetSelectorListNode
	     #ASTRuleSetSelectorNode #Object #OrderedCollection
	     #ASTUnarySelectorNode #Object #ASTClassNode #ASTAttributeNode
	     #ASTPseudoNode #ASTDeclarationNode #ASTVariableNode
	     #ASTArgumentListNode #OrderedCollection #OrderedCollection
	     #ASTArgumentNode #OrderedCollection #ASTTermNode #OrderedCollection
	     #OrderedCollection #Object #ASTFunctionNode #SmaCCToken
	     #SmaCCErrorNode )
]

{ #category : #generated }
CSSParser class >> transitionTable [
^#(
#[1 0 6 0 3 0 6 0 8 0 6 0 10 0 6 0 15 0 6 0 28 0 9 0 31 0 6 0 32 0 6 0 33 0 6 0 34 0 6 0 35 0 6 0 36 0 6 0 37 0 6 0 38 0 6 0 39 0 13 0 53 0 17 0 55 0 6 0 127] 
#[0 0 21 0 29] 
#[0 0 0 0 127] 
#[1 0 10 0 3 0 10 0 8 0 10 0 10 0 10 0 15 0 10 0 28 0 33 0 32 0 33 0 33 0 10 0 34 0 10 0 35 0 10 0 36 0 10 0 37 0 10 0 38 0 10 0 39 0 33 0 54 0 37 0 57 0 10 0 127] 
#[0 0 41 0 11] 
#[0 0 14 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 0 18 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 0 22 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 0 26 0 3 0 26 0 8 0 26 0 10 0 26 0 15 0 26 0 28 0 45 0 34 0 26 0 35 0 26 0 36 0 26 0 37 0 26 0 38 0 26 0 39 0 49 0 56 0 53 0 61 0 57 0 64 0 26 0 127] 
#[1 0 6 0 3 0 6 0 8 0 6 0 10 0 6 0 15 0 6 0 28 0 6 0 32 0 6 0 33 0 6 0 34 0 6 0 35 0 6 0 36 0 6 0 37 0 6 0 38 0 6 0 39 0 61 0 55 0 6 0 127] 
#[1 0 65 0 29 0 69 0 30] 
#[0 0 30 0 3 0 8 0 10 0 15 0 28 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 0 73 0 3 0 77 0 8 0 81 0 10 0 85 0 15 0 89 0 28 0 93 0 35 0 97 0 36 0 101 0 37 0 105 0 38 0 149 0 39 0 113 0 60 0 117 0 65 0 121 0 87 0 125 0 90 0 129 0 98 0 133 0 103 0 137 0 106 0 141 0 107 0 145 0 110 0 149 0 111 0 149 0 112 0 149 0 113 0 161 0 114 0 34 0 127] 
#[1 0 38 0 3 0 38 0 8 0 38 0 10 0 38 0 15 0 38 0 28 0 38 0 32 0 38 0 33 0 38 0 34 0 38 0 35 0 38 0 36 0 38 0 37 0 38 0 38 0 38 0 39 0 165 0 59 0 38 0 127] 
#[1 0 10 0 3 0 10 0 8 0 10 0 10 0 10 0 15 0 10 0 28 0 33 0 32 0 33 0 33 0 10 0 34 0 10 0 35 0 10 0 36 0 10 0 37 0 10 0 38 0 10 0 39 0 33 0 54 0 169 0 57 0 10 0 127] 
#[1 0 173 0 11 0 185 0 28 0 181 0 83 0 185 0 86] 
#[1 0 189 0 11 0 185 0 28 0 193 0 83 0 185 0 86] 
#[0 0 42 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 0 197 0 28] 
#[1 0 201 0 10 0 205 0 28 0 209 0 42] 
#[0 0 213 0 28] 
#[0 0 46 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[1 0 217 0 10 0 221 0 23 0 225 0 99] 
#[1 0 229 0 1 0 233 0 19 0 237 0 20 0 241 0 28 0 245 0 42 0 249 0 70 0 253 0 71 0 253 0 74 1 5 0 75 1 9 0 76 1 13 0 82] 
#[0 1 17 0 23] 
#[0 1 29 0 28 0 29 0 92] 
#[0 0 50 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 0 54 0 3 0 8 0 10 0 15 0 28 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 0 58 0 3 0 58 0 8 0 58 0 10 0 58 0 15 0 58 0 28 0 58 0 32 0 58 0 33 0 58 0 35 0 58 0 36 0 58 0 37 0 58 0 38 0 58 0 39 1 33 0 63 0 58 0 127] 
#[1 0 58 0 3 0 58 0 8 0 58 0 10 0 58 0 15 0 58 0 28 0 58 0 32 0 58 0 33 0 58 0 35 0 58 0 36 0 58 0 37 0 58 0 38 0 58 0 39 1 37 0 63 0 58 0 127] 
#[1 0 58 0 3 0 58 0 8 0 58 0 10 0 58 0 15 0 58 0 28 0 58 0 32 0 58 0 33 0 58 0 35 0 58 0 36 0 58 0 37 0 58 0 38 0 58 0 39 1 41 0 63 0 58 0 127] 
#[1 0 58 0 3 0 58 0 8 0 58 0 10 0 58 0 15 0 58 0 28 0 58 0 32 0 58 0 33 0 58 0 35 0 58 0 36 0 58 0 37 0 58 0 38 0 58 0 39 1 45 0 63 0 58 0 127] 
#[1 0 58 0 3 0 58 0 8 0 58 0 10 0 58 0 15 0 58 0 28 0 58 0 32 0 58 0 33 0 58 0 35 0 58 0 36 0 58 0 37 0 58 0 38 0 58 0 39 1 49 0 63 0 58 0 127] 
#[1 0 62 0 5 0 62 0 23 1 53 0 105] 
#[1 0 73 0 3 1 69 0 4 0 66 0 5 0 77 0 8 0 81 0 10 1 69 0 14 0 85 0 15 0 66 0 23 1 69 0 25 0 89 0 28 0 149 0 39 1 69 0 101 1 73 0 106 0 141 0 107 0 145 0 110 0 149 0 111 0 149 0 112 0 149 0 113 0 161 0 114] 
#[1 0 70 0 3 0 70 0 4 0 70 0 5 0 70 0 8 0 70 0 10 0 70 0 14 0 70 0 15 0 70 0 23 0 70 0 25 0 70 0 28 0 70 0 39 1 77 0 109] 
#[0 0 74 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 0 78 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 0 82 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 0 86 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[1 0 90 0 3 0 90 0 8 0 90 0 10 0 90 0 15 0 90 0 28 1 89 0 32 1 89 0 33 0 90 0 34 0 90 0 35 0 90 0 36 0 90 0 37 0 90 0 38 0 90 0 39 1 89 0 58 0 90 0 127] 
#[1 0 26 0 3 0 26 0 8 0 26 0 10 0 26 0 15 0 26 0 28 0 45 0 34 0 26 0 35 0 26 0 36 0 26 0 37 0 26 0 38 0 26 0 39 0 49 0 56 1 93 0 61 0 57 0 64 0 26 0 127] 
#[0 0 94 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 0 98 0 5 0 11 0 28] 
#[0 1 97 0 11] 
#[1 0 102 0 5 0 102 0 11 0 102 0 28 1 101 0 85] 
#[0 0 106 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 1 105 0 11] 
#[0 0 110 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[1 1 109 0 28 1 113 0 42] 
#[0 0 114 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[1 1 117 0 2 1 121 0 28] 
#[1 1 125 0 13 1 129 0 16 1 133 0 40 1 137 0 41] 
#[0 1 141 0 28] 
#[1 1 145 0 7 0 118 0 11 0 118 0 24 1 149 0 28 1 153 0 89 1 157 0 115 1 161 0 116] 
#[0 1 165 0 23] 
#[1 0 229 0 1 1 169 0 19 1 173 0 28 0 245 0 42 1 225 0 44 1 225 0 45 1 225 0 46 1 225 0 47 1 225 0 48 1 225 0 49 1 225 0 50 1 205 0 51 1 209 0 71 1 209 0 74 1 5 0 75 1 9 0 76 1 213 0 77 1 217 0 78 1 221 0 79 1 225 0 81 1 13 0 82] 
#[1 0 229 0 1 1 229 0 28 0 245 0 42 1 233 0 75 1 9 0 76 1 13 0 82] 
#[0 1 237 0 28] 
#[1 0 122 0 5 1 241 0 17 0 122 0 23] 
#[0 1 245 0 28] 
#[1 0 126 0 5 0 126 0 23 1 249 0 67] 
#[0 0 130 0 5 0 23] 
#[0 0 134 0 2 0 5 0 23] 
#[1 0 138 0 2 0 138 0 5 0 138 0 17 0 138 0 21 0 138 0 23 1 253 0 73] 
#[0 0 142 0 2 0 5 0 17 0 21 0 23] 
#[0 0 146 0 2 0 5 0 17 0 21 0 23] 
#[1 1 145 0 7 0 118 0 11 0 118 0 24 1 149 0 28 2 1 0 89 2 5 0 115 1 161 0 116] 
#[0 0 150 0 23] 
#[0 0 154 0 23] 
#[0 2 9 0 23] 
#[1 0 158 0 3 0 158 0 8 0 158 0 10 0 158 0 15 0 158 0 28 2 21 0 32 2 21 0 33 0 158 0 35 0 158 0 36 0 158 0 37 0 158 0 38 0 158 0 39 2 21 0 62 0 158 0 127] 
#[1 0 162 0 3 0 162 0 8 0 162 0 10 0 162 0 15 0 162 0 28 2 21 0 32 2 21 0 33 0 162 0 35 0 162 0 36 0 162 0 37 0 162 0 38 0 162 0 39 2 21 0 62 0 162 0 127] 
#[1 0 166 0 3 0 166 0 8 0 166 0 10 0 166 0 15 0 166 0 28 2 21 0 32 2 21 0 33 0 166 0 35 0 166 0 36 0 166 0 37 0 166 0 38 0 166 0 39 2 21 0 62 0 166 0 127] 
#[1 0 170 0 3 0 170 0 8 0 170 0 10 0 170 0 15 0 170 0 28 2 21 0 32 2 21 0 33 0 170 0 35 0 170 0 36 0 170 0 37 0 170 0 38 0 170 0 39 2 21 0 62 0 170 0 127] 
#[1 0 174 0 3 0 174 0 8 0 174 0 10 0 174 0 15 0 174 0 28 2 21 0 32 2 21 0 33 0 174 0 35 0 174 0 36 0 174 0 37 0 174 0 38 0 174 0 39 2 21 0 62 0 174 0 127] 
#[1 2 25 0 5 2 29 0 23 2 33 0 104] 
#[0 0 178 0 3 0 8 0 10 0 15 0 28 0 39] 
#[0 0 182 0 3 0 8 0 10 0 15 0 28 0 39] 
#[0 0 186 0 3 0 8 0 10 0 15 0 28 0 39] 
#[1 0 73 0 3 0 77 0 8 0 81 0 10 0 85 0 15 0 89 0 28 0 149 0 39 2 37 0 106 0 141 0 107 0 145 0 110 0 149 0 111 0 149 0 112 0 149 0 113 0 161 0 114] 
#[0 0 190 0 5 0 23] 
#[1 0 194 0 3 0 194 0 4 0 194 0 5 0 77 0 8 0 81 0 10 0 194 0 14 0 85 0 15 0 194 0 23 0 194 0 25 0 194 0 28 2 41 0 39 2 41 0 108 2 41 0 111 2 41 0 112 2 41 0 113 0 161 0 114] 
#[0 0 198 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 0 202 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 0 206 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 0 73 0 3 0 77 0 8 0 81 0 10 0 85 0 15 0 89 0 28 0 93 0 35 0 97 0 36 0 101 0 37 0 105 0 38 0 149 0 39 0 113 0 60 0 117 0 65 0 121 0 87 0 125 0 90 0 129 0 98 0 133 0 103 0 137 0 106 0 141 0 107 0 145 0 110 0 149 0 111 0 149 0 112 0 149 0 113 0 161 0 114 0 210 0 127] 
#[0 0 214 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 2 49 0 5 0 218 0 11 2 57 0 28 2 53 0 84 2 57 0 86] 
#[0 0 222 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 0 226 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[1 2 61 0 2 2 65 0 28] 
#[0 0 230 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 2 69 0 2] 
#[1 2 73 0 28 2 77 0 29] 
#[0 0 234 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[1 2 81 0 28 2 85 0 29] 
#[1 2 89 0 28 2 93 0 29] 
#[0 0 238 0 23] 
#[0 2 97 0 28] 
#[0 2 101 0 10] 
#[1 2 105 0 11 2 109 0 24 2 113 0 88] 
#[1 0 118 0 11 0 118 0 24 2 117 0 89] 
#[0 2 121 0 10] 
#[1 1 145 0 7 0 118 0 11 0 118 0 24 1 149 0 28 2 125 0 89 2 129 0 115 1 161 0 116] 
#[1 0 229 0 1 0 245 0 42 1 233 0 75 1 9 0 76 1 13 0 82] 
#[1 0 242 0 2 2 133 0 10 2 137 0 12 2 141 0 13 2 145 0 14 2 149 0 28] 
#[0 0 246 0 2 0 12 0 13 0 14] 
#[0 0 250 0 2 0 12 0 13 0 14] 
#[0 0 254 0 2 0 12 0 13 0 14] 
#[0 1 2 0 2 0 12 0 13 0 14] 
#[0 1 6 0 2 0 12 0 13 0 14] 
#[0 1 10 0 2 0 12 0 13 0 14] 
#[0 1 14 0 2 0 12 0 13 0 14] 
#[0 1 18 0 2 0 12 0 13 0 14] 
#[0 2 153 0 2] 
#[0 2 157 0 2] 
#[0 2 161 0 2] 
#[0 2 165 0 2] 
#[1 2 169 0 12 2 173 0 13 2 177 0 14] 
#[1 1 22 0 5 2 181 0 17 1 22 0 23] 
#[0 1 26 0 2 0 5 0 23] 
#[1 1 30 0 5 2 185 0 17 1 30 0 23] 
#[1 0 229 0 1 1 169 0 19 0 245 0 42 2 189 0 71 2 189 0 74 1 5 0 75 1 9 0 76 1 13 0 82] 
#[0 2 193 0 2] 
#[1 2 197 0 5 2 201 0 23 2 205 0 66] 
#[1 1 34 0 2 1 34 0 5 2 209 0 17 2 213 0 21 1 34 0 23 2 217 0 72] 
#[1 2 105 0 11 2 221 0 24 2 113 0 88] 
#[1 0 118 0 11 0 118 0 24 2 225 0 89] 
#[1 1 38 0 18 1 38 0 22 1 38 0 24 1 38 0 50 2 229 0 91] 
#[0 1 42 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 1 46 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 1 50 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 0 73 0 3 0 77 0 8 0 81 0 10 0 85 0 15 0 89 0 28 0 149 0 39 2 233 0 106 0 141 0 107 0 145 0 110 0 149 0 111 0 149 0 112 0 149 0 113 0 161 0 114] 
#[1 1 145 0 7 0 118 0 11 0 118 0 24 1 149 0 28 2 237 0 89 2 241 0 115 1 161 0 116] 
#[0 1 54 0 5 0 23] 
#[0 1 58 0 5 0 23] 
#[0 1 62 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 1 66 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 2 245 0 28 0 86] 
#[0 1 70 0 5 0 11 0 28] 
#[0 1 74 0 5 0 11 0 28] 
#[0 1 78 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 2 249 0 2] 
#[0 1 82 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 2 253 0 16] 
#[0 3 1 0 16] 
#[0 3 5 0 16] 
#[0 3 9 0 16] 
#[0 3 13 0 16] 
#[0 3 17 0 16] 
#[0 1 86 0 2 0 3 0 5 0 6 0 7 0 9 0 10 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 1 145 0 7 3 93 0 28 3 93 0 29 3 93 0 30 3 93 0 39 3 37 0 42 3 93 0 44 3 93 0 45 3 93 0 46 3 93 0 47 3 93 0 48 3 93 0 49 3 93 0 50 3 93 0 51 3 93 0 116 3 77 0 117 3 81 0 120 3 85 0 121 3 89 0 122 3 93 0 125 3 93 0 126] 
#[1 1 145 0 7 1 90 0 11 1 90 0 24 1 149 0 28 3 101 0 115 1 161 0 116] 
#[0 1 94 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 1 98 0 11 0 24] 
#[1 2 105 0 11 3 105 0 24 2 113 0 88] 
#[1 1 145 0 7 3 93 0 28 3 93 0 29 3 93 0 30 3 93 0 39 3 37 0 42 3 93 0 44 3 93 0 45 3 93 0 46 3 93 0 47 3 93 0 48 3 93 0 49 3 93 0 50 3 93 0 51 3 93 0 116 3 109 0 117 3 81 0 120 3 85 0 121 3 89 0 122 3 93 0 125 3 93 0 126] 
#[1 2 105 0 11 3 113 0 24 2 113 0 88] 
#[1 0 118 0 11 0 118 0 24 3 117 0 89] 
#[1 3 121 0 44 3 121 0 45 3 121 0 46 3 121 0 47 3 121 0 48 3 121 0 49 3 121 0 50 1 205 0 51 3 121 0 81] 
#[1 3 129 0 13 1 102 0 44 1 102 0 45 1 102 0 46 1 102 0 47 1 102 0 48 1 102 0 49 1 102 0 50 1 102 0 51 3 129 0 80] 
#[1 3 133 0 44 3 133 0 45 3 133 0 46 3 133 0 47 3 133 0 48 3 133 0 49 3 133 0 50 1 205 0 51 3 133 0 81] 
#[1 3 137 0 13 1 102 0 44 1 102 0 45 1 102 0 46 1 102 0 47 1 102 0 48 1 102 0 49 1 102 0 50 1 102 0 51 3 137 0 80] 
#[0 3 141 0 2] 
#[0 1 106 0 2 0 5 0 17 0 21 0 23] 
#[0 1 110 0 2 0 5 0 17 0 21 0 23] 
#[0 1 114 0 2 0 5 0 17 0 21 0 23] 
#[0 1 118 0 2 0 5 0 17 0 21 0 23] 
#[1 3 145 0 13 1 102 0 28 3 145 0 80] 
#[0 3 149 0 28] 
#[1 3 153 0 13 1 102 0 28 3 153 0 80] 
#[1 0 229 0 1 1 169 0 19 0 245 0 42 3 157 0 71 3 157 0 74 1 5 0 75 1 9 0 76 1 13 0 82] 
#[1 0 229 0 1 1 169 0 19 0 245 0 42 3 161 0 71 3 161 0 74 1 5 0 75 1 9 0 76 1 13 0 82] 
#[0 1 122 0 5 0 23] 
#[0 1 126 0 2 0 5 0 17 0 21 0 23] 
#[1 0 229 0 1 0 233 0 19 0 237 0 20 0 241 0 28 0 245 0 42 3 165 0 70 0 253 0 71 0 253 0 74 1 5 0 75 1 9 0 76 1 13 0 82] 
#[1 1 130 0 3 1 130 0 8 1 130 0 10 1 130 0 15 1 130 0 24 1 130 0 28 1 130 0 36 1 130 0 39 3 169 0 69] 
#[0 1 134 0 5 0 23] 
#[1 0 229 0 1 0 245 0 42 3 173 0 75 1 9 0 76 1 13 0 82] 
#[1 0 229 0 1 0 245 0 42 3 177 0 75 1 9 0 76 1 13 0 82] 
#[0 1 138 0 2 0 5 0 17 0 21 0 23] 
#[0 1 142 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 2 105 0 11 3 181 0 24 2 113 0 88] 
#[1 3 209 0 18 3 209 0 22 3 193 0 24 3 197 0 50 3 201 0 93 3 205 0 94 3 209 0 97] 
#[0 1 146 0 5 0 23] 
#[1 2 105 0 11 3 213 0 24 2 113 0 88] 
#[1 0 118 0 11 0 118 0 24 3 217 0 89] 
#[0 1 150 0 5 0 11 0 28] 
#[0 1 154 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 1 158 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 1 162 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 1 166 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 1 170 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 1 174 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 1 178 0 3 0 4 0 5 0 8 0 10 0 14 0 15 0 23 0 25 0 28 0 39] 
#[0 1 182 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 186 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 190 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 194 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 1 145 0 7 3 93 0 28 3 93 0 29 3 93 0 30 3 93 0 39 3 37 0 42 3 93 0 44 3 93 0 45 3 93 0 46 3 93 0 47 3 93 0 48 3 93 0 49 3 93 0 50 3 93 0 51 3 93 0 116 3 221 0 117 3 81 0 120 3 85 0 121 3 89 0 122 3 93 0 125 3 93 0 126] 
#[0 1 198 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 202 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 206 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 210 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 214 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 218 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 222 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 226 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 1 230 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 1 234 0 11 1 234 0 24 3 225 0 43] 
#[1 1 238 0 2 1 238 0 5 1 238 0 11 1 238 0 24 1 238 0 43 3 229 0 119] 
#[1 1 242 0 2 1 242 0 5 1 145 0 7 1 242 0 11 1 242 0 24 3 93 0 28 3 93 0 29 3 93 0 30 3 93 0 39 3 37 0 42 1 242 0 43 3 93 0 44 3 93 0 45 3 93 0 46 3 93 0 47 3 93 0 48 3 93 0 49 3 93 0 50 3 93 0 51 3 93 0 116 3 233 0 122 3 93 0 125 3 93 0 126] 
#[0 1 246 0 2 0 5 0 7 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 1 250 0 2 1 250 0 3 1 250 0 5 1 250 0 6 1 250 0 7 1 250 0 9 1 250 0 11 1 250 0 24 1 250 0 28 1 250 0 29 1 250 0 30 1 250 0 39 1 250 0 42 1 250 0 43 1 250 0 44 1 250 0 45 1 250 0 46 1 250 0 47 1 250 0 48 1 250 0 49 1 250 0 50 1 250 0 51 3 237 0 124] 
#[0 1 254 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 2 2 0 11 0 24] 
#[0 2 6 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 2 10 0 11 2 10 0 24 3 241 0 43] 
#[0 2 14 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 2 105 0 11 3 245 0 24 2 113 0 88] 
#[0 2 18 0 2] 
#[0 2 22 0 28 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 3 249 0 44 3 249 0 45 3 249 0 46 3 249 0 47 3 249 0 48 3 249 0 49 3 249 0 50 1 205 0 51 3 249 0 81] 
#[0 2 26 0 2] 
#[1 3 253 0 44 3 253 0 45 3 253 0 46 3 253 0 47 3 253 0 48 3 253 0 49 3 253 0 50 1 205 0 51 3 253 0 81] 
#[0 2 30 0 2 0 5 0 17 0 21 0 23] 
#[0 4 1 0 28] 
#[0 2 34 0 2] 
#[0 4 5 0 28] 
#[0 2 38 0 5 0 23] 
#[0 2 42 0 5 0 23] 
#[0 2 46 0 5 0 23] 
#[1 0 73 0 3 0 77 0 8 0 81 0 10 0 85 0 15 4 9 0 24 0 89 0 28 0 97 0 36 0 149 0 39 4 17 0 65 4 17 0 68 4 17 0 103 0 137 0 106 0 141 0 107 0 145 0 110 0 149 0 111 0 149 0 112 0 149 0 113 0 161 0 114] 
#[0 2 50 0 2 0 5 0 17 0 21 0 23] 
#[0 2 54 0 2 0 5 0 17 0 21 0 23] 
#[0 2 58 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 2 62 0 5 0 23] 
#[0 2 66 0 5 0 23] 
#[0 2 70 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 2 74 0 5 0 23] 
#[0 2 78 0 18 0 22 0 24 0 50] 
#[0 4 25 0 23] 
#[1 2 82 0 5 2 82 0 23 4 29 0 96] 
#[0 2 86 0 3 0 8 0 10 0 15 0 24 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[1 2 105 0 11 4 33 0 24 2 113 0 88] 
#[0 4 37 0 2] 
#[0 2 90 0 11 0 24] 
#[1 2 94 0 2 4 41 0 5 2 94 0 11 2 94 0 24 2 94 0 43 4 45 0 118] 
#[0 2 98 0 2 0 5 0 7 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 2 102 0 2 4 61 0 3 2 102 0 5 4 61 0 6 2 102 0 7 4 61 0 9 2 102 0 11 2 102 0 24 2 102 0 28 2 102 0 29 2 102 0 30 2 102 0 39 2 102 0 42 2 102 0 43 2 102 0 44 2 102 0 45 2 102 0 46 2 102 0 47 2 102 0 48 2 102 0 49 2 102 0 50 2 102 0 51 4 61 0 100 4 65 0 123] 
#[0 2 106 0 11 0 24] 
#[0 2 110 0 3 0 8 0 10 0 15 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 2 114 0 2] 
#[0 2 118 0 2] 
#[1 2 122 0 2 4 69 0 12] 
#[1 2 126 0 2 4 73 0 14] 
#[0 2 130 0 3 0 8 0 10 0 15 0 24 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 2 134 0 3 0 8 0 10 0 15 0 24 0 28 0 36 0 39] 
#[0 2 138 0 3 0 8 0 10 0 15 0 24 0 28 0 36 0 39] 
#[0 2 142 0 3 0 8 0 10 0 15 0 24 0 28 0 36 0 39] 
#[1 1 145 0 7 0 118 0 11 0 118 0 24 1 149 0 28 4 77 0 89 4 81 0 115 1 161 0 116] 
#[1 4 85 0 5 2 146 0 23 4 89 0 95] 
#[0 2 150 0 3 0 8 0 10 0 15 0 24 0 28 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 127] 
#[0 2 154 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 2 158 0 2 2 158 0 5 1 145 0 7 2 158 0 11 2 158 0 24 3 93 0 28 3 93 0 29 3 93 0 30 3 93 0 39 3 37 0 42 2 158 0 43 3 93 0 44 3 93 0 45 3 93 0 46 3 93 0 47 3 93 0 48 3 93 0 49 3 93 0 50 3 93 0 51 3 93 0 116 4 93 0 120 3 85 0 121 3 89 0 122 3 93 0 125 3 93 0 126] 
#[0 2 162 0 2 0 5 0 11 0 24 0 43] 
#[0 2 166 0 7 0 28 0 29 0 30 0 39 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 2 170 0 7 0 28 0 29 0 30 0 39 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[0 2 174 0 7 0 28 0 29 0 30 0 39 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 1 145 0 7 4 97 0 28 4 97 0 29 4 97 0 30 4 97 0 39 3 37 0 42 4 97 0 44 4 97 0 45 4 97 0 46 4 97 0 47 4 97 0 48 4 97 0 49 4 97 0 50 4 97 0 51 4 97 0 116 4 97 0 125 4 97 0 126] 
#[0 2 178 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 4 101 0 13 1 102 0 44 1 102 0 45 1 102 0 46 1 102 0 47 1 102 0 48 1 102 0 49 1 102 0 50 1 102 0 51 4 101 0 80] 
#[1 4 105 0 13 1 102 0 44 1 102 0 45 1 102 0 46 1 102 0 47 1 102 0 48 1 102 0 49 1 102 0 50 1 102 0 51 4 105 0 80] 
#[1 2 105 0 11 4 109 0 24 2 113 0 88] 
#[1 0 118 0 11 0 118 0 24 4 113 0 89] 
#[1 4 117 0 18 4 117 0 22 3 197 0 50 4 117 0 97] 
#[0 2 182 0 5 0 23] 
#[0 2 186 0 2 0 5 0 11 0 24 0 43] 
#[0 2 190 0 2 0 3 0 5 0 6 0 7 0 9 0 11 0 24 0 28 0 29 0 30 0 39 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51] 
#[1 4 121 0 44 4 121 0 45 4 121 0 46 4 121 0 47 4 121 0 48 4 121 0 49 4 121 0 50 1 205 0 51 4 121 0 81] 
#[1 4 125 0 44 4 125 0 45 4 125 0 46 4 125 0 47 4 125 0 48 4 125 0 49 4 125 0 50 1 205 0 51 4 125 0 81] 
#[0 2 194 0 18 0 22 0 24 0 50] 
#[1 2 105 0 11 4 129 0 24 2 113 0 88] 
#[0 2 198 0 5 0 23] 
#[0 2 202 0 2] 
#[0 2 206 0 2] 
#[0 2 210 0 18 0 22 0 24 0 50]
	).
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor__CDO____commentToken____CDC____commentToken___1: nodes [

	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor__CDO____commentToken____CDC____commentToken___2: nodes [

	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor___________medium_1: nodes [

	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor___________medium_2: nodes [

	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	result at: 1 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor___________medium__2: nodes [

	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 2).
	self add: ((nodes at: 2) at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor_______selector__selector___1: nodes [

	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor_______selector__selector____2: nodes [

	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken_______1: nodes [

	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________1: nodes [

	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFor__import__import_____CDO___commentToken_____CDC___commentToken________2: nodes [

	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForarg1: nodes [

	| result |
	result := ASTArgumentNode new.
	result addNodes: (nodes at: 1) to: result exprs.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForargs_list1: nodes [

	| result |
	result := ASTArgumentListNode new.
	result addNode: (nodes at: 1) to: result args.
	result addTokens: ((nodes at: 2) at: 1) to: result commaTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result args.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForattrib1: nodes [

	| result |
	result := ASTAttributeNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result identTokens.
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForattrib2: nodes [

	| result |
	result := ASTAttributeNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result identTokens.
	result equalToken: (nodes at: 3).
	result addToken: (nodes at: 4) to: result identTokens.
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForattrib3: nodes [

	| result |
	result := ASTAttributeNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result identTokens.
	result equalToken: (nodes at: 3).
	result stringToken: (nodes at: 4).
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForattrib4: nodes [

	| result |
	result := ASTAttributeNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result identTokens.
	result iNCLUDESToken: (nodes at: 3).
	result addToken: (nodes at: 4) to: result identTokens.
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForattrib5: nodes [

	| result |
	result := ASTAttributeNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result identTokens.
	result iNCLUDESToken: (nodes at: 3).
	result stringToken: (nodes at: 4).
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForattrib6: nodes [

	| result |
	result := ASTAttributeNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result identTokens.
	result dASHMATCHToken: (nodes at: 3).
	result addToken: (nodes at: 4) to: result identTokens.
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForattrib7: nodes [

	| result |
	result := ASTAttributeNode new.
	result leftBracketToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result identTokens.
	result dASHMATCHToken: (nodes at: 3).
	result stringToken: (nodes at: 4).
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForclass1: nodes [

	| result |
	result := ASTClassNode new.
	result periodToken: (nodes at: 1).
	result identToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFordeclaration3: nodes [

	| result |
	result := ASTDeclarationNode new.
	result variable: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result arguments: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFordeclaration4: nodes [

	| result |
	result := ASTDeclarationNode new.
	result variable: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result arguments: (nodes at: 3).
	result isImportant: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForexpr1: nodes [

	| result |
	result := ASTTermNode new.
	result addObject: (nodes at: 1) to: result terms.
	result addTokens: ((nodes at: 2) at: 1) to: result operators.
	result addObjects: ((nodes at: 2) at: 2) to: result terms.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForexpr__expr___1: nodes [

	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForfont_face1: nodes [

	| result |
	result := ASTFontFaceNode new.
	result fONT_FACE_SYMToken: (nodes at: 1).
	result leftBraceToken: (nodes at: 2).
	result addTokens: ((nodes at: 3) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 3) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForfont_face2: nodes [

	| result |
	result := ASTFontFaceNode new.
	result fONT_FACE_SYMToken: (nodes at: 1).
	result leftBraceToken: (nodes at: 2).
	result addNode: (nodes at: 3) to: result declarations.
	result addTokens: ((nodes at: 4) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForfunction1: nodes [

	| result |
	result := ASTFunctionNode new.
	result functionName: (nodes at: 1).
	result argumentList: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForgeneral_enclosed1: nodes [

	| result |
	result := ASTMediaGeneralEnclosedFunctionNode new.
	result functionName: (nodes at: 1).
	result identifierRight: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForgeneral_enclosed2: nodes [

	| result |
	result := ASTMediaGeneralEnclosedIdentifiersNode new.
	result leftParenToken: (nodes at: 1).
	result identifierLeft: (nodes at: 2).
	result identifierRight: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForimport1: nodes [

	| result |
	result := ASTImportNode new.
	result iMPORT_SYMToken: (nodes at: 1).
	result name: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForimport2: nodes [

	| result |
	result := ASTImportNode new.
	result iMPORT_SYMToken: (nodes at: 1).
	result name: (nodes at: 2).
	result mediaList: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForkeyframe_block1: nodes [

	| result |
	result := ASTKeyFrameBlockNode new.
	result selectorList: (nodes at: 1).
	result leftBraceToken: (nodes at: 2).
	result addTokens: ((nodes at: 3) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 3) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForkeyframe_block2: nodes [

	| result |
	result := ASTKeyFrameBlockNode new.
	result selectorList: (nodes at: 1).
	result leftBraceToken: (nodes at: 2).
	result addNode: (nodes at: 3) to: result declarations.
	result addTokens: ((nodes at: 4) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForkeyframe_selector3: nodes [

	| result |
	result := ASTKeyFrameSelectorNode new.
	result pERCENTAGEToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForkeyframe_selector_list1: nodes [

	| result |
	result := ASTKeyFrameSelectorListNode new.
	result addObject: (nodes at: 1) to: result selectors.
	result addTokens: ((nodes at: 2) at: 1) to: result commaTokens.
	result addObjects: ((nodes at: 2) at: 2) to: result selectors.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForkeyframes1: nodes [

	| result |
	result := ASTKeyFrameNode new.
	result kEYFRAMES_SYMToken: (nodes at: 1).
	result name: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result keyframeBlocks.
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia1: nodes [

	| result |
	result := ASTMediaNode new.
	result mediaSym: (nodes at: 1).
	result addNode: (nodes at: 2) to: result queries.
	result addTokens: ((nodes at: 3) at: 1) to: result commaTokens.
	result addNodes: ((nodes at: 3) at: 2) to: result queries.
	result leftBraceToken: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result rules.
	result rightBraceToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_condition2: nodes [

	| result |
	result := ASTMediaConditionNode new.
	result leftCondition: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result booleans.
	result addNodes: ((nodes at: 2) at: 2) to: result rightConditions.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_feature1: nodes [

	| result |
	result := ASTMediaFeatureNode new.
	result leftParenToken: (nodes at: 1).
	result value: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_in_parens1: nodes [

	| result |
	result := ASTMediaInParethesesNode new.
	result leftParenToken: (nodes at: 1).
	result condition: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_in_parens2: nodes [

	| result |
	result := ASTMediaInParethesesNode new.
	result feature: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_in_parens3: nodes [

	| result |
	result := ASTMediaInParethesesNode new.
	result generalEnclosed: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_list1: nodes [

	| result |
	result := ASTMediaListNode new.
	result addToken: (nodes at: 1) to: result identTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_not1: nodes [

	| result |
	result := ASTMediaNotNode new.
	result notToken: (nodes at: 1).
	result value: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_query1: nodes [

	| result |
	result := ASTMediaQueryNode new.
	result condition: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_query2: nodes [

	| result |
	result := ASTMediaQueryNode new.
	result identifier: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_query3: nodes [

	| result |
	result := ASTMediaQueryNode new.
	result identifier: (nodes at: 1).
	result andToken: (nodes at: 2).
	result condition: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_query4: nodes [

	| result |
	result := ASTMediaQueryNode new.
	result notToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_query5: nodes [

	| result |
	result := ASTMediaQueryNode new.
	result notToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result andToken: (nodes at: 3).
	result condition: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_query6: nodes [

	| result |
	result := ASTMediaQueryNode new.
	result onlyToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormedia_query7: nodes [

	| result |
	result := ASTMediaQueryNode new.
	result onlyToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result andToken: (nodes at: 3).
	result condition: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormf_boolean1: nodes [

	| result |
	result := ASTMediaBooleanValueNode new.
	result identToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormf_plain1: nodes [

	| result |
	result := ASTMediaPlainValueNode new.
	result key: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormf_range1: nodes [

	| result |
	result := ASTMediaRangeValueNode new.
	result leftValue: (nodes at: 1).
	result addToken: (nodes at: 2) to: result lessThanTokens.
	result addToken: (nodes at: 3) to: result equalTokens.
	result rightValue: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormf_range2: nodes [

	| result |
	result := ASTMediaRangeValueNode new.
	result leftValue: (nodes at: 1).
	result addToken: (nodes at: 2) to: result greaterThanTokens.
	result addToken: (nodes at: 3) to: result equalTokens.
	result rightValue: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormf_range3: nodes [

	| result |
	result := ASTMediaRangeValueNode new.
	result leftValue: (nodes at: 1).
	result addToken: (nodes at: 2) to: result equalTokens.
	result rightValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormf_range7: nodes [

	| result |
	result := ASTMediaRangeValueNode new.
	result leftValue: (nodes at: 1).
	result addToken: (nodes at: 2) to: result lessThanTokens.
	result addToken: (nodes at: 3) to: result equalTokens.
	result midValue: (nodes at: 4).
	result addToken: (nodes at: 5) to: result lessThanTokens.
	result addToken: (nodes at: 6) to: result equalTokens.
	result rightValue: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormf_range8: nodes [

	| result |
	result := ASTMediaRangeValueNode new.
	result leftValue: (nodes at: 1).
	result addToken: (nodes at: 2) to: result greaterThanTokens.
	result addToken: (nodes at: 3) to: result equalTokens.
	result midValue: (nodes at: 4).
	result addToken: (nodes at: 5) to: result greaterThanTokens.
	result addToken: (nodes at: 6) to: result equalTokens.
	result rightValue: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionFormf_value8: nodes [

	| result |
	result := ASTMediaValueNode new.
	result nUMBERToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpage1: nodes [

	| result |
	result := ASTPageNode new.
	result pAGE_SYMToken: (nodes at: 1).
	result leftBraceToken: (nodes at: 2).
	result addTokens: ((nodes at: 3) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 3) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpage2: nodes [

	| result |
	result := ASTPageNode new.
	result pAGE_SYMToken: (nodes at: 1).
	result leftBraceToken: (nodes at: 2).
	result addNode: (nodes at: 3) to: result declarations.
	result addTokens: ((nodes at: 4) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpage3: nodes [

	| result |
	result := ASTPageNode new.
	result pAGE_SYMToken: (nodes at: 1).
	result name: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result addTokens: ((nodes at: 4) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpage4: nodes [

	| result |
	result := ASTPageNode new.
	result pAGE_SYMToken: (nodes at: 1).
	result name: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result addNode: (nodes at: 4) to: result declarations.
	result addTokens: ((nodes at: 5) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 5) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpseudo1: nodes [

	| result |
	result := ASTPseudoNode new.
	result addToken: (nodes at: 1) to: result colonTokens.
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpseudo2: nodes [

	| result |
	result := ASTPseudoNode new.
	result addToken: (nodes at: 1) to: result colonTokens.
	result function: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpseudo3: nodes [

	| result |
	result := ASTPseudoNode new.
	result addToken: (nodes at: 1) to: result colonTokens.
	result function: (nodes at: 2).
	result functionArguments: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpseudo4: nodes [

	| result |
	result := ASTPseudoNode new.
	result addToken: (nodes at: 1) to: result colonTokens.
	result addToken: (nodes at: 2) to: result colonTokens.
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpseudo5: nodes [

	| result |
	result := ASTPseudoNode new.
	result addToken: (nodes at: 1) to: result colonTokens.
	result addToken: (nodes at: 2) to: result colonTokens.
	result function: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpseudo6: nodes [

	| result |
	result := ASTPseudoNode new.
	result addToken: (nodes at: 1) to: result colonTokens.
	result addToken: (nodes at: 2) to: result colonTokens.
	result function: (nodes at: 3).
	result functionArguments: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForpseudo_page1: nodes [

	| result |
	result := ASTPseudoPageNameNode new.
	result colonToken: (nodes at: 1).
	result identToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForruleset1: nodes [

	| result |
	result := ASTRuleSetNode new.
	result addNode: (nodes at: 1) to: result selectors.
	result addTokens: ((nodes at: 2) at: 1) to: result commaTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result selectors.
	result leftBraceToken: (nodes at: 3).
	result addTokens: ((nodes at: 4) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForruleset2: nodes [

	| result |
	result := ASTRuleSetNode new.
	result addNode: (nodes at: 1) to: result selectors.
	result addTokens: ((nodes at: 2) at: 1) to: result commaTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result selectors.
	result leftBraceToken: (nodes at: 3).
	result addNode: (nodes at: 4) to: result declarations.
	result addTokens: ((nodes at: 5) at: 1) to: result semicolonTokens.
	result addNodes: ((nodes at: 5) at: 2) to: result declarations.
	result rightBraceToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForselector1: nodes [

	| result |
	result := ASTRuleSetSelectorListNode new.
	result leftSelector: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForselector2: nodes [

	| result |
	result := ASTRuleSetSelectorListNode new.
	result leftSelector: (nodes at: 1).
	result rightSelector: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForselector3: nodes [

	| result |
	result := ASTRuleSetSelectorListNode new.
	result leftSelector: (nodes at: 1).
	result combinator: (nodes at: 2).
	result rightSelector: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForsimple_selector1: nodes [

	| result |
	result := ASTRuleSetSelectorNode new.
	result unarySelector: (nodes at: 1).
	result addObjects: (nodes at: 2) to: result selectors.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForsimple_selector_list4: nodes [

	| result |
	result := ASTSelectorNode new.
	result item: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForstylesheet1: nodes [

	| result |
	result := ASTStyleSheetNode new.
	result addTokens: (nodes at: 1) to: result commentTokens.
	result addNodes: ((nodes at: 2) at: 1) to: result imports.
	result addTokens: ((nodes at: 2) at: 2) to: result commentTokens.
	result addNodes: ((nodes at: 3) at: 1) to: result types.
	result addTokens: ((nodes at: 3) at: 2) to: result commentTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForstylesheet2: nodes [

	| result |
	result := ASTStyleSheetNode new.
	result charsetSym: (nodes at: 1).
	result charsetName: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	result addTokens: (nodes at: 4) to: result commentTokens.
	result addNodes: ((nodes at: 5) at: 1) to: result imports.
	result addTokens: ((nodes at: 5) at: 2) to: result commentTokens.
	result addNodes: ((nodes at: 6) at: 1) to: result types.
	result addTokens: ((nodes at: 6) at: 2) to: result commentTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForunary_selector2: nodes [

	| result |
	result := ASTUnarySelectorNode new.
	result selector: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSSParser >> reduceActionForvariable1: nodes [

	| result |
	result := ASTVariableNode new.
	result minusMinusToken: (nodes at: 1).
	result identToken: (nodes at: 2).
	^ result
]

{ #category : #testing }
CSSParser >> tryAllTokens [

	^ true
]
