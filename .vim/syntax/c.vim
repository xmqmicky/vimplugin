"========================================================
" Highlight All Function
"========================================================
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunction        gui=NONE cterm=bold  ctermfg=DarkBlue

"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn match       cMathOperator     display "[-+\*/%=]"
" C pointer operators
syn match       cPointerOperator  display "->\|\."
" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match       cLogicalOperator  display "=="
" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match       cLogicalOperatorError display "\(&&\|||\)="

" Math Operator
hi cMathOperator            gui=NONE cterm=bold ctermfg=Blue
hi cPointerOperator         gui=NONE cterm=bold ctermfg=Blue
hi cLogicalOperator         gui=NONE cterm=bold ctermfg=Blue
hi cBinaryOperator          gui=NONE cterm=bold ctermfg=Blue
hi cBinaryOperatorError     gui=NONE cterm=bold ctermfg=Blue
hi cLogicalOperator         gui=NONE cterm=bold ctermfg=Blue
hi cLogicalOperatorError    gui=NONE cterm=bold ctermfg=Blue
