let g:detectindent_preferred_indent = 2
let g:detectindent_preferred_expandtab = 0

function! SetIndent(...)
	if a:0 < 1
		let &l:expandtab = g:detectindent_preferred_expandtab
	else
		let &l:expandtab = a:1
	endif

	if a:0 < 2
		let width = g:detectindent_preferred_indent
	else
		let width = a:2
	endif

	let &l:tabstop = width
	let &l:shiftwidth = width
	let &l:softtabstop = width
endfunction

function! DetectIndent()
	let n = 1

	while n <= 50
		let line = getline(n)

		if line =~ '^	'
			call SetIndent(0)
			return
		elseif line =~ '^ '
			call SetIndent(1, strlen(matchstr(line, '^ \+')))
			return
		endif

		let n = n + 1
	endwhile

	call SetIndent()
endfunction

command! -nargs=? Tabs call SetIndent(0, <f-args>)
command! -nargs=? Spaces call SetIndent(1, <f-args>)

autocmd BufNewFile,BufRead * call DetectIndent()
