"‹g—¢‹g—¢tjs-------------------------------------------------------------------------
function! unite#sources#outline#tjs#outline_info()
  return s:outline_info
endfunction

let s:outline_info = {
		\ 'heading' : 
		\'
		\\|^\s*function
		\\|^\s*class
		\'
      \}

