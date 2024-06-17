Class {
	#name : #CSSScannerTest,
	#superclass : #TestCase,
	#category : #'SmaCC_CSS_Parser'
}

{ #category : #tests }
CSSScannerTest >> testBasic [

	CSSParser parse: '@media all {
 .featherlight {
  display:none;
  position:fixed;
  top:0;
  right:0;
  bottom:0;
  left:0;
  z-index:2147483647;
  text-align:center;
  white-space:nowrap;
  cursor:pointer;
  background:#333;
  background:rgba(0,0,0,0)
 }
 .featherlight:last-of-type {
  background:rgba(0,0,0,.8)
 }
 .featherlight:before {
  content:'''';
  display:inline-block;
  height:100%;
  vertical-align:middle;
  margin-right:-.25em
 }
 .featherlight .featherlight-content {
  position:relative;
  text-align:left;
  vertical-align:middle;
  display:inline-block;
  overflow:auto;
  padding:25px 25px 0;
  border-bottom:25px solid transparent;
  min-width:30%;
  margin-left:5%;
  margin-right:5%;
  max-height:95%;
  background:#fff;
  cursor:auto;
  white-space:normal
 }
 .featherlight .featherlight-inner {
  display:block
 }
 .featherlight .featherlight-close-icon {
  position:absolute;
  z-index:9999;
  top:0;
  right:0;
  line-height:25px;
  width:25px;
  cursor:pointer;
  text-align:center;
  font:Arial,sans-serif;
  background:#fff;
  background:rgba(255,255,255,.3);
  color:#000
 }
 .featherlight .featherlight-image {
  width:100%
 }
 .featherlight-iframe .featherlight-content {
  border-bottom:0;
  padding:0
 }
 .featherlight iframe {
  border:0
 }
}
'
]

{ #category : #tests }
CSSScannerTest >> testColumnColumnAfter [

	CSSParser parse: '::after,::before{box-sizing:border-box}'
]

{ #category : #tests }
CSSScannerTest >> testFontFace [

	CSSParser parse: '/*!
 *  Font Awesome 4.7.0 by @davegandy - http://fontawesome.io - @fontawesome
 *  License - http://fontawesome.io/license (Font: SIL OFL 1.1, CSS: MIT License)
 */@font-face {
 font-family:''FontAwesome'';
 src:url(''../fonts/fontawesome-webfont.eot?v=4.7.0'');
 src:url(''../fonts/fontawesome-webfont.eot?#iefix&v=4.7.0'') format(''embedded-opentype''),
 url(''../fonts/fontawesome-webfont.woff2?v=4.7.0'') format(''woff2''),
 url(''../fonts/fontawesome-webfont.woff?v=4.7.0'') format(''woff''),
 url(''../fonts/fontawesome-webfont.ttf?v=4.7.0'') format(''truetype''),
 url(''../fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular'') format(''svg'');
 font-weight:normal;
 font-style:normal
}'
]

{ #category : #tests }
CSSScannerTest >> testImportant [
	CSSParser
		parse: '.round-button {
    display: inline-block;
    width:48px;
    height:48px;
    line-height:48px;
    border-radius: 50%;
    color:#fff ! important;
    text-align:center;
    text-decoration:none;
    background: #4579bc;
    font-size:20px;
    font-weight:bold;
}'
]

{ #category : #tests }
CSSScannerTest >> testImportantWithoutSpace [
	CSSParser
		parse: '.round-button {
    display: inline-block;
    width:48px;
    height:48px;
    line-height:48px;
    border-radius: 50%;
    color:#fff !important;
    text-align:center;
    text-decoration:none;
    background: #4579bc;
    font-size:20px;
    font-weight:bold;
}'
]

{ #category : #tests }
CSSScannerTest >> testKeyframes [

	CSSParser parse: '@-webkit-keyframes fa-spin {
 0% {
  -webkit-transform:rotate(0deg);
  transform:rotate(0deg)
 }
 100% {
  -webkit-transform:rotate(359deg);
  transform:rotate(359deg)
 }
}
@keyframes fa-spin {
 0% {
  -webkit-transform:rotate(0deg);
  transform:rotate(0deg)
 }
 100% {
  -webkit-transform:rotate(359deg);
  transform:rotate(359deg)
 }
}'
]

{ #category : #tests }
CSSScannerTest >> testKeyFrames2 [

	CSSParser parse: '@keyframes ping {
  75%, 100% {
    transform: scale(2);
    opacity: 0;
  }
}'
]

{ #category : #tests }
CSSScannerTest >> testLinearGradientFunction [

	CSSParser parse: '.bg-gradient-to-t {
  background-image: linear-gradient(to top, var(--gradient-color-stops));
}
'
]

{ #category : #tests }
CSSScannerTest >> testMediaExtension [

	CSSParser parse: '@media only screen and (max-width:1024px) {
 .featherlight .featherlight-content {
  margin-left:10px;
  margin-right:10px;
  max-height:98%;
  padding:10px 10px 0;
  border-bottom:10px solid transparent
 }
}'
]

{ #category : #tests }
CSSScannerTest >> testTildaIdentifier [

	CSSParser parse: '.space-y-0 > :not(template) ~ :not(template) {
  --space-y-reverse: 0;
  margin-top: calc(0px * calc(1 - var(--space-y-reverse)));
  margin-bottom: calc(0px * var(--space-y-reverse));
}'
]

{ #category : #tests }
CSSScannerTest >> testUnicode [

	CSSParser parse: '.fa-window-minimize {
 content:"\f2d1"
}'
]

{ #category : #tests }
CSSScannerTest >> testVarWithCommentArg [

	CSSParser parse: '.ordinal, .slashed-zero, .lining-nums, .oldstyle-nums, .proportional-nums, .tabular-nums, .diagonal-fractions, .stacked-fractions {
  --font-variant-numeric-ordinal: var(--tailwind-empty,/*!*/ /*!*/);
  --font-variant-numeric-slashed-zero: var(--tailwind-empty,/*!*/ /*!*/);
  --font-variant-numeric-figure: var(--tailwind-empty,/*!*/ /*!*/);
  --font-variant-numeric-spacing: var(--tailwind-empty,/*!*/ /*!*/);
  --font-variant-numeric-fraction: var(--tailwind-empty,/*!*/ /*!*/);
  font-variant-numeric: var(--font-variant-numeric-ordinal) var(--font-variant-numeric-slashed-zero) var(--font-variant-numeric-figure) var(--font-variant-numeric-spacing) var(--font-variant-numeric-fraction);
}'
]
