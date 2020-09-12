" Vim syntax file
" Language: specification
" Mainteiner: Juan Manuel Viel
" Latest Revision: 1 Jun 2020

if exists ("b:current_syntax")
	finish
endif



" Keywords

syn keyword tadDeclaration TAD FIN 
syn keyword delimitadores generos observadores básicos generadores otras operaciones axiomas
syn keyword bool True False 
syn keyword conditionals if then else fi

syn match operators "\v\+"
syn match operators "\v-"
syn match operators "\v≡"
syn match operators "\v×" 
syn match operators "\v→" 
syn match operators "\v:" 
syn match operators "\v⇒" 
syn match operators "\v〈" 
syn match operators "\v〉" 
syn match operators "\v\="
syn match operators "\v∈" 
syn match operators "\v¬"
syn match operators "\v\&" 
syn match operators "\v∧" 
syn match operators "\v∨" 
syn match operators "\v・" 
syn match operators "\v⋅" 

	" Integers
	
	syn match celNumber '\d\+'

" Regions

syn match comment '--.*$'

" Highlight

hi def link conditionals 	Conditional
hi def link bool 			Boolean
hi def link operators 		Operator
hi def link celNumber    	Number
hi def link tadDeclaration  Statement
hi def link delimitadores   Statement
hi def link comment 	 	Comment
