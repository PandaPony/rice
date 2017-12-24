set incsearch
set ignorecase
set smartcase
set hlsearch
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set clipboard=unnamedplus
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar" 
set guifont=Monospace\ 10
let mapleader = " "
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'mhinz/vim-startify'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'vim-pandoc/vim-pandoc'
Plugin 'suan/vim-instant-markdown'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'honza/vim-snippets'
Plugin 'sirver/ultisnips'
Plugin 'scrooloose/vim-slumlord'
Plugin 'aklt/plantuml-syntax'
Plugin 'kannokanno/previm'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'wakatime/vim-wakatime'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/autolink'
Plugin 'godlygeek/tabular'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'reedes/vim-lexical'
Plugin 'DrawIt'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'tbabej/taskwiki'
Plugin 'powerman/vim-plugin-AnsiEsc' "Taskwiki: Adds color support in charts.
Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'dermusikman/sonicpi'
"Plugin 'reedes/vim-pencil'

" All of your Plugins must be added before the following line
" Put your non-Plugin stuff after this line
call vundle#end()            " required
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete
syntax on
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
" Restore this liine u <buffer> <C-S-h> :write \| let @+ = system("pandoc -t html " . shellescape(expand("%:p")))<CR>

" Convert pandoc buffer to HTML and copy to system clipboard
autocmd FileType pandoc nnoremap <buffer> <C-S-h> :write \| let @+ = system("pandoc -t html " . shellescape(expand("%:p")))<CR>
" Convert pandoc buffer to reStructuredText and copy to system clipboard
autocmd FileType vimwiki nnoremap <buffer> <C-S-t> :write \| let @+ = system("pandoc -t rst " . shellescape(expand("%:p")))<CR>
" map <F11> :Goyo <bar> :Limelight!! <bar> :TogglePencil <CR>
map <F11> :Goyo <bar> :Limelight!! <CR>
nmap <leader>v :vsplit $MYVIMRC<CR>

" Plugin settings
" vimwiki with markdown support
" let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki','syntax': 'markdown','ext': '.md','list_margin':'-1'}]
" helppage -> :h vimwiki-syntax 

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>ml :set filetype=markdown<CR>:PrevimOpen<CR>:set filetype=vimwiki<CR>
map <leader>ml :set filetype=markdown<CR>:PrevimOpen<CR><Esc>:set filetype=vimwiki<CR>
let g:pandoc#spell#enabled=0
"Autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
let g:vimwiki_folding='expr'
let g:ycm_filetype_blacklist = {}
" YCM disabled for vimwiki table work
" let g:loaded_youcompleteme = 1
let g:vimwiki_table_mappings= 0
" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetsDir = '~/.vim/MySnippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "MySnippets"]
let g:UltiSnipsEditSplit="vertical"
" Previm
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'chromium'
let g:previm_show_header = 0
let g:ackprg = 'ag --nogroup --nocolor --column'
"let g:ackprg = 'ag --vimgrep --smart-case'                                                   
cnoreabbrev ag Ack                                                                           
cnoreabbrev aG Ack                                                                           
cnoreabbrev Ag Ack                                                                           
cnoreabbrev AG Ack  
nmap ö :
autocmd Filetype vimwiki map <F4> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>
" Todo Pipe > Handle pdf file size. Script below is proof (200MB > 2.9MB)
"gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -sOutputFile=output.pdf input.pdf
" http://vimcasts.org/episodes/how-to-fold/
nnoremap <silent> <F2> :set relativenumber!<cr>
nn <F7> :setlocal spell! spell?<CR>
nnoremap <esc><esc> :silent! nohls<cr>
"nmap j gj
"nmap k gk
nmap =j :%!python -m json.tool<CR>
" Autocorrect slows down startup
"autocmd filetype markdown,vimwiki call AutoCorrect()
"https://github.com/reedes/vim-lexical
"augroup lexical
"  autocmd!
"  autocmd FileType markdown,vimwiki call lexical#init()
"augroup END

" Help stuff
nnoremap <leader>h :tabnew<CR>:help<CR><C-w><C-w>:quit<CR>
autocmd Filetype help nmap <CR> <C-]>
autocmd Filetype help nmap <BS> <C-t>
cabbrev h vert h

" Display value from 'Label' key in folded json
set foldtext=FoldText()
function! FoldText()
  let l:fs = match(getline(v:foldstart, v:foldend), '"label":')
  if l:fs < 0
    return foldtext()
  endif
  let l:label = matchstr(getline(v:foldstart + l:fs),
        \ '"label":\s\+"\zs[^"]\+\ze"')
  let l:ft = substitute(foldtext(), ': \zs.\+', l:label, '')
  return l:ft
endfunction
" Airline
" Should show full path..not working :/
" let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#wordcount#enabled = 1
let g:livepreview_previewer = 'mupdf'
let g:livepreview_engine = 'xelatex'
nmap <F8> :LLPStartPreview<cr>
set updatetime=1000
