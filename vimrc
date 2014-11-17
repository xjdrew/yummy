set nocompatible

"
set history=256
"默认编码
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"设置字体
"set guifont=Menlo\ Regular:h15
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
set backspace=indent,eol,start
" 在编辑过程中，在右下角显示光标位置的状态行
set ruler
" 命令行（在状态行下）的高度，默认为1
set cmdheight=1
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 统一缩进为4
set tabstop=4
set shiftwidth=4
" 用空格代替制表符     
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
"禁止生成临时文件
set nobackup
set noswapfile
"禁止自动wrap
set nowrap
"搜索忽略大小写
set smartcase
"增量搜索
set incsearch " do incremental searching
"高亮搜索结果
set hlsearch
set showmatch

"keep buffer
set hidden

" 自动切换主目录
set autochdir

" google protobuf syntax
augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

filetype off

"config vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github

" Integrate git to vim
Plugin 'tpope/vim-git.git'
Plugin 'tpope/vim-fugitive'

" snip
"Bundle 'msanders/snipmate.vim'
"Bundle 'tpope/vim-surround'

" 
Plugin 'ervandew/supertab'
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

"Bundle 'sontek/minibufexpl.vim'
"Bundle 'wincent/Command-T'
Bundle 'mileszs/ack.vim'
nmap <leader>a <Esc>:Ack!

"
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"nmap <silent> -ff :FufCoverageFile<CR>
"nmap <silent> -fe :FufLine<CR>

" Revision History
"Bundle 'sjl/gundo.vim'
"map <leader>g :GundoToggle<CR>

" python doc \pw
"Bundle 'fs111/pydoc.vim'

" python reg
"Bundle 'vim-scripts/pep8'
"let g:pep8_map='<leader>8'

" Test Integration
"Bundle 'alfredodeza/pytest.vim'
"Bundle 'reinh/vim-makegreen'

"\T
"Bundle 'vim-scripts/TaskList.vim'

"mm F2
"Bundle 'vim-scripts/Visual-Mark'

" file browser
"Bundle 'vim-scripts/The-NERD-tree'
"map <leader>n :NERDTreeToggle<CR>

"Bundle 'sontek/rope-vim'
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>


" non github repos
" ...

call vundle#end()

" enable loading indent file for filetype
filetype plugin indent on     " required!

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set foldmethod=indent
set foldlevel=99

" syntax highlightling
syntax on 

" try to detect filetypes
filetype on 

" windows jump
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" disable auto indent for the current file
:nnoremap <F8> :setlocal noautoindent nocindent nosmartindent indentexpr=<CR>

" go fmt
if exists("g:did_load_filetypes")
    filetype off
    filetype plugin indent off
end
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on

