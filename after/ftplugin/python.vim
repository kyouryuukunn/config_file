if g:jedi#popup_on_dot
  inoremap <buffer> . .<C-R>=pumvisible() ? "\<lt>C-X>\<lt>C-O>\<lt>C-P>" : ""<CR>
end
