" Vim syntax file
" Language: FENNEL
" Maintainer: Calvin Rose

if exists("b:current_syntax")
    finish
endif

let s:cpo_sav = &cpo
set cpo&vim

if has("folding") && exists("g:fennel_fold") && g:fennel_fold > 0
    setlocal foldmethod=syntax
endif

syntax keyword FennelCommentTodo contained FIXME XXX TODO FIXME: XXX: TODO:

" FENNEL comments
syn match FennelComment ";.*$" contains=FennelCommentTodo,@Spell

syntax match FennelStringEscape '\v\\%([abfnrtv'"\\]|x[[0-9a-fA-F]]\{2}|25[0-5]|2[0-4][0-9]|[0-1][0-9][0-9])' contained
syntax region FennelString matchgroup=FennelStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=FennelStringEscape,@Spell
syntax region FennelString matchgroup=FennelStringDelimiter start=/'/ skip=/\\\\\|\\'/ end=/'/ contains=FennelStringEscape,@Spell

syn keyword FennelConstant nil 

syn keyword FennelBoolean true 
syn keyword FennelBoolean false

" Fennel special forms
syn keyword FennelSpecialForm %
syn keyword FennelSpecialForm *
syn keyword FennelSpecialForm +
syn keyword FennelSpecialForm +
syn keyword FennelSpecialForm -
syn keyword FennelSpecialForm ->
syn keyword FennelSpecialForm ->>
syn keyword FennelSpecialForm -?>
syn keyword FennelSpecialForm -?>>
syn keyword FennelSpecialForm .
syn keyword FennelSpecialForm /
syn keyword FennelSpecialForm //
syn keyword FennelSpecialForm :
syn keyword FennelSpecialForm <
syn keyword FennelSpecialForm <=
syn keyword FennelSpecialForm =
syn keyword FennelSpecialForm >
syn keyword FennelSpecialForm >=
syn keyword FennelSpecialForm and
syn keyword FennelSpecialForm def
syn keyword FennelSpecialForm do
syn keyword FennelSpecialForm doto
syn keyword FennelSpecialForm each
syn keyword FennelSpecialForm fn
syn keyword FennelSpecialForm for
syn keyword FennelSpecialForm global
syn keyword FennelSpecialForm if
syn keyword FennelSpecialForm lambda
syn keyword FennelSpecialForm let
syn keyword FennelSpecialForm local
syn keyword FennelSpecialForm lua
syn keyword FennelSpecialForm match
syn keyword FennelSpecialForm not=
syn keyword FennelSpecialForm or
syn keyword FennelSpecialForm partial
syn keyword FennelSpecialForm require-macros
syn keyword FennelSpecialForm set
syn keyword FennelSpecialForm set-forcibly!
syn keyword FennelSpecialForm tset
syn keyword FennelSpecialForm values
syn keyword FennelSpecialForm var
syn keyword FennelSpecialForm when
syn keyword FennelSpecialForm while
syn keyword FennelSpecialForm ~=
syn keyword FennelSpecialForm λ

" Fennel Symbols
let s:symcharnodig = '\!\$%\&\#\*\+\-./:<=>?A-Z^_a-z|\x80-\U10FFFF'
let s:symchar = '0-9' . s:symcharnodig
execute 'syn match FennelSymbol "\v<%([' . s:symcharnodig . '])%([' . s:symchar . '])*>"'
execute 'syn match FennelKeyword "\v<:%([' . s:symchar . '])*>"'
unlet! s:symchar s:symcharnodig

syn match FennelQuote "`"
syn match FennelQuote "@"

" FENNEL numbers
syntax match FennelNumber "\v\c<[-+]?\d*\.?\d*%([eE][-+]?\d+)?>"
syntax match FennelNumber "\v\c<[-+]?0x[0-9A-F]*\.?[0-9A-F]*>"

" Grammar root
syntax cluster FennelTop contains=@Spell,FennelComment,FennelConstant,FennelQuote,FennelKeyword,FennelSymbol,FennelNumber,FennelString,FennelList,FennelArray,FennelTable,FennelSpecialForm,FennelBoolean

syntax region FennelList matchgroup=FennelParen start="("  end=")" contains=@FennelTop fold
syntax region FennelArray matchgroup=FennelParen start="\[" end="]" contains=@FennelTop fold
syntax region FennelTable matchgroup=FennelParen start="{"  end="}" contains=@FennelTop fold

" Highlight superfluous closing parens, brackets and braces.
syntax match FennelError "]\|}\|)"

syntax sync fromstart

" Highlighting
hi def link FennelComment Comment
hi def link FennelSymbol Identifier
hi def link FennelNumber Number
hi def link FennelConstant Constant
hi def link FennelKeyword Keyword
hi def link FennelSpecialForm Special
hi def link FennelString String
hi def link FennelBuffer String
hi def link FennelStringDelimiter String
hi def link FennelBoolean Boolean

hi def link FennelQuote SpecialChar
hi def link FennelParen Delimiter

let b:current_syntax = "fennel"

let &cpo = s:cpo_sav
unlet! s:cpo_sav
