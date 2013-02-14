"‹g—¢‹g—¢kag-------------------------------------------------------------------------
function! unite#sources#outline#renpy#outline_info()
  return s:outline_info
endfunction

let s:outline_info = {
		\ 'heading' : 
		\'
		\\|label .*:
		\\|^\s*def
		\\|^\s*class
		\'
      \}

