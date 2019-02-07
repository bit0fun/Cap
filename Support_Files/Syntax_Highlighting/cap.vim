" ARC Syntax highlighting for Vim
" Language: arC
" Maintainer: Dylan Wadler <dylan@fusion-core.org>
" Last Change: 2019 Jan 5

if exists("b:current_syntax")
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

" let s:ft = matchstr(&ft, '^\([^.]\)\+')


" Keywords
syn keyword capStatement break return continue asm
syn keyword capConditional if else switch
syn keyword capLabel case default
syn keyword capLoop while for do afor
syn keyword capType void int dint qint float dfloat qfloat char string

" It's easy to accidentally add a space after a backslash that was intended
" for line continuation.  Some compilers allow it, which makes it
" unpredictable and should be avoided.
syn match	capBadContinuation contained "\\\s\+$"

" Highlight trailing white space
syn match	capSpaceError	display excludenl "\s\+$"
"syn match	capSpaceError	display " \+\t"me=e-1

syn match	capSpecial	display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match	capSpecial	display contained "\\\(u\x\{4}\|U\x\{8}\)"


syn region capDescBlock start="{" end="}" fold transparent

" Integer with - + or nothing in front
syn match capNumbers display transparent "\<\d\|\.\d" contains=capNumber,capFloat

"highlighting for comments 
syn match capNumbersCom	display contained transparent "\<\d\|\.\d" contains=capNumber,capFloat

syn match capNumber display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"

syn match capFloat display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match capFloat display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match capFloat display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match capFloat display contained "\d\+e[-+]\=\d\+[fl]\=\>"


" defines, macros, symbols, etc
syn region capIncluded display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match capIncluded display contained "<[^>]*>"
syn match capInclude display "^\s*\zs\(%:\|#\)\s*include\>\s*["<]" contains=capIncluded
syn match capInclude display "^\s*\zs\(%:\|#\)\s*incdef\>\s*["<]" contains=capIncluded


syn region	capBadBlock	keepend start="{" end="}" contained containedin=capParen,capBracket,capBadBlock transparent fold

syn cluster capPreProcGroup contains=capMacro,capSym,capInclude,capErrInParen,capErrInBracket,capUserLabel,capFloat,capString,capBadBlock


syn region	capMacro		start="^\s*\zs\(%:\|#\)\s*\(macro\|mdel\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@capPreProcGroup,@Spell
syn region	capMacro		start="^\s*\zs\(%:\|#\)\s*\(sym\|sdel\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@capPreProcGroup,@Spell

syn match	cUserCont	display "^\s*\zs\I\i*\s*:$" contains=@cLabelGroup
syn match	cUserCont	display ";\s*\zs\I\i*\s*:$" contains=@cLabelGroup
syn match	cUserCont	display "^\s*\zs\I\i*\s*:[^:]"me=e-1 contains=@cLabelGroup
syn match	cUserCont	display ";\s*\zs\I\i*\s*:[^:]"me=e-1 contains=@cLabelGroup

syn match	capUserLabel	display "\I\i*" contained


" syn match capNumber '\d\+' 
" syn match capNumber '[^-+]\d\+'

" Floating point number with decimal no E or e 
syn match capNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-)
syn match capNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match capNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-)
syn match capNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match capNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

syn region capString start='"' end='"' contained
syn match capCommentline "//.*$" extend
syn region capComment start="\/\*" end="\*\/" extend

" syn match capPreProc "#.*$"

" Nonproblematic operators 
syn match capOperator "[~\^<>=!@&|%+\-]"

" Handling of problematic operators 
" get division
" syn match capOperator "[(\w|\s)][/][(\w|\s|=)]"
syn match capOperator "[/][=]"
syn match capOperator "[^/*][/][^*/]"

" get multiplication
syn match capOperator "[*][=]"
syn match capOperator "[^/][*][^/]"


"syn keyword capOperator + - = % & \| >> << >>> <<< > * / ^
syn keyword capOperator typeof sizeof 
syn keyword capStructure struct union enum typedef
syn keyword capStorageModifier register extern static inline thread_local global private

hi link capStatement 		Keyword
hi link capType	  	 		Type
hi link capConditional 		Conditional
hi link capLoop				Repeat
hi link capComment	   		Comment
hi link capCommentline 		Comment
hi link capNumber	   		Constant
hi link capFloat			Float
hi link	capSpaceError		Error
hi link capBadContinuation 	Error
hi link capPreProc	   		PreProc
hi link capDescBlock   		Statment
hi link capString	   		String
hi link capOperator			Operator
hi link capUserLabel		Label
hi link capStructure		Structure
hi link capStorageModifier	StorageClass
hi link capInclude			Include
hi link capIncluded			String
hi link capSpecial			Special 
hi link capMacro			Macro
hi link capSym				Macro
let b:current_syntax = "ARC"
