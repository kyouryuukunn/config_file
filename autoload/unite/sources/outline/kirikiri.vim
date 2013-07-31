"‹g—¢‹g—¢kag-------------------------------------------------------------------------
function! unite#sources#outline#kirikiri#outline_info()
  return s:outline_info
endfunction

let s:outline_info = {
		\ 'heading' : 
		\'
		\^\*.*
		\\|^@macro
		\\|^[macro
		\\|^@iscript
		\\|^[iscript
		\\|^\s*function
		\\|^\s*class
		\'
      \}

