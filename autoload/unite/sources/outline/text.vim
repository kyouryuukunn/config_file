"ロワ向け-----------------------------------------------------------------------------
function! unite#sources#outline#text#outline_info()
  return s:outline_info
endfunction

let s:outline_info = {
		\ 'heading' :
		\'
		\◆[a-zA-Z0-9]
      		\\|オープニング
		\\|第[0-1]*章
		\\|^\*\+
		\\|^\.\+
		\'
      \}
"先頭の*または.(VerticalEditor,howm)の数で字下げ------------------------------------------------------------------------ 
function! s:outline_info.create_heading(which, heading_line, matched_line, context)
	" *の連続繰り返し数カウント
	let l:levelresult = matchend(a:matched_line, '^\*\+')
	" .の連続繰り返し数カウント
	if l:levelresult <= 0
		let l:levelresult = matchend(a:matched_line, '^\.\+')
	endif
	" それ以外
	if l:levelresult <= 0
		let l:levelresult = 1
	endif

	let heading = {
		\ 'word' : a:matched_line,
		\ 'level': l:levelresult,
		\ 'type' : 'generic',
        \ }
	return heading
endfunction
