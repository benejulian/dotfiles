" Copied from /usr/share/vim/vim82/vimrc_example.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:	Matt Julian
" Last change:	2020/04/03
" To use it in Unix, copy it to:  ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" From Default Example """""""""""""""""""""""""""

if v:progname =~? "evim" 			    " If started as evim then exit
	finish
endif
source $VIMRUNTIME/defaults.vim 		" Get the defaults that most users want.

if has("vms")
       	set nobackup				    " do not keep a backup file, use versions instead
else
	set backup 				            " keep a backup file (restore to previous version)
if has('persistent_undo')
	set undofile				        " keep an undo file (undo changes after closing)
endif
endif
augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=100	" set 'textwidth' to N characters for all text files.
augroup END
 						                """ Add optional packages
if has('syntax') && has('eval')
  packadd! matchit				        " matchit makes the % command work better,
endif                                   " but it is not backwards compatible. The
                                        " ! loads it when the
						                " plugins are loaded instead
						                " instead of right away.
iunmap <C-U>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""

 			                			""" Statusline
 						                """ run :so /usr/share/vim/vim82/syntax/hitest.vim
set laststatus=2
set statusline+=:\ %F\ \ 			    " show path to file
set statusline+=\ \ C:%-3b\ H:%-2B\ \ 	" show char # and hex # of current character
set statusline+=%=				        " division between left & right sides of statusline
set statusline+=\ %4l\|%2c\ \			" show line # and col #
set statusline+=%m%y				    " show modified [+] and filetype

						                """ Editor

syntax on					            " turn on syntax highlighting
set number					            " turn on line numbering
"set mouse=a					            " use mouse in all modes
"set termguicolors

:highlight Comment ctermfg=1 			" syntax highlighting
:highlight LineNr ctermfg=1			    " adjustments
:highlight ErrorMsg ctermfg=2 ctermbg=0
:highlight StatusLine ctermbg=0 ctermfg=1

let mapleader=" "
"						vim		vim
" cmd		event		file		mode		cmd
"
" vertically center document when entering insert mode
autocmd 	InsertEnter 	* 		norm 		zz
" remove trailing whitespace on save
autocmd 	BufWritePre 	* 		%s/\s\+$//e
" Something About Splitting?
nnoremap 	<leader>h 					:split<Space>
nnoremap 	<leader>v 					:vsplit<Space>

" tab settings
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" cursor row & col highlight
" need to find a better hightlight color first
"set cursorline
"set cursorcolumn

" set more verbose tab completions
set wildmode=longest,list,full

" spawn new windows to the right or below
set splitbelow splitright


