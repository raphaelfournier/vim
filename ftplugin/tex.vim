"imap <buffer> <leader>foot <Plug>Tex_InsertItemOnThisLine
imap <leader>it <Plug>Tex_InsertItemOnThisLine
" let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_UseMakefile=1
let g:Tex_ViewRule_pdf='zathura'
let g:Tex_Menus=0
let g:Tex_FoldedCommands='ctable'
" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
