" Plugins
call plug#begin(stdpath('data') . '/plugged')

" Colour scheme
Plug 'patstockwell/vim-monokai-tasty'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'jparise/vim-graphql'

" typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown'

" inline hex colour highlighting
Plug 'chrisbra/Colorizer'

" wiki/calendar
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" Show 'Match 123 of 456 /search term/'
Plug 'henrik/vim-indexed-search'

" status bar and tabline
Plug 'vim-airline/vim-airline'

" quickfix and location list
Plug 'romainl/vim-qf'

" quoting/parentheses
Plug 'tpope/vim-surround'
" common vim default settings in a plugin
Plug 'tpope/vim-sensible'
" Easily comment out or remove comments
Plug 'tpope/vim-commentary'
" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" enable repeating supported plugin maps with `.`
Plug 'tpope/vim-repeat'
" git inside vim
Plug 'tpope/vim-fugitive'
" git log inside vim
Plug 'rbong/vim-flog'

" vimscript testing framework
Plug 'junegunn/vader.vim'

" ctrl-p - fuzzy file search across current directory
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'

" File tree explorer
Plug 'lambdalisue/fern.vim'
" Needed neovim fix for fern.vim and coc.nvim
Plug 'antoinemadec/FixCursorHold.nvim'
" Dev icons for fern's file tree explorer
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-hijack.vim'

" change the working directory to the project root when opening a file/directory
Plug 'airblade/vim-rooter'

" run tests
Plug 'vim-test/vim-test'

call plug#end()

let g:python_highlight_all = 1

" Set the <leader> key
let mapleader = ";"

syntax on                                     " turn on syntax highlighting
let g:vim_monokai_tasty_italic = 1            " allow italics in the vim-monokai-tasty colorscheme
colorscheme vim-monokai-tasty                 " set the colorscheme
set termguicolors                             " use gui colours (much bigger colour palette than cterm)

set iskeyword+=-                              " Add the `-` character to the list of chars used for 'words' in searches
set list                                      " display unprintable whitespace characters
set listchars=tab:├─,trail:·,space:·          " characters to use for unprintable whitespace characters
set showmatch                                 " show bracket matches
set ruler                                     " show row and column in footer
set ttimeoutlen=100                           " decrease timeout for faster insert with 'O'
set mouse=a                                   " allow the mouse to be used
set cursorline                                " highlight the line number
set colorcolumn=81                            " highlight the 81st column for text width
set splitright                                " default position for new window when splitting vertically
set showcmd                                   " show keystrokes of a (partial) command in the last line of the screen
set noshowmode                                " do not show the mode in the status bar (airline handles this)
set hidden                                    " allow buffers to be unsaved while in the background.
"-- FOLDING --
set nofoldenable                              " allow folding to be used, but by default, open folds on new files
set foldmethod=indent                         " syntax highlighting items specify folds
set foldcolumn=0                              " hides the folding column. Defines 0 col at window left, to indicate folding
set foldlevelstart=99                         " start file with all folds opened

" use ripgrep to search
" --vim-grep - outputs a vim friendly formatted response
" --smart-case - case insensitve for all lowercase, case sensitive otherwise
" --type-not - exclude *.xml in search. (cxss-web specific. Potentially remove this for other projects
" --glob !filename - Exclude this file from searches.
set grepprg=rg\ --smart-case\ --type-not=xml\ --vimgrep\ --glob\ !yarn.lock\ --glob\ !package-lock.json
set incsearch                                 " Highlight search results while typing
set hlsearch                                  " highlight words when using the '/' search option
set ignorecase smartcase                      " ignore case in search when using all lowercase
set path=.,,
set path+=src/**                              " palastripe
set path+=www/**                              " Ignite at REA
set path+=config/**                           " Ignite at REA
set path+=scripts/**                          " Ignite at REA
set path+=auto/**                             " Ignite at REA
set path+=pact/**                             " Ignite at REA
set path+=coverage/**                         " Ignite at REA
set path+=integration/**                      " Ignite at REA
set path+=coverage/**                         " Ignite at REA
set path+=pact/**                             " Ignite at REA
set path+=docs/**                             " Ignite at REA
set wildmenu                                  " Enable command mode completion
set wildignorecase                            " Ignore case when completing file names and directories. Has no effect when 'fileignorecase' is set
" do not search these directories when using :find or :edit
set wildignore+=*/dist*/*
set wildignore+=*/target/*
set wildignore+=*/builds/*
set wildignore+=*/build/*
set wildignore+=*/architecture/*
set wildignore+=*/*.xml
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*

set undofile                                  " Make vim remember undos, even when the file is closed!
set undolevels=1000                           " How many undos
set undoreload=10000                          " number of lines to save for undo

" tabs and indentation are often treated as the same thing, but they can have different values.
" The following commands allow the widths of a tab and the indentation level to be set
set autoindent                                " start a new line based on previous line indentation
set smartindent                               " indent a line after '{' or before '}'
set shiftround                                " round up the indent to a multiple of shiftwidth
set expandtab                                 " use spaces to insert a <TAB> character in insert mode
set tabstop=2                                 " the number of columns in a 'real' <TAB> character
set shiftwidth=2                              " the number of columns to use for autoindent and '<<' '>>'
set smarttab                                  " when the tab key is used at the start of a line, 'shiftwidth' is used instead of 'tabstop'
set nopaste                                   " nvim allows pasting from the clipboard by default. This just stops tab settings resetting
set backspace=indent,eol,start                " allow backspace to work across line breaks and indents
set number                                    " turn on line numbers
set conceallevel=0                            " don't conceal any characters
set autoread                                  " automatically reread a file when it has been changed outside of vim. eg with Git.
set noswapfile                                " turn off creation of temp files
set spelllang=en_gb                           " Set spell check to British English
set wrap                                      " soft wrap long lines (no actual line break but avoids horizontal overflow)
set linebreak                                 " wrap lines at a character in the `breakat` option (try :set breakat?)

filetype on                                   " detect the type of file being edited
filetype plugin on                            " load additional plugins for that filetype. Eg. ~/.vim/ftplugin/python.vim

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/

augroup TrailingWhiteSpace
  " Clear the autocommands of the current group to prevent them from piling
  " up each time you reload your vimrc.
  autocmd!
  " filetypes that shouldn't have highlighted whitespace
  let blocklist = ['help', 'fern']
  autocmd BufWritePre * if index(blocklist, &ft) < 0 | call cake#highlightTrailingWhiteSpace('\s\+$')
  " the following pattern will match trailing whitespace, except when typing at the end of a line.
  autocmd InsertEnter * call cake#highlightTrailingWhiteSpace('\s\+\%#\@<!$')
  autocmd InsertLeave * call cake#highlightTrailingWhiteSpace('\s\+$')
  autocmd BufWinLeave * call clearmatches()
augroup end

" Add automatic folding to vim files
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" ** NETRW **
let g:netrw_preview = 1 " show the preview window in a horizontal split
let g:netrw_alto = 1 " change from above splitting to below splitting
let g:netrw_browse_split = 0 " open a file in the same window as the explorer

" --------------------------------------------
" --------------------------------------------
" ----                                    ----
" ----          Plugin config             ----
" ----                                    ----
" --------------------------------------------
" --------------------------------------------

" ** DEVICONS PLUGIN **
" " loading the plugin
let g:webdevicons_enable = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" ** FERN PLUGIN **
let g:fern#renderer = "nerdfont"
let g:fern#disable_default_mappings = 1
let g:fern#disable_drawer_smart_quit = 1
let g:fern#default_hidden = 1

" ** FIXCURSORHOLD PLUGIN **
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100


noremap <silent> <Leader>f :Fern . -drawer -reveal=% -width=35 -toggle<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> m <Plug>(fern-action-mark:toggle)j
  nmap <buffer> N <Plug>(fern-action-new-file)
  nmap <buffer> K <Plug>(fern-action-new-dir)
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> V <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> <nowait> d <Plug>(fern-action-hidden:toggle)
  nmap <buffer> <nowait> < <Plug>(fern-action-leave)
  nmap <buffer> <nowait> > <Plug>(fern-action-enter)
endfunction

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
augroup END

augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" ** FIXCURSORHOLD PLUGIN **
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100

" ** CTRL-P PLUGIN **
" let g:ctrlp_cmd = 'CtrlPMixed' " use mixed as the default setting
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_current_file = 1
" set most recently used files as the first option
let g:ctrlp_types = ['fil', 'buf', 'mru']

" ** VIMWIKI PLUGIN **
let g:vimwiki_table_mappings = 0 " unbinds TAB so it can be used for completion
let g:vimwiki_use_calendar = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_folding = 'expr' " Based on expression (sections and code blocks)
let g:vimwiki_conceallevel = 0 " always show charcters, never conceal.

let wiki = {}
let wiki.path = $HOME.'/notes/'
let wiki.ext = '.md'
let wiki.syntax = 'markdown'
let wiki.diary_rel_path = './'
let wiki.diary_index = 'journal'
let wiki.diary_header = 'Journal'
let wiki.index = 'index'
let wiki.automatic_nested_syntaxes = 1 " use syntax highlighting for code blocks
let wiki.auto_diary_index = 1 " update the links in the diary index page
let wiki.auto_tags = 1 " update .tags metadata file when file is saved
let g:vimwiki_list = [wiki]
" This is needed according to the vimwiki docs. Neovim is always
" 'nocompatible', but it is set here for completeness.
set nocompatible

" ** CALENDAR PLUGIN **
let g:calendar_mark = 'left-fit'
let g:calendar_monday = 1
let g:calendar_filetype = 'markdown'
" This option is ignored when vimwiki diary is used. Set for completeness.
let g:calendar_diary=$HOME.'/notes/'

" ** VIM-MARKDOWN PLASTICBOY PLUGIN **
let g:vim_markdown_fenced_languages = [
      \ 'csharp=cs',
      \ 'js=javascript',
      \ 'vim=vim',
      \ 'bash=sh',
      \ 'sh=sh',
      \ 'html=html',
      \ 'ts=typescript',
      \ 'tsx=typescriptreact',
      \ ]
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_emphasis_multiline = 1 " allow multiline text emphasis
let g:vim_markdown_conceal = 2 " turn on concealing of markdown syntax
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_autowrite = 1 " auto save the file when following a link
let g:vim_markdown_follow_anchor = 1 " use `ge` to follow a link to another file
let g:vim_markdown_conceal_code_blocks = 0 " show codeblock wrapping ```
" remove default mapping for Markdown_MoveToCurHeader which is `]c`
map <Plug> <Plug>Markdown_MoveToCurHeader

" ** VIM INSTANT MARKDOWN PLUGIN **
"Uncomment to override defaults -->
let g:instant_markdown_autostart = 0

" ** COC.NVIM PLUGIN **
" List of extensions to use with coc.nvim
call coc#add_extension('coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-eslint')

set nobackup " Some servers have issues with backup files, see #649
set nowritebackup " Some servers have issues with backup files, see #649
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c " don't give 'ins-completion-menu' messages.
set signcolumn=auto

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Jump to previous error
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
" Jump to next error
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup typescriptGroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setlocal formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Format comments in .json files
  autocmd FileType json syntax match Comment +\/\/.\+$+
  " tsconfig.json is actually jsonc, help TypeScript set the correct filetype
  autocmd BufRead,BufNewFile tsconfig.*json set filetype=jsonc

  autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup end

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ** VIM-FLOG PLUGIN **
augroup VimFlogRemoveTrailingWhitespaceHightlight
  autocmd!
  autocmd FileType floggraph call clearmatches()
augroup end

" ** VIM-INDEXED-SEARCH PLUGIN **
let g:indexed_search_colors = 0

" ** COC-PRETTIER PLUGIN **
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ** VIM-JSON PLUGIN **
let g:vim_json_syntax_conceal = 0 " don't conceal json quotes

" ** VIM-AIRLINE PLUGIN **
" airline theme
let g:airline_theme='monokai_tasty'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_skip_empty_sections = 1 "this hides the ugly orange warning triangle
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep = '╱'
let g:airline_left_alt_sep = '╲'
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

" Open the location/quickfix window automatically if cgetexpr function is used
" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup end

" =========== Custom commands. =============
" The bang '!' will overwrite whatever command previously used that name. This
" makes it safe to reload a script.
" `What` will print out the syntax group that the cursor is currently above.
" from https://www.reddit.com/r/vim/comments/6z4aau/how_to_stop_vim_from_autohighlighting_italics_in/
command! What echomsg synIDattr(synID(line('.'), col('.'), 1), 'name')
" sometimes a <TAB> is introduced via paste and then the tab key produces hard
" tabs. This resets the tab settings.
command! Reset set et sw=2 ts=2 autoindent | retab
command! DiffSaved call cake#diffWithSaved()
" Open my vimrc for editing
command! Vimrc :e ~/.config/nvim/init.vim
" mimic gup command from zsh
command! Gup :G pull --rebase
" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
command! -nargs=+ -complete=file_in_path Grep cgetexpr cake#grep(<f-args>)
command! SearchCurrentWord cgetexpr cake#searchWordUnderTheCursor()
command! Json %!python -m json.tool
command! Sort call cake#sortqf()

" ============ Custom Maps ==============
" The character to start wild card expansion (eg completion menu when file
" searching). This is normally <TAB> by default, but in a mapping, that
" translates to a literal tab, not an interpreted tab to start expansion. To
" get around that, we set the wildcharm (note the `m`) which sets wildchar
" inside macros (mappings).
set wildcharm=<C-Z>
" source .vimrc (mnemonic: Source Vimrc)
nnoremap <leader>sv :source $MYVIMRC<CR>
" This copies the current file path to the clipboard
nnoremap cp :let @* = expand("%")<CR>
" Insert a markdown #H1 and the date (journal entry template)
nnoremap <leader>d :call cake#createDateStampForJournalEntry()<CR>i
" Insert a heart emoji for highlighting a journal entry
nnoremap <leader>h :call cake#highlightBulletPoint()<CR>
" text search
nnoremap <leader>g :Grep<space>
" nnoremap <leader>g :GrepperRg -S<space>
" text search with the word under the cursor (the '*' highlights the word)
nnoremap <leader>s *:SearchCurrentWord<cr>
" Find incomplete tasks in the wiki
nnoremap <leader>t :Grep TODO<CR>
" Find all the highlights in the journal
nnoremap <leader>w<leader>h :Grep ❤️ <CR>
" Get syntax highlight stack trace
nnoremap <F10> :echomsg
      \ 'hi<'
      \ . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
