function! detectindent#Set(expandtab, ...)
	let &l:expandtab = a:expandtab
	let l:width = get(a:, 1, &g:shiftwidth)

	let &l:tabstop = l:width
	let &l:shiftwidth = l:width
	let &l:softtabstop = -1
endfunction

function! detectindent#Detect()
	if get(b:, 'editorconfig_applied', 0)
		return
	endif

	let l:n = 1

	while l:n <= 50
		let l:line = getline(n)

		if l:line =~ '^	'
			call detectindent#Set(0)
			return
		elseif l:line =~ '^  '
			call detectindent#Set(1, strlen(matchstr(l:line, '^ \+')))
			return
		endif

		let l:n = l:n + 1
	endwhile
endfunction
