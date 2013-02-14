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
		\\|^\s*\*\+
		\\|^\s*[0-9]*\.
		\'
      \}
"*の数で字下げ------------------------------------------------------------------------ 
function! s:outline_info.create_heading(which, heading_line, matched_line, context)
	let x = stridx(a:matched_line,"\*")
	let y = stridx(a:matched_line,"^\s*[0-9]*\.")
	if x == -1 && y == -1
		let levelresult = 1
	elseif x != -1
		let levelresult = 0
		while x != -1
			let levelresult += 1
			let x = stridx(a:matched_line,"\*", x + 1)
		endwhile
	elseif y != -1
		let y = stridx(a:matched_line,"\.")
		let levelresult = 0
		while y != -1
			let levelresult += 1
			let y = stridx(a:matched_line,"\.", y + 1)
		endwhile
	endif

	let heading = {
		\ 'word' : a:matched_line,
		\ 'level': levelresult,
		\ 'type' : 'generic',
        \ }
	return heading
endfunction

