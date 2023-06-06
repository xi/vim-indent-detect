function! detectindent#Set(expandtab, ...)
	let &l:expandtab = a:expandtab
	let l:width = get(a:, 1, g:detectindent_preferred_indent)

	let &l:tabstop = l:width
	let &l:shiftwidth = l:width
	let &l:softtabstop = l:width
endfunction

function! detectindent#Detect()
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
