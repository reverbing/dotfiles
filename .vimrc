" ###############################################################################
" ### neobundleの設定
" ###############################################################################
"
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
    let s:noplugin = 1
else
    if has('vim_starting')
        execute "set runtimepath+=" . s:neobundle_root
    endif
    call neobundle#rc(s:bundle_root)

    NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}
    NeoBundleCheck
endif

filetype plugin indent on

" set nocompatible
" filetype off
" if has('vim_starting')
    " set runtimepath+=~/.vim/bundle/neobundle.vim/
" endif
" call neobundle#rc(expand('~/.vim/bundle/')) " プラグインをインストールするディレクトリを指定


" ################################################################################
" ### Plugin
" ################################################################################
"
" NeoBundle 'Shougo/neocomplcache'
NeoBundleLazy has('lua') ? 'Shougo/neocomplete.vim' : 'Shougo/neocomplcache',{
    \ "autoload": {"insert":1}
    \ }
NeoBundleLazy 'Shougo/unite.vim', {
    \ "autoload": {
    \ "commands": ["unite", "UniteWithBufferDir"]
    \ }}
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'YankRing.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'aharisu/vim-gdev'
NeoBundle 'amdt/vim-niji'
NeoBundle 'tpope/vim-fugitive'
" カラースキーム
NeoBundle 'tomasr/molokai'


" filetype plugin on
" filetype indent on

" ################################################################################
" ### helpの設定
" ################################################################################

" help検索時に日本語helpを英語helpより優先
set helplang=ja


" ################################################################################
" ### 画面表示の設定
" ################################################################################

" スクロール時に下が見えるようにする
set scrolloff=7
" 行番号を表示
set number
" 行番号・列番号を右下に表示
set ruler
" 対応する括弧をハイライト
set showmatch
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示する
set wrap
" コマンドを画面の最下行に表示
set showcmd
" ステータス行を常に表示
set laststatus=2
" 不可視文字を表示
set list
" 不可視文字の表示設定
set listchars=tab:>-,trail:･,extends:>,precedes:<,nbsp:%,eol:↲
" Shift + Cursor でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>


" ###################################################################################
" ### カラーリング設定
" ###################################################################################

set t_Co=256
" シンタックスハイライト
syntax on
" PreprocとFunctionとExceptionの色を設定:148(154,112)
autocmd Colorscheme * highlight Preproc ctermfg=148
autocmd Colorscheme * highlight Function ctermfg=148
autocmd Colorscheme * highlight Exception ctermfg=148
autocmd Colorscheme * highlight Visual ctermfg=Yellow
" commentの色を設定:244(210)
autocmd ColorScheme * highlight Comment ctermfg=244
" ターミナルでの透過設定をvimに反映
highlight Normal ctermbg=None
" カラースキーム
colorschem molokai
" :SyntaxInfoでカーソルがある文のカラーリング設定を確認
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()


" ###################################################################################
" ### カーソル動作設定
" ###################################################################################
"
" カーソル行の背景色を変える
set cursorline
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

" 文字がない場所にもカーソル移動を可能にする
" set virtualedit=all

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,,[,]
" インデントの削除を可能に、行の先頭で前の行の改行を削除を可能に、Ctrl+Wで入力した単語以外も削除可能に
set backspace=indent,eol,start
" ウィンドウ間を移動
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k

" gcで最後に変更したテキストを選択
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" カーソル位置の記憶. 次回開いた時にカーソルが前回の終了場所に
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END


" ####################################################################################
" ### タブ/インデントの設定
" ####################################################################################
"
" タブを複数の空白に置き換える
set expandtab
" インデント幅
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルの動く幅
set softtabstop=4
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent


" #######################################################################################
" ### ファイル処理関連の設定
" #######################################################################################
"
" 保存されていないファイルがある時は、終了前に保存確認
set confirm
" ファイルのバックアップを作る
set backup
" 指定したディレクトリに保存したファイルの前のバージョンを保存
set backupdir=~/.vim/vimbackup"
" スワップファイルを作成する
" set swapfile
" 指定したディレクトリにスワップファイルを作成する
" set directory=~/.vim/vimswap


" ########################################################################################
" ### 動作環境との統合関連の設定
" ########################################################################################
"
" OSのクリップボードをレジスタ指定なしでYank, Putできるようにする
set clipboard=unnamed
" マウスの入力を受け付ける
if has('mouse')
    set mouse=a
endif
" インサートモードから抜けると自動的にIMEをオフにする
set imdisable
" <Space>. で.vimrcを開く
nnoremap <Space>, :<C-u>edit $MYVIMRC<Enter>
" <Space>s. で.vimrcのリロード
nnoremap <Space>. :<C-u>source $MYVIMRC<Enter>
" InsertModeでjj -> <ESC>
inoremap jj <ESC>
" 保管時にScratchウィンドウを表示しない
set completeopt=menuone


" #########################################################################################
" ### 文字コードの設定
" #########################################################################################
"
" エンコード
set encoding=utf-8
" ファイルエンコード
set fileencoding=utf-8


" ##########################################################################################
" ### 検索設定
" ##########################################################################################
"
" 補完の際、大文字小文字の区別をしない
" set infercase
" 検索の際、小文字と大文字の区別をしない
set ignorecase
" ただし、大文字も含めた場合は区別をする
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
set hlsearch
" 検索ハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>
" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan


" ##########################################################################################
" ### 括弧&クォーテーションの自動補完設定
" ##########################################################################################
"
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" vnoremap { "zdi^V{<C-R>z}<ESC>
" vnoremap [ "zdi^V[<C-R>z]<ESC>
" vnoremap ( "zdi^V(<C-R>z)<ESC>
" vnoremap " "zdi^V"<C-R>z^V"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>



" ++++++++++++++++++++++++++++++++ 各種プラグインの設定 ++++++++++++++++++++++++++++++++++++
"
" ##########################################################################################
" ### unite.vimの設定
" ##########################################################################################

" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1
" バッファ一覧
nnoremap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> <C-u><C-a> :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction


" ##########################################################################################
" ### VimFilerの設定
" ##########################################################################################

" 自動起動
" autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
" :e で起動
" let g:vimfiler_as_default_explorer = 1
" セーフモードをOffに
" let g:vimfiler_safe_mode_by_default = 0


" ##########################################################################################
" ### VimShellの設定
" ##########################################################################################

nnoremap <silent> ,vs :<C-u>VimShell<CR>

" ##########################################################################################
" ### indent-guides.vimの設定
" ##########################################################################################

"# 0で無効、1で有効
let g:indent_guides_enable_on_vim_startup = 1
" ガイドをスタートするインデントの量
let g:indent_guides_indent_levels = 4
" ガイドの幅
let g:indent_guides_guide_size = 1
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" 自動カラーを無効にする
let g:indent_guides_auto_colors = 0
" 奇数インデントのガイドカラー
hi IndentGuidesOdd ctermbg=gray
" 偶数インデントのガイドカラー
hi IndentGuidesEven ctermbg=darkgray


" ##########################################################################################
" ### lightline.vimの設定
" ##########################################################################################
"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


" ##########################################################################################
" ### YankRingの設定
" ##########################################################################################

let g:yankring_history_dir = '~/.vim/history'
let g:yankring_history_file = '.yankring_history'


" ##########################################################################################
" ### NERDcommenterの設定
" ##########################################################################################
"
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle


" ##########################################################################################
" ### neosnippetの設定
" ##########################################################################################

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'

" ##########################################################################################
" ### jediの設定
" ##########################################################################################
"
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
    let g:jedi#auto_initialization = 0
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#popup_select_first = 1
    let g:jedi#completions_enabled = 0
    let g:jedi#show_call_signatures = 0
    let g:jedi#show_function_definition = 0
endfunction

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'


" ##########################################################################################
" ### neocomplete&neocomplcacheの設定
" ##########################################################################################
"
if neobundle#is_installed('neocomplete.vim')
    "neocomplete用設定
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    let g:acp_enableAtStartUp = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    let g:neocomplete#enable_camel_case = 1
elseif neobundle#is_installed("neocomplcache.vim")
    "neocomplcache用設定
    let g:neocomplcache#enable_at_startup = 1
    let g:neocomplcache#enable_ignore_case = 1
    let g:neocomplcache#enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-n>" : "\<S-TAB>"



" ##########################################################################################
" ### C言語の設定
" ##########################################################################################
"
" 標準的なC言語のインデントに従う
set cindent


" ##########################################################################################
" ### Javaの設定
" ##########################################################################################

" Java言語の標準のクラス名をハイライト
let java_highlight_all = 1
" デバック文のハイライト
" let java_highlight_debug = 1
" 余分な空白をハイライト
let java_space_errors = 1
" メソッド宣言部をハイライト
let java_highlight_functions = 1


" ##########################################################################################
" ### Pythonの設定
" ##########################################################################################

let python_highlight_all = 1


" ##########################################################################################
" ### lispの設定
" ##########################################################################################

autocmd FileType lisp set nocindent
autocmd FileType lisp set lisp
autocmd FileType lisp set showmatch
let lisp_rainbow = 1


" ##########################################################################################
" ### Gaucheの設定
" ##########################################################################################

" let g:neocomplete#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"

autocmd FileType scheme set nocindent
autocmd FileType scheme set lisp
autocmd FileType scheme set showmatch
" <Bslash>g でGaucheファイルを評価し、GoauchREPLバッファを開く
nnoremap <Leader>g :<C-u>GoshREPLWithBuffer<Enter>
