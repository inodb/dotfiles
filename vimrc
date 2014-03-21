" vi:syntax=vim
"Formatting for c++"
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -pA8s4

" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" For taglist plugin
filetype on
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F5> :TlistUpdate<CR>

" Remap code completion to Ctrl+Space {{{2
" inoremap <Nul> <C-x><C-o> 
inoremap <Nul> <C-n>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
":if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
nnoremap <silent> <C-S> :update<CR>
imap <c-s> <c-o><c-s>

" Save fold
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" Shell ------------------------------------------------------------------- {{{

function! s:ExecuteInShell(command) " {{{
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
    echo 'Shell command ' . command . ' executed.'
endfunction " }}}
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
nnoremap <leader>! :Shell

" }}}

" Open make in right side of window
nnoremap <silent> <F9> :make!<bar>vert copen 79<CR>h

" Change keyboard behaviour doesn't work!!
set term=builtin_ansi
set t_ku=[A
set t_kd=[B
set t_kr=[C
set t_kl=[D
set t_kD=[3~
set t_kh=[1~
set t_@7=[4~

" Color snakemake file.
au BufRead,BufNewFile Snakefile set syntax=python

" Some macros to remember:
" Searches for the ncbi taxonomy id in the fourth column yanks it, deletes
" existing columns, runs a script to get the taxonomy info and adds it to the
" previous line 
" 3f	lvt	yF	d$o"0pV:!xargs -I searchterms python -W ignore /bubo/home/h16/inod/gitrepos/biorhino-tools/scripts/br-ncbi-get-lineage-from-organism.py --table --printid 'searchterms'

" Some substitutions to remember: 
" Replaces tabs with numbers, so column number can be easily seen
" let n=[1] | s/^I/\=map(n,'v:val+1')/g

" Error map
"nnoremap <Leader>p :cp<CR>
"nnoremap <Leader>n :cn<CR>

" Buffer map 
"nnoremap  :bn<CR>
"nnoremap  :bp<CR>

" Pymode 
let g:pymode_lint_ignore = "E501,E127,E128,E203"


" CtrlP
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlP<CR>

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
" Tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" Settings at the bottom, smth weird with vimrc no proper syntax colors (CtrlP maybe)?
set bg=dark
set backspace=indent,eol,start " backspace over everything in insert mode "
set autoindent
set expandtab
set tw=79 sw=4 ts=4
set autoindent
set number
set hlsearch