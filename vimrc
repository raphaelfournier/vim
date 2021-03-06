"""""""""""""""""""""""""
" Editor Options
"""""""""""""""""""""""""
set textwidth=80
syn on
" nbsp affiches par '·'
set listchars=nbsp:·
" Show special characters in the file.
" set list
" set nu
set ruler
" paste mode
set pastetoggle=<F11>
" incremental search
set is
" highlight
set hlsearch
set scrolloff=2
" use tabs as spaces
set expandtab
set sw=2
set ts=2
" export html ok
let html_use_css = 1
set nojoinspaces
"set mouse=a
"set ttymouse=urxvt
" completion
set wildmenu
set wildmode=list:longest,full
set ignorecase 
set smartcase
set title
set laststatus=2
set statusline=%<%F\ %h%m%r%=[%{&fo}]\ %=[TYPE=%Y\ %{&ff}]\ %=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l/%L,%c%V%)\ %P
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=108 ctermbg=black
  elseif a:mode == 'r'
    hi statusline ctermfg=magenta ctermbg=black
  else
    hi statusline ctermbg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermbg=black ctermfg=red

" default the statusline to green when entering Vim
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

if has("autocmd") 
  autocmd! bufwritepost .vimrc source ~/.vimrc 
endif

autocmd Filetype html source ~/.vim/html.vim 

au BufNewFile,BufRead *.plt,.plot,.gnuplot setf gnuplot
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%74v.*/
" augroup END

augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

"""""""""""""""""""""""""
" Colors 
"""""""""""""""""""""""""
set t_Co=256
" let g:zenburn_alternate_Visual = 1
colors zenburn
" colors solarized
" colorscheme solarized
"colorscheme bubblegum
colorscheme zenburn
" syntax enable
" set background=dark
" colorscheme solarized


"""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""
" LATEX 
"""""""""""""""""""""""""
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin indent on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
filetype plugin indent on
set grepprg=grep\ -nH\ $*
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

let s:spell_francais_iskeyword  = "@,48-57,_,192-255,39,Â½,Ã¦,Â¼,Ã†,-"
let s:spell_english_iskeyword = "@,48-57,_,192-255,^192-255"

let g:acp_behaviorSnipmateLength=1

"""""""""""""""""""""""""
" VimViki
"""""""""""""""""""""""""
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_auto_checkbox=1
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/public_html/wiki/'}]

"""""""""""""""""""""""""
" Bindings
"""""""""""""""""""""""""
let mapleader = ","

map ,c :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,u :s/^#//<CR> <Esc>:nohlsearch <CR>
map ,nu :set invnumber<CR>
map ,lc :s/^/%/<CR> <Esc>:nohlsearch <CR>
map ,lu :s/^%//<CR> <Esc>:nohlsearch <CR>
map ,pc :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,pu :s/^\/\///<CR> <Esc>:nohlsearch <CR>
map ,ac :s/^/--/<CR> <Esc>:nohlsearch <CR>
map ,au :s/^--//<CR> <Esc>:nohlsearch <CR>
map ,fr :setlocal spell spelllang=fr<CR>
map ,en :setlocal spell spelllang=en<CR>
map ,ns :set nospell<CR>
map <F2> :NERDTreeToggle<CR>
" decompte de mots latex
map ,wc :w !detex \| wc -w<CR>
" permet de ne pas retaper les longs chemins
map ,ed :e <C-R>=expand("%:p:h") . "/" <CR>
" mutt
map! ;cord <esc>/^-- $<CR>kI<cr><cr>Cordialement,<esc>ggIBonjour,<cr><cr><esc>,fr
map! ;salu <esc>/^-- $<CR>kI<cr><cr>À bientôt,<esc>ggISalut,<cr><cr><esc>,fr
map! ;rega <esc>/^-- $<CR>kI<cr><cr>Regards,<esc>ggIHello,<cr><cr><esc>,en
" nnoremap ;sig :normal i;sig<cr>
nnoremap ;cord :normal i;cord<cr>
nnoremap ;salu :normal i;salu<cr>
nnoremap ;rega :normal i;rega<cr>
" vim-task
inoremap <silent> <buffer> ,m <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> ,m :call Toggle_task_status()<CR>
autocmd BufNewFile,BufRead todo.txt,*.task,*.tasks  setfiletype task
autocmd BufNewFile,BufRead *.mdwn  setfiletype markdown
" Two semicolons are easy to type.
inoremap ;; <esc>
imap jj <Esc>

nnoremap ,t :TlistToggle<cr>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_WinWidth = 40


"""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""
iab _rflip6 <raphael.fournier@lip6.fr>
iab _rf Raphaël Fournier
iab _rfnet <raphael@raphaelfournier.net>
iab _rfnet_ www.raphaelfournier.net
iab _rflavabit <fournier@lavabit.com>
iab _ab_ À bientôt,
iab _bj_ Bonne journée,
iab _cad_ c'est-à-dire
iab _pap_ pair-à-pair
iab _id_ <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
iab _ML_ Matthieu Latapy 
iab _ac <<gtdAction "<++>" "<++>">>
inoremap <c-j> <Esc>/<++><CR><Esc>cf>

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.rst set syntax=rest
augroup filetypedetect
  au BufNewFile,BufRead *.wiki set ft=dokuwiki
augroup END 
augroup MUTT
au BufRead ~/.mutt/temp/mutt* set spell " <-- vim 7 required
au BufRead ~/.mutt/temp/mutt* set nonu
au BufRead ~/.mutt/temp/mutt* nmap  <F5>  gqap
au BufRead ~/.mutt/temp/mutt* nmap  <F6>  gqqj
au BufRead ~/.mutt/temp/mutt* nmap  <F7>  kgqj
au BufRead ~/.mutt/temp/mutt* map!  <F5>  <ESC>gqapi
au BufRead ~/.mutt/temp/mutt* map!  <F6>  <ESC>gqqji
au BufRead ~/.mutt/temp/mutt* map!  <F7>  <ESC>kgqji
"  au BufRead ~/.mutt/temp/mutt* nmap  <F3>  gqap
"  au BufRead ~/.mutt/temp/mutt* nmap  <F4>  gqqj
"  au BufRead ~/.mutt/temp/mutt* nmap  <F5>  kgqj
"  au BufRead ~/.mutt/temp/mutt* map!  <F3>  <ESC>gqapi
"  au BufRead ~/.mutt/temp/mutt* map!  <F4>  <ESC>gqqji
"  au BufRead ~/.mutt/temp/mutt* map!  <F5>  <ESC>kgqji
augroup END

let g:languagetool_jar = "/usr/share/languagetool/LanguageTool.jar"
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
" Easier to type, and I never use the default behavior.
"noremap H ^
"noremap L g_
" It's 2011.
noremap j gj
noremap k gk
" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Fuck you too, manual key.
nnoremap K <nop>
" Better Completion
set completeopt=longest,menuone,preview
" Sudo to write
cmap w!! w !sudo tee % >/dev/null
