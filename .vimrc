" to install plugins, install Vundle and then run :PluginInstall in vim. git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" to install youcompleteme follow instructions at: https://github.com/Valloric/YouCompleteMe/blob/master/README.md#ubuntu-linux-x64
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set nu " enable line number


Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim' " auto-indentation
Plugin 'Valloric/YouCompleteMe' " auto-compelte
Plugin 'vim-syntastic/syntastic' " checks your syntax on each save
Plugin 'nvie/vim-flake8' " checks PEP8 on each save
Plugin 'jnurmine/Zenburn' " colour scheme for terminal
Plugin 'altercation/vim-colors-solarized' " colour scheme for GUI mode
Plugin 'scrooloose/nerdtree' " file browsing
Plugin 'jistr/vim-nerdtree-tabs' " tabs in nerdtree
Plugin 'kien/ctrlp.vim' " super search by perssing crtl+p
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " status bar


call vundle#end()
filetype plugin indent on


" split stuff
" Ctrl-j move to the split below
" Ctrl-k move to the split above
" Ctrl-l move to the split to the right
" Ctrl-h move to the split to the left
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Pyhton indentation - PEP8 standard
au BufNewFile,BufRead *.py |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF8 support
set encoding=utf-8

" YouCompleteMe configs:
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF

" makes you code look pretty
let python_highlight_all=1
syntax on

" choose the right colour scheme based on mode
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" toggle to dark mode in solarized colour scheme by pressing F5
call togglebg#map("<F5>")

" show nerd tree automatically.
autocmd VimEnter * NERDTree

" let nerdtree show hidden files.
let NERDTreeShowHidden=1

"show nerdtree when crtl-n is pressed
map <C-n> :NERDTreeToggle<CR>

" close vim if only windows that's open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" nerdtree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
