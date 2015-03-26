"��������-----------------------------------------------------------------------------
function! unite#sources#outline#qfix_memo#outline_info()
  return s:outline_info
endfunction

let s:outline_info = {
		\ 'heading' :
		\'^\*\+
		\\|^\.\+
		\\|^= 
		\'
      \}
"�擪��*�܂���.(VerticalEditor,howm)�̐��Ŏ�����------------------------------------------------------------------------ 
function! s:outline_info.create_heading(which, heading_line, matched_line, context)
	" *�̘A���J��Ԃ����J�E���g
	let l:levelresult = matchend(a:matched_line, '^\*\+')
	" .�̘A���J��Ԃ����J�E���g
	if l:levelresult <= 0
		let l:levelresult = matchend(a:matched_line, '^\.\+')
	endif
	" ����ȊO
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
