""""""""""""
"  Common  "
""""""""""""
let mapleader = "\<space>"
set timeoutlen=300 ttimeoutlen=0 "Make ESC and entering insert mode fast again :)
set encoding=utf-8
set incsearch
set ignorecase
set smartcase
set hlsearch
set number                        " Show current line number
set relativenumber                " Show relative line numbers
set clipboard=unnamedplus
set nocompatible                  " be iMproved, required
filetype off                      " required
"""""""""""""
"  Plugins  "
"""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'     " let Vundle manage Vundle, required
                                  " Keep Plugin commands between vundle#begin/end.
                                  " plugin on GitHub repo
Plugin 'tpope/vim-repeat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/lim.vim'
Plugin 'mhinz/vim-startify'
Plugin 'suan/vim-instant-markdown'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
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
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'tbabej/taskwiki'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'ledger/vim-ledger'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'tpope/vim-fugitive'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'vim-pandoc/vim-pandoc'
"Plugin 'scrooloose/vim-slumlord'
"Plugin 'aklt/plantuml-syntax'
"Plugin 'powerman/vim-plugin-AnsiEsc' "Taskwiki: Adds color support in charts.
"Plugin 'dermusikman/sonicpi'
"Plugin 'reedes/vim-pencil'
" All of your Plugins must be added before the following line
" Put your non-Plugin stuff after this line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""
"  PluginSettings  "
""""""""""""""""""""
"" Autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"" YouCompleteMe
let g:ycm_filetype_blacklist = {}
" let g:loaded_youcompleteme = 1

"" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "MySnippets"]
let g:UltiSnipsEditSplit="vertical"

"" Previm
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'chromium'
let g:previm_show_header = 0

"" AG
let g:ackprg = 'ag --nogroup --nocolor --column'
"let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

"" Vimwiki
let g:vimwiki_table_mappings= 0 " YCM disabled for vimwiki table work
let g:vimwiki_folding='expr'
autocmd Filetype vimwiki map <F4> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'} " vimwiki with markdown support
let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki','syntax': 'markdown','ext': '.md','list_margin':'-1'}]
" helppage -> :h vimwiki-syntax 
" let g:vimwiki_global_ext = 0

"" Help stuff
nnoremap <leader>h :tabnew<CR>:help<CR><C-w><C-w>:quit<CR>
autocmd Filetype help nmap <CR> <C-]>
autocmd Filetype help nmap <BS> <C-t>
cabbrev h vert h

""" JSON
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

"" Airline
let g:airline#extensions#wordcount#enabled = 1

"" LaTex
let g:livepreview_previewer = 'mupdf'
let g:livepreview_engine = 'xelatex'
nmap <F8> :LLPStartPreview<cr>
set updatetime=1000

"" Startify
" A list of files to bookmark
  let g:startify_bookmarks=[
  \ '~/.vimrc',
  \ '~/fin.dat',
  \ '~/.ledgerrc'
  \]

"" Ledger
let g:ledger_maxwidth = 80
let g:ledger_fillstring = '    -'
set list           " Display list chars
set listchars=tab:▸·,trail:· " Display Tabs and trailing white space
au BufNewFile,BufRead *.ldg,*.ledger,*.dat setf ledger | comp ledger
"let g:ledger_extra_options = '--pedantic --explicit --check-payees'
if exists('g:ycm_filetype_blacklist')
 call extend(g:ycm_filetype_blacklist, { 'ledger': 1 })
endif

"""""""""
"  GUI  "
"""""""""

set guioptions-=m                 " remove menu bar
set guioptions-=T                 " remove toolbar
set guioptions-=r                 " remove right-hand scroll bar
set guioptions-=L                 " remove left-hand scroll bar
set guifont=Monospace\ 12
set omnifunc=syntaxcomplete#Complete
syntax on
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0 " disable autostart

""""""""""""
"  Remaps  "
""""""""""""
nmap ö :
nnoremap <silent> <F2> :set relativenumber!<cr>
map <leader>ml :set filetype=markdown<CR>:PrevimOpen<CR><Esc>:set filetype=vimwiki<CR>
call togglebg#map("<F6>")
" Convert pandoc buffer to HTML and copy to system clipboard
autocmd FileType vimwiki nnoremap <buffer> <C-S-h> :write \| let @+ = system("pandoc -t html " . shellescape(expand("%:p")))<CR>
" Convert pandoc buffer to reStructuredText and copy to system clipboard
autocmd FileType vimwiki nnoremap <buffer> <C-S-t> :write \| let @+ = system("pandoc -t rst " . shellescape(expand("%:p")))<CR>
" map <F11> :Goyo <bar> :Limelight!! <bar> :TogglePencil <CR>
nn <F11> :Goyo <bar> :Limelight!! <CR>
nn <leader>v :vsplit $MYVIMRC<CR>
nn <leader>f :vsplit ~/.ledgerrc<CR>
nn <F7> :setlocal spell! spell?<CR>
nn <esc><esc> :silent! nohls<cr>

" Format JSON in vim
nn =j :%!python -m json.tool<CR>

" Regex
nn / /\v
nn / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nn :g/ :g/\v
nn :g// :g//
""""""""""""""""""""""""""
"  Writing and spelling  "
""""""""""""""""""""""""""
set spelllang=de,en

" let g:pandoc#spell#enabled=0

" Autocorrect slows down startup
"autocmd filetype markdown,vimwiki call AutoCorrect()
"https://github.com/reedes/vim-lexical
"augroup lexical
"  autocmd!
"  autocmd FileType markdown,vimwiki call lexical#init()
"augroup END

"nmap j gj
"nmap k gk

""""""""""""""""""""
"  .vimrc folding  "
""""""""""""""""""""
"" Autofolding .vimrc
" see http://vimcasts.org/episodes/writing-a-custom-fold-expression/
""" defines a foldlevel for each line of code
function! VimFolds(lnum)
  let s:thisline = getline(a:lnum)
  if match(s:thisline, '^"" ') >= 0
    return '>2'
  endif
  if match(s:thisline, '^""" ') >= 0
    return '>3'
  endif
  let s:two_following_lines = 0
  if line(a:lnum) + 2 <= line('$')
    let s:line_1_after = getline(a:lnum+1)
    let s:line_2_after = getline(a:lnum+2)
    let s:two_following_lines = 1
  endif
  if !s:two_following_lines
      return '='
    endif
  else
    if (match(s:thisline, '^"""""') >= 0) &&
       \ (match(s:line_1_after, '^"  ') >= 0) &&
       \ (match(s:line_2_after, '^""""') >= 0)
      return '>1'
    else
      return '='
    endif
  endif
endfunction

""" defines a foldtext
function! VimFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).' l)'
  if v:foldlevel == 1
    let s:line = ' ◇ '.getline(v:foldstart+1)[3:-2]
  elseif v:foldlevel == 2
    let s:line = '   ●  '.getline(v:foldstart)[3:]
  elseif v:foldlevel == 3
    let s:line = '     ▪ '.getline(v:foldstart)[4:]
  endif
  if strwidth(s:line) > 80 - len(s:info) - 3
    return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
  else
    return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  endif
endfunction

""" set foldsettings automatically for vim files
augroup fold_vimrc
  autocmd!
  autocmd FileType vim 
                   \ setlocal foldmethod=expr |
                   \ setlocal foldexpr=VimFolds(v:lnum) |
                   \ setlocal foldtext=VimFoldText() |
     "              \ set foldcolumn=2 foldminlines=2
augroup END
" Toggle folds
nnoremap <silent> <leader><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <leader><space> zf
""""""""""
"  Todo  "
""""""""""
" Todo Pipe > Handle pdf file size. Script below is proof (200MB > 2.9MB)
"gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -sOutputFile=output.pdf input.pdf

