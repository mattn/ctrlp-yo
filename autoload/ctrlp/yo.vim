if exists('g:loaded_ctrlp_yo') && g:loaded_ctrlp_yo
  finish
endif
let g:loaded_ctrlp_yo = 1

let s:yo_var = {
\  'init':   'ctrlp#yo#init()',
\  'exit':   'ctrlp#yo#exit()',
\  'accept': 'ctrlp#yo#accept',
\  'lname':  'yo',
\  'sname':  'yo',
\  'type':   'yo',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:yo_var)
else
  let g:ctrlp_ext_vars = [s:yo_var]
endif

function! ctrlp#yo#init()
  return map(filter(split(system('yo --generators'), "\n"), 'v:val =~# "^  \\S"'), 'trim(v:val)')
endfunction

function! ctrlp#yo#accept(mode, str)
  call ctrlp#exit()
  exe 'terminal' 'yo' fnameescape(a:str)
endfunction

function! ctrlp#yo#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#yo#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
