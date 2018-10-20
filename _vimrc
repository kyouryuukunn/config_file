" --------------------------------------------------------------------------
let g:portable = 0
source $HOME/_vimlocal
" --------------------------------------------------------------------------
" 各種path {{{
"win、linux互換用
if has('win32') || has('win64')
  let $DOTVIM = expand($VIM.'/vimfiles')
  let $HELP = expand($DOTVIM.'/help')
  let $MSYS2 ='c:/msys64/usr/local/bin;c:/msys64/usr/bin;c:/msys64/bin;c:/msys64/usr/bin/site_perl;c:/msys64/usr/bin/vendor_perl;c:/msys64/usr/bin/core_perl'
  let $MINGW64 = 'c:/msys64/mingw64/bin'
  let $MINGW = 'c:/MinGW/bin'
  let $MSYS = 'c:/MinGW/msys/1.0/bin'
  let $CYG = 'c:/cygwin64/bin'
  let $CYGWIN = 'nodosfilewarning'
  let $PYTHON2 = 'E:/Python27;E:/Python27/Scripts'
  let $PYTHON3 = 'E:/Python35;E:/Python35/Scripts'
  let $DMD = 'e:/D/dmd2/windows/bin;e:/D/dm/windws/bin'
  let $LDC = 'e:/D/ldc2/bin'
  let $HASKELL = 'C:/Users/kuma/AppData/Roaming/cabal/bin;C:/Program Files (x86)/Haskell/bin;E:/Haskell/lib/extralibs/bin;E:/Haskell/bin'
  let $GOROOT = 'e:/go'
  let $GOPATH = $GOROOT.'/local'
  let $PATH = $PATH .';'.$PYTHON3.';'.$PYTHON2.';'.$MINGW64.';'.$MSYS2.';'.$DMD.';'.$LDC " .';'.$HASKELL.';'.$GOROOT.'/bin;'.$GOPATH.'/bin'
else
  let $DOTVIM = expand('~/.vim')
  let $HELP = $DOTVIM.'/help'
  let $LLVM = '/usr/local/bin'
  let $PATH = $PATH.':usr/local/bin'
endif " }}}
set migemo

" nnoremap / g/
" nnoremap ? g?
" nnoremap g/ /
" nnoremap g? ?
"-------------------------------------------------------------------------------------
" 辞書
"set dictionary="spell"
"-------------------------------------------------------------------------------------
"表示 {{{
"ステータスライン表示
set laststatus=2
set cmdheight=2
" set noshowmode
set completeopt=menuone,noinsert,noselect
" タブページを常に表示
set showtabline=2
" gVimでもテキストベースのタブページを使う
set guioptions-=e
" タブのフォーマット指定
" set tabline=%!MakeTabLine()
" function! MakeTabLine() "{{{
" 	let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
" 	let sep = '|'  " タブ間の区切り
" 	let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
" 	let info = ''  " 好きな情報を入れる
" 	return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
" endfunction "}}}
 " n 番目のタブのラベルを返す
" 各タブページのカレントバッファ名+αを表示
" function! s:tabpage_label(n) "{{{
"   " t:title と言う変数があったらそれを使う
"   let title = gettabvar(a:n, 'title')
"   if title !=# ''
"     return title
"   endif
"
"   " タブページ内のバッファのリスト
"   let bufnrs = tabpagebuflist(a:n)
"
"   " カレントタブページかどうかでハイライトを切り替える
"   let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
"
"   " バッファが複数あったらバッファ数を表示
"   let no = len(bufnrs)
"   if no is 1
"     let no = ''
"   endif
"   " タブページ内に変更ありのバッファがあったら '+' を付ける
"   let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
"   let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける
"
"   " カレントバッファ
"   let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
"   " let fname = pathshorten(bufname(curbufnr))
"   let fname = fnamemodify(bufname(curbufnr), ":t:r")
"
"   let label = no . mod . sp .' '.curbufnr.' '. fname
"
"   return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
" endfunction "}}}
" set statusline=%F\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y[buffer:%n]%=\ (%v,%l)/%L%8P\
" if has('unix')
"   set cmdheight=2
" endif
 " }}}
"------------------------------------------------------------------------------
"スワップ, バックアップ保存場所 {{{
if !g:portable
    set backup
    "永続アンドゥ
    set undofile
    " アンドゥの保存場所(7.3)
    let &undodir = &directory
endif
" }}}
"""------------------------------------------------------------------------------
" etc  {{{
" 折り返ししない
set nowrap
inoremap # X<C-H>#
" #縺ｧ陦碁?ｭ縺ｫ鬟帙?ｰ縺ｪ縺?繧医≧縺ｫ
set shellslash
" ビープ音の代わりにビジュアルベルを使用
set visualbell
"タブ数
set tabpagemax=1000
" 折り返し検索をしない
set nowrapscan
"バッフォを隠れ状態にする
set hidden
"行番号表示
set number
"タイトル表示
set title
"コマンド表示
set showcmd
"ルーラー表示
set ruler
"デファルトでクリップボードを使用
if has('win32') || has('win64')
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif
set display=lastline
set ignorecase
set smartcase
set incsearch "<C-R><C-W>縺ｫ蠖ｱ髻ｿ
set wildmenu
" 陦後ｒ謚倥ｊ霑斐☆
set wrap
" 折り返された行を同じインデントで表示する
set breakindent
" 折り返し位置をbreakatに設定した文字のみにする
set linebreak
" 改行時にコメントしない
set formatoptions-=ro
" バッファを閉じる時にバッファリストから削除
" autocmd BufReadPre * setlocal bufhidden=delete
"竊?
"k
" 未保存でもバッファを移動できるようにする
set hidden
" サイン欄を常時表示
set signcolumn=yes
"日本語の括弧も%で移動できるように
set matchpairs+=「:」,（:）,『:』
" ベンチマーク用タイマー
command! -bar TimerStart let start_time = reltime()
command! -bar TimerEnd   echo reltimestr(reltime(start_time)) | unlet start_time
set scrolloff=5
command! TypeWriterToggle exec 'if &scrolloff==5 | set scrolloff=9999 | else | set scrolloff=5 | endif'

" 括弧を入力した際、カーソルが一瞬移動してしまう場合に設定
set matchtime=0
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
" }}}
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
	" Jediのポップアップ対策
	autocmd FileType python setlocal completeopt-=preview
" }}}
"-------------------------------------------------------------------------------------
" haskell {{{
	autocmd FileType haskell nnoremap <buffer> <F1> :Ref hoogle <C-R><C-W><CR>
" }}}
" --------------------------------------------------------------------------
" dos {{{
	" autocmd FileType dosbatch e ++enc=cp932
"   }}}
" --------------------------------------------------------------------------
" Asr {{{
	autocmd BufRead e:/Soft/Asr/Ubar/Kuma/Script/*.txt,e:/Soft/Asr/Ubar/Kuma/Bar/Favorite/*,e:/Soft/Asr/Ubar/Kuma/Bar/Launch/*	e ++enc=utf-16le
	autocmd BufRead e:/Softx64/Asr/Ubar/Kuma/Script/*.txt,e:/Softx64/Asr/Ubar/Kuma/Bar/Favorite/*,e:/Softx64/Asr/Ubar/Kuma/Bar/Launch/*	e ++enc=utf-16le
"   }}}
"   ------------------------------------------------------------------------
" help {{{
	autocmd BufRead $DOTVIM/bundle/.neobundle/doc/*.txt nnoremap <buffer> q :q<CR>
	autocmd FileType help nnoremap <buffer> q :q<CR>
"   }}}
"   ------------------------------------------------------------------------
" html {{{
	autocmd FileType html inoremap <M-n> <br><CR>
	autocmd FileType html inoremap < <><lEFT>
" }}}
"   ------------------------------------------------------------------------
" Text {{{
	autocmd FileType text setl textwidth=0
	autocmd FileType text setl nobreakindent
	" autocmd FileType text setl  list
	" autocmd FileType text setl  listchars=tab:^\ ,trail:~
	"不可視文字を表示
	" 連結マーカーがあれば自動整形を有効にする
	au BufRead,BufNewFile *.txt  silent! call JpSetAutoFormat()
	" スペルチェックをする(英語限定)
	if has('win32') || has('win64')
	  autocmd FileType text setl spelllang+=cjk
	  autocmd FileType text setl spell
	endif
" }}}
"   ------------------------------------------------------------------------
" howm {{{
	autocmd FileType qfix_memo setl textwidth=0
	autocmd FileType qfix_memo setl nobreakindent
	" autocmd FileType qfix_memo setl  list
	" autocmd FileType qfix_memo setl  listchars=tab:^\ ,trail:~
	" 連結マーカーがあれば自動整形を有効にする
	autocmd FileType qfix_memo silent! call JpSetAutoFormat()
" }}}
"   ------------------------------------------------------------------------
" snippet {{{
	autocmd FileType snippet setl foldmethod=marker
	autocmd FileType snippet setl noexpandtab
" }}}
"   ------------------------------------------------------------------------
" quickfix {{{
	autocmd FileType qf nnoremap <buffer> q :<C-u>close<CR>
	autocmd FileType qf nnoremap <buffer> <nowait> <ESC> :<C-u>close<CR>
	" autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif
" }}}
"  -------------------------------------------------------------------------
" extra {{{
	autocmd BufRead _vundlevim,_deinvim,_pluginvim,_includevim set filetype=vim
	" 常に開いているファイルと同じディレクトリをカレントディレクトリにする
	" 入力モード時、ステータスラインのカラーを変更
	" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
	" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
	autocmd FileType gitcommit nnoremap <buffer> <space>w :wq<CR>
	autocmd FileType gitcommit nnoremap <buffer> q :<C-u>close<CR>
	autocmd BufEnter * call s:MoveNowDir()
	function! s:MoveNowDir() " {{{
	" 常に開いているファイルと同じディレクトリをカレントディレクトリにする
		if isdirectory(expand("%:p:h"))
			" if getcwd() == expand("%:p:h") || getcwd() == expand("$VIM")
			exec ":cd ". expand("%:p:h")
			" endif
		endif
	endfunction "}}}
" }}}
"  -------------------------------------------------------------------------
augroup END
" }}}
"  -------------------------------------------------------------------------
"keymap {{{
"何故か設定されてるマップを解除
vunmap <C-x>
"---------------------------------------------------------------------------
nnoremap <silent> <F5> :e!<CR>
nnoremap <silent> <F6> :tabe<CR>
nnoremap <silent> <F7> :tabe<CR>:tabonly!<CR>
nnoremap <silent> <Space>w :w<CR>
nnoremap <C-W>, :copen<CR>
" nnoremap <C-W>l :lopen<CR>
"-------------------------------------------------------------------------------------
" session"{{{
" nnoremap <Space>ss :mksession! $DOTVIM/session/temp<CR>
" nnoremap <Space>sl :source $DOTVIM/session/temp<CR>
" nnoremap <Space>mks :mksession! $DOTVIM/session/
" nnoremap <Space>so :source $DOTVIM/session/"}}}
"-------------------------------------------------------------------------------------
" カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p> {{{
" キーボードマクロには物理行移動を推奨
" h l は行末、行末を越えることが可能に設定(whichwrap)
set backspace=indent,eol,start
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap j gj
nnoremap k gk
inoremap <Down> <C-O>gj
inoremap <Up>   <C-O>gk
xnoremap <Down> gj
xnoremap <Up>   gk
xnoremap j gj
xnoremap k gk
"l を <Right>に置き換えて、折りたたみ行 l で開くことができるようにする
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif " }}}
"---------------------------------------------------------------------------
nnoremap <C-W>Q :tabclose<CR>
"---------------------------------------------------------------------------
" 現在のタブを右へ移動 {{{
nnoremap <Tab>l :MyTabMoveRight<CR>
" 現在のタブを左へ移移
nnoremap <Tab>h :MyTabMoveLeft<CR>

command! -count=1 MyTabMoveRight call MyTabMove(<count>)
command! -count=1 MyTabMoveLeft  call MyTabMove(-<count>)
function! MyTabMove(c)
  let current = tabpagenr()
  let max = tabpagenr('$')
  let target = current + a:c
  let target = target > max ? target % max :
             \ target < 0   ? target % max + max :
             \ target
  let target = target == 0 ? max :
	     \ target
  let target = target <= current ? target - 1 :
	     \ target
  execute ':tabmove ' . target
endfunction " }}}
"-------------------------------------------------------------------------------------
"括弧等を補完 {{{
inoremap " ""<C-g>U<LEFT>
inoremap ' ''<C-g>U<LEFT>
inoremap ( ()<C-g>U<LEFT>
" inoremap < <><C-g>U<LEFT>
inoremap [ []<C-g>U<LEFT>
inoremap { {}<C-g>U<LEFT>
inoremap 「 「」<C-g>U<LEFT>
inoremap 『 『』<C-g>U<LEFT>

"augroup kakko
	"autocmd!
	"autocmd FileType	cpp,d,renpy,kirikiri inoremap <buffer> " ""<C-g>U<LEFT>
	"autocmd FileType	vim,snippet,cpp,d,renpy,kirikiri inoremap <buffer> ' ''<C-g>U<LEFT>
	"autocmd FileType	vim,snippet,cpp,d,renpy,kirikiri inoremap <buffer> ( ()<C-g>U<LEFT>
	"autocmd FileType	vim,snippet,cpp,d,renpy,kirikiri inoremap <buffer> [ []<C-g>U<LEFT>
	"autocmd FileType	vim,snippet inoremap <buffer> { {}<C-g>U<LEFT>
	"autocmd FileType	cpp inoremap <buffer> { <CR>{<CR>}<Up><CR>
"augroup END " }}}
"-------------------------------------------------------------------------------------
"ビジュアルモードでのインデント操作を楽に
xnoremap < <gv
xnoremap > >gv
"-------------------------------------------------------------------------------------
"検索で勝手に飛ばないようにする
"nnoremap * *N
"nnoremap # #N
"-------------------------------------------------------------------------------------
"検索後画面の中央に移動
" nmap n nzz
" nmap N Nzz
"-------------------------------------------------------------------------------------
"ハイライト停止
"nnoremap <ESC><ESC> :nohlsearch<CR>
"-------------------------------------------------------------------------------------
"終了
" nnoremap <F1> :qa!<CR>
" nnoremap <F2> :wqa<CR>
"-------------------------------------------------------------------------------------
" タブ移動
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
"-------------------------------------------------------------------------------------
";と;を入れ替える
nnoremap : ;
nnoremap ; :
xnoremap : ;
xnoremap ; :
" nnoremap q; q:
"-------------------------------------------------------------------------------------
" insertmode
" 貼り
inoremap <C-v> <C-g>u<C-r>*
" Undo/Redo vimは下記二つの判別が出来ない模様多分今後も対応なし Neovimでは可能...なんでさ
inoremap <C-S-z> <C-O><C-r> 
inoremap <C-z> <C-O>u
" 後削除
inoremap <C-k>  <C-g>u<C-O>D
inoremap <C-u>  <C-g>u<C-u>
" 前一文字削除
" inoremap <C-G> <C-g>u<Del>
" 一行削除
" inoremap <C-CR> <C-g>u<End><C-U><Del>
" Undo 区切り プログラミングでは邪魔?
" inoremap <CR> <C-g>u<CR>
" inoremap <Space> <Space><C-g>u
" inoremap .  .<C-g>u
" inoremap ,  ,<C-g>u
" inoremap 。 。<C-g>u
" inoremap 、 、<C-g>u

"-------------------------------------------------------------------------------------
"\から/へ置換
xnoremap <silent> <Leader>/ :s/\\/\//g<CR>:nohlsearch<CR>
nnoremap <silent> <Leader>/ :s/\\/\//g<CR>:nohlsearch<CR>
"-------------------------------------------------------------------------------------
"/から\へ置換
xnoremap <silent> <Leader><Leader> :s+/+\\+g<CR>:nohlsearch<CR>
nnoremap <silent> <Leader><Leader> :s+/+\\+g<CR>:nohlsearch<CR>
"-------------------------------------------------------------------------------------
"コマンドモード
cnoremap <C-V> <C-r>*
cnoremap <C-@> \(.\{-\}\)
"------------------------------------------------------------------------------
"help用設定 {{{
nnoremap ,h :h<space>
augroup helpgroup
	autocmd!
	autocmd BufRead *.jax	nnoremap <buffer> q :close<CR>
	autocmd BufRead *.help	nnoremap <buffer> q :close<CR>

	autocmd FileType cpp	nnoremap <silent><buffer> ,c :set noincsearch<CR>:split $HELP/C/<C-R><C-W>.help<CR><C-D>:set incsearch<CR><CR>
		\ | nnoremap <silent><buffer> ,stl :set noincsearch<CR>:split<CR>:silent grep ^<C-R><C-W> $HELP/STL/*.help<CR>:set incsearch<CR><CR>
		\ | nnoremap <silent><buffer> ,dx :set noincsearch<CR>:split<CR>:silent grep 螳｣險.*<C-R><C-W>.*; $HELP/DxLib/*.help<CR>:set incsearch<CR><CR>
		\ | nnoremap <silent><buffer> ,sd :set noincsearch<CR>:split<CR>:silent grep TITLE\s:\s<C-R><C-W> $HELP/SDL/*.help<CR>:set incsearch<CR><CR>

	autocmd BufRead C_Library.help	nnoremap <silent><buffer> <S-k> :set noincsearch<CR>:e $HELP/C/<C-R><C-W>.help<CR><C-D>:set incsearch<CR><CR>
	autocmd BufRead	dxfunc1_index.help,dxfunc2_index.help,dxfunc3_index_3D.help	noremap <silent><buffer> <S-k> :set noincsearch<CR>:silent grep 螳｣險.*<C-R><C-W>.*; $HELP/DxLib/*.help<CR>:set incsearch<CR><CR>
	autocmd BufRead	audio.help,cdrom.help,event.help,general.help,joystick.help,thread.help,time.help,video.help,wm.help	nnoremap <silent><buffer> <S-k> :set noincsearch<CR>:silent grep TITLE\s:\s<C-R><C-W> $HELP/SDL/*.help<CR>:set incsearch<CR><CR>

augroup END

command! Closemap call s:Closemap()

function! s:Closemap()
nnoremap <silent> <buffer> q :close<CR>
endfunction " }}}
"------------------------------------------------------------------------------
"grep {{{
if has('win32') || has('win64')
	set grepprg=jvgrep\ -I
	" let $JVGREP_ENCODINGS = 'utf-8,sjis,euc-jp,utf-16le,utf-16be,iso-2022-jp'
	" let $JVGREP_OUTPUT_ENCODING = 'utf-8'
	" set grepprg=grep\ -nH
endif
"自動でQuickfixを開く
" autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif
"Quickfix用設定
"autocmd FileType qf nnoremap <buffer> q :ccl<CR>
"Quickfix
"noremap <C-w>, :copen<CR> " }}}
"-----------------------------------------------------------------------------
"連番機能 {{{
nnoremap <silent> co :ContinuousNumber <C-a><CR>
xnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"十進数優先にする。必要ならset nf=octal,hex
set nf=alpha " }}}
"------------------------------------------------------------------------------
"挿入 {{{
ab <expr> lin repeat('-',80 - col('.'))
" }}}
"------------------------------------------------------------------------------
"}}}
"------------------------------------------------------------------------------
"" 外部ファイル読み込み {{{
source $DROPBOX/_includevim
" source $DROPBOX/_deinvim
source $DROPBOX/_vimplug
source $DROPBOX/_pluginvim
" source $DROPBOX/_vundlevim
" }}}
"-------------------------------------------------------------------------------------
"上書きされそうな設定{{{
set whichwrap=b,s,h,l,<,>,[,]
"日本語の行を連結時には空白を入力しない
set formatoptions+=mM
"}}}
"-------------------------------------------------------------------------------------
" OutDate {{{
"-------------------------------------------------------------------------------------
"{{{EDGAR
"ウィンドウを上下2つに分け下にEDGAR, 上を出力ファイルにする。出力ファイルの末尾に空行をつくり、行数-1をendlineとする
" 80	-180
" 80	-179
" 80	-178
" 80	-177
" (末尾にも空行)
" ""==============================
" (先頭にも空行)
" 80.0	-172.3	2.69497e-4
" 80.0	-172.2	5.17161e-4
" 80.0	-172.1	6.69446e-4
" 80.0	-172.0	7.84300e-4
" 80.0	-171.9	8.76755e-4
" function EDGAR()
"     while getline(line('.')) != ""
"         let l:target = split(getline(line('.')))
"         if (-180 <= l:target[1] && l:target[1] <= -140) || (40 <= l:target[1] &&  l:target[1] <= 179)
"             execute "normal \<C-w>j"
" 	    call cursor(1,1)
" 	    if l:target[0] >0
" 		let l:lat = string(l:target[0]-1)."\\.\\d*"
" 	    elseif l:target[0] == 0
" 		let l:lat = "-".string(l:target[0])."\\.\\d*"
" 	    else
" 		let l:lat = string(l:target[0])."\\.\\d*"
" 	    endif
"
" 	    if l:target[1] >=0
" 		let l:lon = string(l:target[1])."\\.\\d*"
" 	    else
" 		let l:lon = "\\(".string(l:target[1])."\\.0\\|".string(l:target[1]+1)."\\.[^0]\\)\\d*"
" 	    endif
"
" 	    while 1
"             let l:search_result = search(substitute("^".l:lat."\t".l:lon."\t", "'", "", "g"), "c")
"                 if l:search_result != 0
"                     let l:geted = split(getline(l:search_result))
"                     execute "normal \<C-w>kA\t(".l:geted[0].", ".l:geted[1].", ".l:geted[2].")\<Esc>\<C-w>jdd"
" 	        else
"                     execute "normal \<C-w>kj"
" 	            break
"                 endif
"             endwhile
" 	else
" 	    normal j
"         endif
"     endwhile
" endfunction
""}}}
"-------------------------------------------------------------------------------------
"蜀崎ｨｭ螳?"{{{
" command! Reset call s:Reset()
" nnoremap <silent> <F3> :Reset<CR>
"
" function! s:Reset()
" 	source ~/_vimrc
" 	source ~/_gvimrc
" endfunction"}}}
"-------------------------------------------------------------------------------------
" " gtags {{{
" noremap <C-G><C-T> :!gtags -v
" " 検索結果Windowを閉じる
" nnoremap <C-q> <C-w><C-w><C-w>q
" " Grep 準備
" nnoremap <C-G><C-G> :Gtags -g
" " このファイルの関数一覧
" nnoremap <C-G><C-l> :Gtags -f %<CR>
" " カーソル以下の定義場所を探す
" nnoremap <C-G><C-f> :Gtags <C-r><C-w><CR>
" " カーソル以下の使用場所を探す
" nnoremap <C-G><C-k> :Gtags -r <C-r><C-w><CR>
" " 次の検索結果
" nnoremap <C-G><C-n> :cn<CR>
" " 前の検索結果
" nnoremap <C-G><C-p> :cp<CR>
"  " }}}
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
" 	" 最後にこ???2つを設定す???
" 	let $PATH=s:msvc_2012_nov."/bin;".$PATH
" 	let $INCLUDE=s:msvc_2012_nov."/include;".$INCLUDE
" 	" Windows SDK?ｼ?or Platform SDK?ｼ滂ｼ?
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
" 	"蜈ｱ騾?
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
""繧ｳ繝ｳ繝代う繝ｫ {{{
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
" 		let l:start = matchend(l:line, '^.\{-}[^ ]') " インデントから???最初?????????
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
function! s:handler(ch, msg) abort
	caddexpr a:msg
	cwindow
endfunction

call setqflist([])
let s:job = job_start(
		    \   ['git', 'grep', '-n', 'word'],
		    \   {'out_cb': function('s:handler')})

" command! -nargs=* -complete=file MinimalDebugger :call s:MinimalDebugger(<f-args>)
" let g:debugger = 'gdb'
" function! s:MinimalDebugger(file)
" 	let nowbuf = bufnr('.')
" 	exec 'bel terminal '.g:debugger.' '.a:file
" 	buffer nowbuf
" endfunction
"}}}
"
"-------------------------------------------------------------------------------------
" vim: nowrap foldmethod=marker textwidth=0
