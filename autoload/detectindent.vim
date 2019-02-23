function! detectindent#Set(...)
	if a:0 < 1
		let &l:expandtab = g:detectindent_preferred_expandtab
	else
		let &l:expandtab = a:1
	endif

	if a:0 < 2
		let l:width = g:detectindent_preferred_indent
	else
		let l:width = a:2
	endif

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

	call detectindent#Set()
endfunction
