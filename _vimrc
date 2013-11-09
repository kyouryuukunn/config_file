" --------------------------------------------------------------------------
let g:portable = 0
" --------------------------------------------------------------------------
" path {{{
"win、linux互換用
if has('win32') || has('win64')
  let $DOTVIM = $VIM.'/vimfiles'
  let $DROPBOX = expand('d:/Box/Workspace/Dropbox/etc')
  let $HELP = $DOTVIM.'/help'
  let $LLVM = expand('e:/llvm/bin')
  "let $DMD = expand('e:/dmd2/windows/bin')
  let $PYTHON2 = expand('C:/Python27;C:/Python27/Scripts')
  let $PYTHON3 = expand('C:/Python33;C:/Python33/Scripts')
  let $GIT = expand('e:/Soft/Git/bin')
  let $BZR = expand('c:/Program Files (x86)/Bazaar')
  let $MINGW = expand('c:/MinGW/bin')
  let $MSYS = expand('c:/MinGW/msys/1.0/bin')
  let $CYG = expand('c:/cygwin64/bin')
  let $PATH = $PATH .";".$LLVM.';'.$PYTHON3.";".$MSYS.";".$MINGW.";".$CYG.";".$BZR
  let $CYGWIN = "nodosfilewarning"
else
  let $DROPBOX = expand('~/Dropbox/etc')
  let $DOTVIM = expand('~/.vim')
  let $HELP = $DOTVIM.'/help'
  let $LLVM = expand('/usr/local/bin')
endif " }}}
set migemo
" nnoremap <Space>/ g/
" nnoremap <Space>? g?
"-------------------------------------------------------------------------------------
" 辞書
"set dictionary="spell"
"-------------------------------------------------------------------------------------
"表示 {{{
"ステータスラインに状態
set laststatus=2
set statusline=%F\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y[buffer:%n]%=\ (%v,%l)/%L%8P\
sign define anchor text=\
function! s:ShowSign()
	if filereadable(expand("%:p"))
		execute "sign place 134893619283 line=1 name=anchor file=".expand("%:p")
	endif
endfunction
"不可視文字の表示
" set list listchars=tab:^_,trail:_  " }}}
"------------------------------------------------------------------------------
"スワップ,バックアップ保存場所 {{{
if !g:portable
	set backup
	if has('win32') || has('win64')
		set backupdir=D:/App/back
		set directory=D:/App/swap
	else
		set backupdir=~/.back
		set directory=~/.swap
	endif
	"永続アンドゥ
	set undofile
	" アンドゥの保存場所(7.3)
	let &undodir = &directory
endif
" }}}
"------------------------------------------------------------------------------
" etc  {{{
inoremap # X<C-H>#
" #で行頭に飛ばないように
set shellslash
" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell
"タブ数
set tabpagemax=1000
" 折り返し検索をしない
set nowrapscan
"バッファを隠す
set hidden
"行番号表示
set number
"タイトル表示
set title
"コマンド表示
set showcmd
"ルーラー表示
set ruler
"クリップボード共有
set clipboard+=unnamed
set display=lastline
set ambiwidth=double
set ignorecase
set smartcase
set incsearch "<C-R><C-W>に影響
set wildmenu
set nowrap
set linebreak
" 改行時にコメントしない
setlocal formatoptions-=ro
" バッファを閉じる時にバッファリストから削除
autocmd BufReadPre * setlocal bufhidden=delete
" 括弧を入力した際、カーソル。が一瞬移動してしまう場合に設定
set matchtime=0
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif " }}}
"---------------------------------------------------------------------------
"{{{ autocmd
augroup MyAutocmd
	autocmd!
"-------------------------------------------------------------------------------------
" python {{{
	autocmd FileType python setl tabstop=8
	autocmd FileType python setl softtabstop=4
	autocmd FileType python setl shiftwidth=4
	autocmd FileType python setl expandtab
	autocmd FileType python setl smarttab
	autocmd FileType python setl autoindent
	autocmd FileType python setl nosmartindent
	autocmd FileType python setl cindent
	autocmd FileType python setl textwidth=80
	autocmd FileType python setl colorcolumn=80
	" Folding
	autocmd FileType python setl foldmethod=indent
	autocmd FileType python setl foldlevel=99
	autocmd FileType python inoremap <buffer> <CR><CR>   <CR><CR><C-D>
" }}}
"-------------------------------------------------------------------------------------
" renpy {{{
	autocmd FileType renpy setl tabstop=8
	autocmd FileType renpy setl softtabstop=4
	autocmd FileType renpy setl shiftwidth=4
	autocmd FileType renpy setl smarttab
	autocmd FileType renpy setl expandtab
	autocmd FileType renpy setl autoindent
	autocmd FileType renpy setl nosmartindent
	autocmd FileType renpy setl cindent
	" Folding
	autocmd FileType renpy setl foldmethod=indent
	autocmd FileType renpy setl foldlevel=99
    autocmd FileType renpy inoremap <buffer> <expr><S-CR>  neocomplcache#smart_close_popup() . "\<CR><CR><C-D>"
	autocmd FileType renpy inoremap <buffer> <C-Y>,  <Esc>vbyiX{<Left><C-H><Right><Esc>ea}{/<C-R>*}<Esc>bba
	autocmd FileType renpy inoremap <buffer> <C-Y>n  <Esc>f}a
	autocmd FileType renpy nnoremap <buffer> <Leader>r :RenPyExe<CR>
"" }}}
" --------------------------------------------------------------------------
" dos {{{
	autocmd FileType dosbatch e ++enc=cp932
"   }}}
" --------------------------------------------------------------------------
" Asr {{{
	autocmd BufRead e:/Soft/Asr/Ubar/Kuma/Script/*.txt,e:/Soft/Asr/Ubar/Kuma/Bar/Favorite/*,e:/Soft/Asr/Ubar/Kuma/Bar/Launch/*	e ++enc=utf-16le
	autocmd BufRead e:/Softx64/Asr/Ubar/Kuma/Script/*.txt,e:/Softx64/Asr/Ubar/Kuma/Bar/Favorite/*,e:/Softx64/Asr/Ubar/Kuma/Bar/Launch/*	e ++enc=utf-16le
"   }}}
"   ------------------------------------------------------------------------
" help {{{
	autocmd BufRead $DOTVIM/bundle/.neobundle/doc/*.txt nnoremap q :q<CR>
"   }}}
"   ------------------------------------------------------------------------
" tweet {{{
	autocmd FileType twitvim nnoremap q <C-W>q
" }}}
"   ------------------------------------------------------------------------
" html {{{
	autocmd FileType html inoremap <M-n> <br><CR>
	autocmd FileType html inoremap < <><lEFT>
" }}}
"   ------------------------------------------------------------------------
" Text {{{
	autocmd FileType text setl textwidth=0
" }}}
"   ------------------------------------------------------------------------
" snippet {{{
	autocmd FileType snippet setl foldmethod=marker
	autocmd FileType snippet setl noexpandtab
" }}}
"  -------------------------------------------------------------------------
" extra {{{
	autocmd BufRead _vundlevim,_pluginvim,_includevim set filetype=vim
	" 常に開いているファイルと同じディレクトリをカレントディレクトリにする
	autocmd BufEnter * call s:MoveNowDir()
    " signを表示し続ける
	autocmd BufEnter * call s:ShowSign()
	"入力モード時、ステータスラインのカラーを変更
	" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
	" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
" }}}
"  -------------------------------------------------------------------------
augroup END
" }}}
"  -------------------------------------------------------------------------
function! s:MarkdownToRenPy() " {{{
	%s/^\t/\t\t/
	%s/\v^#(.*)/\tlabel \1:/
	" %s/\v(^[^*#$	].*)  \n(.*)/\l\\n\2/
	%s/\v  \n/\\n/
	%s/\v^\$(.*)\n(.*)/\t\t\1 "\2"/
	%s/\v(^[^*$#	].*)/\t\t"\1"/
	%s/\v^\* ([^[].*)/\t\tmenu:\r\t\t\t"\1"/
	%s/\v^\*$/\t\tmenu:\r\t\t\t"\1"/
	%s/\v\* \[(.*)\]\((.*)\)/\t\t\t"\1":\r\t\t\t\tjump \2/
	%s/^\t//
	%s/\t/    /g
endfunction

command RenPy call s:MarkdownToRenPy()
"  }}}
"  -------------------------------------------------------------------------
"keymap {{{
"---------------------------------------------------------------------------
" nnoremap <Space>/ /\v
" nnoremap <Space>? ?\v
nnoremap <silent> <F5> :e!<CR>
nnoremap <silent> <F6> :tabe %<CR>
nnoremap <silent> <F7> :tabe<CR>:tabonly!<CR>
nnoremap <silent> <Space>w :w<CR>
"-------------------------------------------------------------------------------------
" session
nnoremap <Space>ss :mksession! $DOTVIM/session/temp<CR>
nnoremap <Space>sl :source $DOTVIM/session/temp<CR>
nnoremap <Space>mks :mksession! $DOTVIM/session/
nnoremap <Space>so :source $DOTVIM/session/
"-------------------------------------------------------------------------------------
"nnoremap _ $
"vnoremap _ $
"-------------------------------------------------------------------------------------
" カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p> {{{
" キーボードマクロには物理行移動を推奨
" h l は行末、行頭を超えることが可能に設定(whichwrap)
set backspace=indent,eol,start
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap j gj
nnoremap k gk
inoremap <Down> gj
inoremap <Up>   gk
xnoremap <Down> gj
xnoremap <Up>   gk
xnoremap j gj
xnoremap k gk
"l を <Right>に置き換えて、折りたたみを l で開くことができるようにする。
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif " }}}
"---------------------------------------------------------------------------
nnoremap <C-W>Q :tabclose<CR>
"---------------------------------------------------------------------------
" 現在のタブを右へ移動 {{{
nnoremap <Tab>l :MyTabMoveRight<CR>
" 現在のタブを左へ移動
nnoremap <Tab>h :MyTabMoveLeft<CR>

command! -count=1 MyTabMoveRight call MyTabMove(<count>)
command! -count=1 MyTabMoveLeft  call MyTabMove(-<count>)
function! MyTabMove(c)
  let current = tabpagenr()
  let max = tabpagenr('$')
  let target = a:c > 1       ? current + a:c - line('.') :
             \ a:c == 1      ? current :
             \ a:c == -1     ? current - 2 :
             \ a:c < -1      ? current + a:c + line('.') - 2 : 0
  let target = target >= max ? target % max :
             \ target < 0    ? target + max :
             \ target
  execute ':tabmove ' . target
endfunction " }}}
"-------------------------------------------------------------------------------------
"括弧等を補完。 {{{
inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>

"augroup kakko
	"autocmd!
	"autocmd FileType	cpp,d,renpy,kirikiri inoremap <buffer> " ""<LEFT>
	"autocmd FileType	vim,snippet,cpp,d,renpy,kirikiri inoremap <buffer> ' ''<LEFT>
	"autocmd FileType	vim,snippet,cpp,d,renpy,kirikiri inoremap <buffer> ( ()<LEFT>
	"autocmd FileType	vim,snippet,cpp,d,renpy,kirikiri inoremap <buffer> [ []<LEFT>
	"autocmd FileType	vim,snippet inoremap <buffer> { {}<LEFT>
	"autocmd FileType	cpp inoremap <buffer> { <CR>{<CR>}<Up><CR>
"augroup END " }}}
"-------------------------------------------------------------------------------------
"ビジュアルモードでのインデント操作を楽に
vnoremap < <gv
vnoremap > >gv
"-------------------------------------------------------------------------------------
"検索で勝手に飛ばないようにする
"nnoremap * *N
"nnoremap # #N
"-------------------------------------------------------------------------------------
"検索後画面の中心に。
" nmap n nzz
" nmap N Nzz
"-------------------------------------------------------------------------------------
"ハイライト停止
"nnoremap <ESC><ESC> :nohlsearch<CR>
"-------------------------------------------------------------------------------------
"終了
nnoremap <F1> :qa!<CR>
nnoremap <F2> :wqa<CR>
"-------------------------------------------------------------------------------------
" タブの移動
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
"-------------------------------------------------------------------------------------
";と;を入れ替える
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
"-------------------------------------------------------------------------------------
" insertmode
" 貼り付け
inoremap <C-V> <esc>pa
" 復元
inoremap <C-Z> <C-O>u
" 後削除
inoremap <C-K> <C-g>u<C-O><S-D>
" 前一文字削除
inoremap <C-G> <C-g>u<Del>
" 一行削除
inoremap <C-CR> <C-g>u<End><C-U><Del>
" 単語削除、(日本語用)。
inoremap <C-W> <C-g>u<Esc>vbs

inoremap <C-F>/ <C-O>g/
inoremap <C-F>? <C-O>g?

inoremap <C-U>  <C-g>u<C-u>
"-------------------------------------------------------------------------------------
"\から/へ置換
vnoremap <silent> <Leader>/ :s/\\/\//g<CR>:nohlsearch<CR>
nnoremap <silent> <Leader>/ :s/\\/\//g<CR>:nohlsearch<CR>
"-------------------------------------------------------------------------------------
"/から\へ置換
vnoremap <silent> <Leader><Leader> :s+/+\\+g<CR>:nohlsearch<CR>
nnoremap <silent> <Leader><Leader> :s+/+\\+g<CR>:nohlsearch<CR>
"-------------------------------------------------------------------------------------
"再設定
command! Reset call s:Reset()
nnoremap <silent> <F3> :Reset<CR>

function! s:Reset()
	source ~/_vimrc
	source ~/_gvimrc
endfunction
"-------------------------------------------------------------------------------------
" gtags {{{
noremap <C-G><C-T> :!gtags -v
" 検索結果Windowを閉じる
nnoremap <C-q> <C-w><C-w><C-w>q
" Grep 準備
nnoremap <C-G><C-G> :Gtags -g
" このファイルの関数一覧
nnoremap <C-G><C-l> :Gtags -f %<CR>
" カーソル以下の定義元を探す
nnoremap <C-G><C-f> :Gtags <C-r><C-w><CR>
" カーソル以下の使用箇所を探す
nnoremap <C-G><C-k> :Gtags -r <C-r><C-w><CR>
" 次の検索結果
nnoremap <C-G><C-n> :cn<CR>
" 前の検索結果
nnoremap <C-G><C-p> :cp<CR>
 " }}}
"------------------------------------------------------------------------------
"help用設定 {{{
nnoremap ,h :h<space>
augroup helpgroup
	autocmd!
	autocmd BufRead *.jax	nnoremap <buffer> q :close<CR>
	autocmd BufRead *.help	nnoremap <buffer> q :close<CR>

	autocmd FileType cpp	nnoremap <silent><buffer> ,c :set noincsearch<CR>:split $HELP/C/<C-R><C-W>.help<CR><C-D>:set incsearch<CR><CR>
		\ | nnoremap <silent><buffer> ,stl :set noincsearch<CR>:split<CR>:silent grep ^<C-R><C-W> $HELP/STL/*.help<CR>:set incsearch<CR><CR>
		\ | nnoremap <silent><buffer> ,dx :set noincsearch<CR>:split<CR>:silent grep 宣言.*<C-R><C-W>.*; $HELP/DxLib/*.help<CR>:set incsearch<CR><CR>
		\ | nnoremap <silent><buffer> ,sd :set noincsearch<CR>:split<CR>:silent grep TITLE\s:\s<C-R><C-W> $HELP/SDL/*.help<CR>:set incsearch<CR><CR>

	autocmd BufRead C_Library.help	nnoremap <silent><buffer> <S-k> :set noincsearch<CR>:e $HELP/C/<C-R><C-W>.help<CR><C-D>:set incsearch<CR><CR>
	autocmd BufRead	dxfunc1_index.help,dxfunc2_index.help,dxfunc3_index_3D.help	noremap <silent><buffer> <S-k> :set noincsearch<CR>:silent grep 宣言.*<C-R><C-W>.*; $HELP/DxLib/*.help<CR>:set incsearch<CR><CR>
	autocmd BufRead	audio.help,cdrom.help,event.help,general.help,joystick.help,thread.help,time.help,video.help,wm.help	nnoremap <silent><buffer> <S-k> :set noincsearch<CR>:silent grep TITLE\s:\s<C-R><C-W> $HELP/SDL/*.help<CR>:set incsearch<CR><CR>

augroup END

command! Closemap call s:Closemap()

function! s:Closemap()
nnoremap <silent> <buffer> q :close<CR>
endfunction " }}}
"------------------------------------------------------------------------------
"grep {{{
if has('win32') || has('win64')
	set grepprg=jvgrep
	" set grepprg=grep\ -nH
endif
"自動でQuickfixを開く
"autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif
"Quickfix用設定
"autocmd FileType qf nnoremap <buffer> q :ccl<CR>
"Quickfix
"noremap <C-w>, :copen<CR> " }}}
"-----------------------------------------------------------------------------
"連番機能coで起動 {{{
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"十進数優先にする。必要ならset nf=octal,hex
set nf=alpha " }}}
"------------------------------------------------------------------------------
"挿入 {{{
iab <expr> lin repeat('-',80 - col('.'))
" }}}
"------------------------------------------------------------------------------
"}}}
"---------------------------------------------------------------------------
" 常に開いているファイルと同じディレクトリをカレントディレクトリにする {{{
function! s:MoveNowDir()
	if isdirectory(expand("%:p:h"))
		" if getcwd() == expand("%:p:h") || getcwd() == expand("$VIM")
		exec ":cd ". expand("%:p:h")
		" endif
	endif
endfunction
 " }}}
"-------------------------------------------------------------------------------------
"" 外部ファイル読み込み {{{
source $DROPBOX/_includevim
source $DROPBOX/_vundlevim
source $DROPBOX/_pluginvim
"上書きされそうな設定
set whichwrap=b,s,h,l,<,>,[,]
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
" }}}
""-------------------------------------------------------------------------------------
" ""MSVCコンパイルオプション {{{
" if has('win32') || has('win64')
" 	""使用する msvc を設定
" 	let s:msvc_2012 = "C:/Program\ Files/Microsoft\ Visual\ Studio\ 11.0"
" 	let s:msvc_2012_nov = "C:/Program\ Files/Microsoft\ Visual\ C++\ Compiler\ Nov\ 2012\ CTP;"
" 
" 	let $VSINSTALLDIR=s:msvc_2012
" 	let $VCINSTALLDIR=$VSINSTALLDIR."/VC"
" 
" 	let $DevEnvDir=$VSINSTALLDIR."/Common7/IDE;"
" 	let $PATH=$VSINSTALLDIR."Common7/Tools;".$PATH
" 	let $PATH=$VCINSTALLDIR."/bin;".$PATH
" 
" 	let $PATH=$DevEnvDir.";".$PATH
" 
" 	let $INCLUDE=$VCINSTALLDIR."/include;".$INCLUDE
" 	let $LIB=$VCINSTALLDIR."/LIB;".$LIB
" 	let $LIBPATH=$VCINSTALLDIR."/LIB;".$LIBPATH
" 
" 	" 最後にこの2つを設定する
" 	let $PATH=s:msvc_2012_nov."/bin;".$PATH
" 	let $INCLUDE=s:msvc_2012_nov."/include;".$INCLUDE
" 	" Windows SDK（or Platform SDK？）
" 	let $WindowsSdkDir="C:/Program Files/Microsoft SDKs/Windows/v7.0A"
" 	let $INCLUDE=$WindowsSdkDir."/include;".$INCLUDE
" 	let $LIB=$WindowsSdkDir."/lib;".$LIB
" 	""MFC/ATL
" 	"let $INCLUDE=$WindowsSdkDir."/altmfc/include;".$INCLUDE
" 	"let $LIB=$WindowsSdkDir."/altmfc/lib;".$LIB
" 	""Net
" 	"let $INCLUDE="C:/Program Files/Microsoft SDKs/Microsoft Sync Framework/v1.0/include;".$INCLUDE
" 	"let $LIB="C:/Program Files/Microsoft SDKs/Microsoft Sync Framework/v1.0/lib;".$LIB
" 	""DirectX SDK
" 	"let $INCLUDE="C:/Program Files/Microsoft DirectX SDK (August 2009)/Include;".$INCLUDE
" 	"let $LIB="C:/Progra Files/Microso Direc SDK (August 2009)/Lib/x86;".$LIB
" 
" 	"Dxライブラリ SDL babel Boost wxWidgets
" 	let $INCLUDE="E:/msvc/include/;E:/msvc/lib/mswud;".$INCLUDE
" 	"共通
" 	let $LIB="e:/msvc/lib;".$LIB
" endif " }}}
""-------------------------------------------------------------------------------------
"" include {{{
""augroup path
""autocmd!
""	autocmd BufRead,BufNew *.cpp,*.c,*.h,*.hpp	set path+=c:/Program\\\ Files/Microsoft\\\ Visual\\\ Studio\\\ 10.0/VC/include,
""					\C:/Program\\\ Files/Microsoft\\\ SDKs/Windows/v7.0A/Include,
""					\E:/lib/DxLib_3.07a,
""					\E:/lib/boost_1_49_0,
""					\E:/lib/SDL-1.2.15_msvc/include
""augroup END " }}}
""-------------------------------------------------------------------------------------
" "tagspath {{{
""augroup tagspath
""autocmd! BufRead,BufNew *.cpp,*.c,*.h,*hpp	set tags=c:/Program\\\ Files/Microsoft\\\ Visual\\\ Studio\\\ 10.0/VC/include/tags,
""					\C:/Program\\\ Files/Microsoft\\\ SDKs/Windows/v7.0A/Include/tags,
""					\E:/lib/DxLib_3.07a/tags,
""					\E:/lib/SDL-1.2.15_msvc/include/tags,
""					\E:/lib/boost_1_49_0/tags
""augroup END " }}}
""------------------------------------------------------------------------------
"" templates {{{
""augroup templates
""	autocmd!
""	autocmd BufNewFile *.h	0r $DOTVIM/templates/for_h
""	autocmd BufNewFile *.h	%s#DATE#\=strftime("%Y_%b_%d_%H_%M_%S")#
""	autocmd BufNewFile *.cpp	0r $DOTVIM/templates/for_cpp
""augroup END " }}}
"""-------------------------------------------------------------------------------------
"""Dvorak {{{
""" Key to go into dvorak mode:
""nnoremap <silent> ,d :source $DOTVIM/_dvorak.vim<CR>
""" Key to get out of dvorak mode:
""nnoremap <silent> ,q :source $DOTVIM/_qwerty.vim<CR>
""" dvorak_langmap.vim
""command! Dvorak call s:Dvorak()
"""set langmap=\\'q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-\\',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?
""function! s:Dvorak()
"
"	"set langmap=[-,]^,@\",*',{=,}~,
"			"\'q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/@,=[,
"			"\\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?`,+{,
"			"\aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-:,`],
"			"\AA,OS,ED,UF,IG,DH,HJ,TK,NL,S+,_*,
"			"\\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,
"			"\:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?,\\|_
""endfunction " }}}
""------------------------------------------------------------------------------
""コンパイル {{{
""compiler msvc
""compiler gcc
""command! CPGCC call s:CPGCC()
""command! CPGCCRun call s:CPGCCRun()
""command! CPClang call s:CPClang()
""command! CPClangRun call s:CPClangRun()
""command! CPVC call s:CPVC()
""command! CPVCRun call s:CPVCRun()
""command! CPQt call s:CPQt()
""command! CPQtRun call s:CPQtRun()
""command! CPSDLRun call s:CPSDLRun()
""command! CPSDL call s:CPSDL()
""command! CPDxRun call s:CPDxRun()
""command! CPDx call s:CPDx()
""command! CPWxRun call s:CPWxRun()
""command! CPWx call s:CPWx()
""nnoremap <F5> :CPClang<CR>
""nnoremap <F6> :CPGCCRun<CR>
"
""function! s:CPGCC()
"	":!sh -c "g++ -c %"
""endfunction
"
""function! s:CPClang()
"	":!clang++ -c %
""endfunction
"
""function! s:CPVC()
"	":!cl /EHsc %
""endfunction
"
""function! s:CPGCCRun()
"	":!sh -c "g++ % -o %:r.exe"
"	":!%:r.exe
""endfunction
"
""function! s:CPClangRun()
"	":!clang++ -g % -o %:r.exe -static-libgcc -static-libstdc++
"	":!%:r.exe
""endfunction
"
""function! s:CPVCRun()
"	":!cl /EHsc %
"	":!%:r.exe
""endfunction
"
""function! s:CPQt()
"	":!qmake
"	":make -f Makefile.debug
""endfunction
"
""function! s:CPQtRun()
"	":!qmake
"	":make -f Makefile.debug
"	":!%:p:h/debug/%:r.exe
"	":cd ..
""endfunction
"
"
""function! s:CPSDLRun()
"	"":!sh -c "g++ % -o %:r.exe -g -lmingw32 -lSDLmain -lSDL -mwindows"
"	":!clang++ % -o %:r.exe -g -lmingw32 -lSDLmain -lSDL -mwindows -static-libgcc -static-libstdc++
"	":!%:r.exe
""endfunction
"
"
""function! s:CPSDL()
"	"":!sh -c "g++ -c %"
"	":!clang++ -c %
""endfunction
"
"
""function! s:CPDxRun()
"	"":!sh -c "g++ % -o %:r.exe -g -mwindows -lDxLib -lDxUseCLib -lDxDrawFunc -ljpeg -lpng -lzlib -ltheora_static -lvorbis_static -lvorbisfile_static -logg_static -lbulletdynamics -lbulletcollision -lbulletmath -static-libgcc -static-libstdc++ -DDX_GCC_COMPILE -DDX_NON_INLINE_ASM"
"	":!clang++ % -o %:r.exe -g -mwindows -lDxLib -lDxUseCLib -lDxDrawFunc -ljpeg -lpng -lzlib -ltheora_static -lvorbis_static -lvorbisfile_static -logg_static -lbulletdynamics -lbulletcollision -lbulletmath -static-libgcc -static-libstdc++ -DDX_GCC_COMPILE -DDX_NON_INLINE_ASM
"	":!%:r.exe
""endfunction
"
""function! s:CPDx()
"	"":!sh -c "g++ -c %"
"	":!clang++ -c -DDX_GCC_COMPILE -DDX_NON_INLINE_ASM"
""endfunction
"
""function! s:CPWxRun()
"	"":!sh -c "g++ % -o %:r.exe -g `wx-config --libs --cxxflags --unicode=yes --debug=yes --static=yes`"
"	":!sh -c "clang++ % -o %:r.exe -g `wx-config --libs --cxxflags --unicode=yes --debug=yes --static=yes` -static-libgcc -static-libstdc++"
"	":!%:r.exe
""endfunction
"
""function! s:CPWx()
"	"":!sh -c "g++ -c % `wx-config --cxxflags --unicode=yes --debug=yes`"
"	":!clang++ -c % `wx-config --cxxflags --unicode=yes --debug=yes`
""endfunction " }}}
""-------------------------------------------------------------------------------------
" fun! Renpycomplete(findstart, base)
" 	if a:findstart
" 		" 単語の始点を検索する
" 		let l:line = getline('.')
" 		let l:start = matchend(l:line, '^.\{-}[^ ]') " インデントからの最初の文字
" 		" while start > 0 && line[start - 1] =~ \a'
" 		"   let start -= 1
" 		" endwhile
" 		return l:start
" 	else
" 		echo a:base
" 		let l:candidate = [
" 			\{'word': 'python'      , 'menu': ''},
" 			\{'word': 'init'        , 'menu': ''},
" 			\{'word': 'init python' , 'menu': ''},
" 			\{'word': 'label '      , 'menu': ''},
" 			\{'word': 'screen'      , 'menu': ''},
" 			\{'word': 'image'       , 'menu': ''},
" 			\{'word': 'define'      , 'menu': ''},
" 			\{'word': 'menu'        , 'menu': ''},
" 			\{'word': 'say'         , 'menu': ''},
" 			\{'word': 'play'        , 'menu': ''},
" 			\{'word': 'queue'       , 'menu': ''},
" 			\{'word': 'stop'        , 'menu': ''},
" 			\{'word': 'with'        , 'menu': ''},
" 			\{'word': 'show'        , 'menu': ''},
" 			\{'word': 'hide'        , 'menu': ''},
" 			\{'word': 'scene'       , 'menu': ''},
" 			\{'word': 'return'      , 'menu': ''},
" 			\{'word': 'transform '  , 'menu': ''},
" 			\{'word': 'window hide'      , 'menu': ''},
" 			\{'word': 'window show'      , 'menu': ''},
" 			\{'word': 'jump'        , 'menu': ''},
" 			\{'word': 'call'        , 'menu': ''},
" 			\{'word': 'while'       , 'menu': ''},
" 			\{'word': 'if'          , 'menu': ''},
" 			\{'word': 'else:'       , 'menu': ''},
" 			\{'word': 'nvl clear'   , 'menu': ''},
" 			\{'word': 'extend'      , 'menu': ''},
" 			\{'word': 'center'      , 'menu': ''},
" 			\{'word': 'pause'       , 'menu': ''},
" 			\]
" 		let l:res = []
" 		for l:m in l:candidate
" 			if l:m.word =~ '^' . a:base
" 				call add(l:res, l:m)
" 			endif
" 		endfor
" 		return l:res
" 	endif
" endfun
" set omnifunc=Renpycomplete
" vim: nowrap foldmethod=marker textwidth=0
